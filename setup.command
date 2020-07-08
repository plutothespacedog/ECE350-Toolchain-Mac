#!/bin/sh

#  setup.sh
#  
#
#  Created by Oliver Adolfo Rodas on 7/8/20.
#  

echo "Starting Installation"
echo "Installing Homebrew"
brew --version > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Already Satisfied"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo
echo "Installing OpenOCD"
openocd --version > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Already Satisfied"
else
    brew install --HEAD openocd
fi

echo
echo "Installing USB Drivers"
[ ! -d "/usr/local/lib" ] && sudo mkdir /usr/local/lib
[ ! -d "/usr/local/include" ] && sudo mkdir /usr/local/include
[ ! -f "/usr/local/include/ftd2xx.h" ] && sudo cp ftd2xx.h /usr/local/include/ftd2xx.h
[ ! -f "/usr/local/include/WinTypes.h" ] && sudo cp WinTypes.h /usr/local/include/WinTypes.h
if [ ! -f "/usr/local/lib/libftd2xx.1.4.16.dylib" ]; then
    sudo cp libftd2xx.1.4.16.dylib /usr/local/lib/libftd2xx.1.4.16.dylib
    sudo ln -sf /usr/local/lib/libftd2xx.1.4.16.dylib /usr/local/lib/libftd2xx.1.4.16.dylib
fi

echo
echo "Installing Icarus Verilog"
iverilog -V > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Already Satisfied"
else
    brew install icarus-verilog
fi

echo
echo "Installing GTKWave"
if [ ! -d "/Applications/gtkwave.app" ]; then
    cp -r GTKwave.app /Applications
    echo 'alias gtkwave="open -a gtkwave"' >> ~/.bash_profile
    source ~/.bash_profile
    gtkwave
    open "x-apple.systempreferences:com.apple.preference.security?General"
else
    echo "Already Satisfied"
fi
