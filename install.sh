#!/bin/bash

script_version='v0.1'
output() {
printf "\E[0;33;40m"
echo $1
printf "\E[0m"ku
}

displayErr() {
echo
echo $1;
echo
exit 1;
}

source conf/functions.sh

hide_output sudo apt -y update
apt_install lsb-release figlet update-motd landscape-common update-notifier-common lolcat

 clear
figlet -f slant -w 100 "Saltpool Crypto Compiler" | lolcat -f

echo
echo -e "$GREEN************************************************************************$COL_RESET"
echo -e "$GREEN Crypto Compiler Install Script $script_version $COL_RESET"
echo -e "$GREEN Operating System: Ubuntu 22.04 $COL_RESET"
echo -e "$GREEN************************************************************************$COL_RESET"
echo
sleep 3

sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf

hide_output sudo apt -y upgrade
hide_output sudo apt -y autoremove
apt_install software-properties-common net-tools

# Installing packages to compile crypto currency:
echo
echo
echo -e "$CYAN => Installing Package to compile crypto currency $COL_RESET"
sleep 3

if [ "`lsb_release -d | sed 's/.*:\s*//' | sed 's/22\.04\.[0-9]/22.04/' `" == "Ubuntu 22.04 LTS" ]; then
apt_install software-properties-common build-essential
apt_install libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils git cmake libboost-all-dev zlib1g-dev libz-dev libseccomp-dev libcap-dev libminiupnpc-dev gettext
apt_install libminiupnpc17 libzmq5
apt_install libcanberra-gtk-module libqrencode-dev libzmq3-dev libminizip-dev
apt_install libqt5gui5 libqt5core5a libqt5webkit5-dev libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
apt_install libssh-dev libbrotli-dev
hide_output sudo add-apt-repository -y ppa:luke-jr/bitcoincore
hide_output sudo apt -y update
apt_install libdb4.8-dev libdb4.8++-dev libdb5.3 libdb5.3++

apt_install gcc-10 g++-10 -y
hide_output sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
hide_output sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 11
hide_output sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10
hide_output sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 11
hide_output sudo update-alternatives --set gcc /usr/bin/gcc-10
hide_output sudo update-alternatives --set g++ /usr/bin/g++-10 
else
        echo -e "$RED Aborting, wrong O/S. Must be Ubuntu 22.04."
        exit 1
fi
echo -e "$GREEN Done...$COL_RESET"

sudo sed -i 's/$nrconf{restart} = '"'"'a'"'"';/#$nrconf{restart} = '"'"'i'"'"';/g' /etc/needrestart/needrestart.conf

echo -e "$YELLOW***************************************************$COL_RESET"
echo -e "$YELLOW \e[1mINSTALLTION COMPLETE!!!  $COL_RESET"
echo -e "$YELLOW***************************************************$COL_RESET"
