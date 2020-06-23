# OpenOCD for Mac
## Installation
### Prequisites
- Xcode (install from the AppStore)
- Command Line Tools (install from Xcode 5 -> Preferences -> Downloads)
- [Homebrew](http://mxcl.github.io/homebrew/)

### Installing via Homebrew 
```
brew install openocd
brew install libtool automake libusb libusb-compat hidapi libftdi
```
### Installing Dependencies via GitHub
```
git clone https://github.com/espressif/openocd-esp32.git openocd
cd openocd
git submodule init
git submodule update
./bootstrap
./configure
make install
```
### Test that it works 
```
openocd --version
```
### Installing USB Drivers for FPGA
1. Download the Drivers for Mac OSX 10.4 Tiger or later [here](https://www.ftdichip.com/Drivers/D2XX/MacOSX/D2XX1.4.16.dmg)
2. Open the dmg file and open a terminal at the D2XX folder by 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Right Clicking -> New Terminal at Folder
  
3. If the directory /usr/local/lib directory doesnt exist, use

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`sudo mkdir /usr/local/lib`

4. If the directory /usr/local/include directory doesnt exist, use

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`sudo mkdir /usr/local/include`

5. Copy the following files into the directories you just created and create a link so OpenOCD can find them
```
sudo cp libftd2xx.1.4.16.dylib /usr/local/lib/
sudo cp ftd2xx.h /usr/local/include/ftd2xx.h
sudo cp WinTypes.h /usr/local/include/WinTypes.h
sudo ln -sf /usr/local/lib/libftd2xx.1.4.16.dylib /usr/local/lib/
```

## Usage
Included is a python script to program a .bit file to a Xilinx 7-Series FPGA. 

From the directory with digilent-nexys.cfg, use:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`python upload.py /Path/To/BitFile.bit`

The python file takes care of the rest. 
