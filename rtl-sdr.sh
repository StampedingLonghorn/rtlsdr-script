#!/bin/bash

#Install prerequisites
sudo apt install libusb-1.0
sudo apt install git
sudo apt install cmake

#Navigate to Downloads folder to install program
cd Downloads

#Installation
git clone git://git.osmocom.org/rtl-sdr.git #download rtl-sdr software from Github
cd rtl-sdr #navigate to the newly created rtl-sdr folder
mkdir build #create a folder called Build
cd build #navigate to Build
cmake ../ -DINSTALL_UDEV_RULES=ON #cmake with option of not running rtl-sdr in sudo
make
sudo make install
sudo ldconfig

#Blacklisting previous DVB-T drivers
cd /etc/modprobe.d #navigate to Modprobe.d folder
echo -e "blacklist dvb_usb_rtl28xxu" | sudo tee -a /etc/modprobe.d/rtlsdr.conf #inserts text "blacklist dvb_usb_rtl28xxu" into newly created file rtlsdr.conf

#Readme ---

#To enable this script you must go into terminal and type:
#chmod +x ./rtl-sdr
#./rtl-sdr
