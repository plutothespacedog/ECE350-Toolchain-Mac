# ECE350 ToolChain Installation for Mac
## Quick Start
To run, double click on the setup.command file. Installation takes ~5 minutes to complete and may require your password to install some components. The script installs the following:
- Xcode Command Line Tools
- Homebrew
- OpenOCD
- USB FTDI Drivers
- Icarus Verilog 
- GTKWave

If you wish to install the software yourself, follow the instructions below.

## Manual Installation
### Installing Homebrew
1. In a terminal window, enter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

### Installing Xcode Command Line Tools
Installing Homebrew will also install the Xcode Command Line Tools. You can install them using the Homebrew installer or manually yourself.
1. Install Xcode (install from the AppStore)
2. from Xcode -> Preferences -> Downloads

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or

1. In a terminal window, enter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`xcode-select --install`

### Installing OpenOCD
In a terminal window, enter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`brew install --HEAD openocd`

If you would like to build the image yourself, the complete instructions are available [here.](http://openocd.org/documentation/). The repository for building the source is available [here.](https://sourceforge.net/p/openocd/code/ci/master/tree/)

The repository includes files necessary to use OpenOCD as well as a python wrapper to expedite the programming process.

### Installing Icarus Verilog
In a terminal window, enter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`brew install icarus-verilog`

If you would like to build the image yourself, the complete instructions are available [here.](https://iverilog.fandom.com/wiki/Installation_Guide#Installation_From_Source)

### Installing GTKWave
1. Copy the gtkwave.app folder to your applications folder
2. Right click and select open

### Installing USB Drivers
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
