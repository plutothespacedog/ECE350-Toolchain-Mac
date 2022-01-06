# ECE350 ToolChain Installation for Mac
## Quick Start
To run, double click on the setup.command file. Installation takes ~5 minutes to complete and may require your password to install some components. The script installs the following:
- Xcode Command Line Tools
- Homebrew
- OpenOCD
- USB FTDI Drivers
- Icarus Verilog 
- GTKWave

The repository includes a linter file for use with VSCode's popular Verilog extension. It is not automatically installed by the setup file, but the details are described below. 


If you wish to install the software yourself, follow the instructions below.

## Optional - Linter
If you use VSCode, the [most popular Verilog extension in the marketplace](https://marketplace.visualstudio.com/items?itemName=mshr-h.VerilogHDL) doesn't use the format that we use in the course to organize our files. If you wish to replace the linter file that comes with the that extension, you can do so by replacing the linter file with the following command, run from within the toolchain repository. 

1. Install [the extension](https://marketplace.visualstudio.com/items?itemName=mshr-h.VerilogHDL)
2. In a terminal window from within the Toolchain directory, enter 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`find ~/.vscode/extensions -name "mshr-h.veriloghdl-*" -exec cp IcarusLinter.js '{}'/out/src/linter/IcarusLinter.js \;`

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
1. In a terminal window, enter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`brew install --HEAD openocd`

If you would like to build the image yourself, the complete instructions are available [here.](http://openocd.org/documentation/) The repository for building the source is available [here.](https://sourceforge.net/p/openocd/code/ci/master/tree/)

The repository includes files necessary to use OpenOCD as well as a python wrapper to expedite the programming process.

### Installing Icarus Verilog
1. In a terminal window, enter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`brew install icarus-verilog`

If you would like to build the image yourself, the complete instructions are available [here.](https://iverilog.fandom.com/wiki/Installation_Guide#Installation_From_Source)

### Installing GTKWave
1. In a terminal window, enter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`brew install gtkwave`

## Known Errors
### libusb_claim_interface failed with LIBUSB_ERROR_ACCESS when using ./upload.sh
To fix this error. Open a terminal window and use the following commands
Unload the serial port driver

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`sudo kextunload -b com.FTDI.driver.FTDIUSBSerialDriver`

Unload Apple FTDI driver if applicable

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`sudo kextunload -b com.apple.driver.AppleUSBFTDI`

Test OpenOCD again

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`./upload.sh FileName`
