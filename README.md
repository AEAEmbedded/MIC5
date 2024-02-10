# Microcontrollers - 5 RTOS

This is the course material for the MIC5 course teached on the Embedded Systems Engineer bachelor at HAN University of Applied Sciences. The MIC5 course is focussed around the usage of RTOS-es such as FreeRTOS. This repository mainly consists of demo's and lab exercises which aim to explain/learn certain RTOS concepts like queue's, mutexes and tasks.


Most of the material here was made by the teacher and did not include the option to contribute back to the course. To still make it possible to contribute back to this course and help other students (who are struggling with the terrible MCUXpresso software), this public git repository with some toolchain changes was created. 

## What has been changed
This version of the course material has:
- CMake compatibility (removing the dependency on MCUXpresso development IDE, allowing any IDE/Editor to be used)
- Clang-format formatting rules (helping the user bring structure in to the code automatically by using the IDE clang features)
- Changes to some include statements as they were not POSIX compliant (capital '.H' instead of '.h' includes)
- Backwards compatibility with the MCUXpresso IDE (meaning the material can still be used as it originally was)
- The option for students to contribute improvements back to the course material
- The option for students to privately clone this repo and keep it for their own MIC5 implementations with revision system (as the SVN did not allow for this)


## Table of Contents
<!--ts-->
   * [Getting started](#Getting-started)
      * [Compiling with MCUXpresso](#compiling-with-mcuxpresso)
      * [Compiling with CMake](#Compiling-with-CMake)
        * [Setting up the development environment on Windows](#setting-up-the-development-environment-on-windows)
        * [Setting up the development environment on Linux](#setting-up-the-development-environment-on-linux)
        * [VSCode setup](#vscode)
      * [License](#License)
<!--te-->

---
## Getting started
There are two ways to compile and run the demo's:
1. By using MCUXpresso
2. By using CMake

### Compiling with MCUXpresso
[See the pdf `MIC5 Week 1 Lab.pdf` in the opdrachten_assignments folder](opdrachten_assignments/MIC5%20Week%201%20Lab.pdf).

### Compiling with CMake
CMake compatibility was at first not integrated in to the course material. Some efforts were made to make this possible, giving more freedom to the user to choose the IDE/editor of their liking. 

#### Setting up the development environment on Windows
The development with CMake on Windows requires the following tools:
- [CMake](https://cmake.org/download/) (It is highly recommended to install the .msi installer, to avoid having to mess with the PATH variable)
- [Ninja-build](https://github.com/ninja-build/ninja/releases) (Install it with pip)
- [GCC-ARM-NONE-EABI](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads) (Download: arm-gnu-toolchain-xx.x.xxxx-mingw-w64-i686-arm-none-eabi.exe, the latest version is recommended, **Always add to PATH! It is on the latest install wizard page, second checkbox!**)
- CMD line or IDE with CMake integration (this guide will use vscode)
##### CMake installation
Go to the CMake download page:
https://cmake.org/download/

Download and run the Windows x64 Installer with the .MSI extension.

**When asked to add the installed executable to the PATH variable, always select yes**.
Otherwise you will have to add it manually to path, or tell the IDE/CMD line where the CMake executable is located everytime you want to run the executable.

##### Ninja installation
Ninja can be installed easily by running: `pip install ninja`

This ofcourse requires you to have python with the pip package manager already installed on your system. But probably you will have to use pip anyway for other projects as it is used very frequently in python projects.

##### GCC-ARM Toolchain

> [!TIP]
>
> At the last page of the installation wizard is asked to add the executables to PATH (Second checkbox). **Always check this checkbox**! Having to mess with the PATH variable yourself in Windows is quite cumbersome to say the least :/ 

Download and install the arm-gnu-toolchain-xx.x.xxxx-mingw-w64-i686-arm-none-eabi.exe installer from the download page: https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

**Restart the computer now, to apply the changes to PATH**


 #### Setting up the development environment on Linux
 The development with CMake on Linux requires the following tools:
- [CMake](https://cmake.org/download/) (Install using the package manager!)
- [Ninja-build](https://github.com/ninja-build/ninja/releases) (Install using the package manager!)
- [GCC-ARM-NONE-EABI](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads) (Install using the package manager!)
- CMD line or IDE with CMake integration (this guide will use vscode)

##### Install with the package manager

The easiest way to install the required packages is by using the terminal with the distribution provided packagemanager:

**Ubuntu and Debian:**
```bash
sudo apt-get update && sudo apt-get install -y build-essential cmake ninja-build gcc-arm-none-eabi
```

**Fedora:**
```bash
sudo dnf makecache --refresh && sudo dnf -y install arm-none-eabi-gcc-cs cmake ninja-build
```

**SUSE:**
```bash
sudo zypper install -y cross-arm-none-eabi-gcc12 cross-arm-none-eabi-gcc12-lib cmake ninja-build
```

**Arch:**
```bash
sudo pacman -S cmake ninja arm-none-eabi-gcc
```

#### Vscode

You probably have this installed already, but do this if you have not installed it yet: https://code.visualstudio.com/

Open VSCode and install the [CMake Tools plugin from Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools), [C/C++ plugin from Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) and [C/C++ Extension Pack from Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack). 

Now you are set! Let's open the first project:

Select `File->Open Folder ... [Ctrl+K Ctrl+O]` then select the folder `workspace->Week1-Example01` to open the first example.

CMake build tools will probably ask you to configure the project, select Yes. 

It will ask you for the Toolkit, select the scan for toolkits option if no newer version than gcc-arm-none-eabi-12 is listed, so that it will scan for all available compilers on your computer and add your freshly installed GCC-ARM toolchain to the list.

Now that the CMake plugin has scanned for kits, it probably does not ask again which kit to use. But we still want to specify the gcc-arm-none-eabi-12+ compiler as our compiler, therefore we have to launch that menu manually and select the compiler. **`Ctrl+Shift+P` + CMake: Select a kit -> GCC xx.x.x arm-none-eabi**

It will probably ask you to always configure the project, select **No** (if yes, it will automatically configure **any** CMake project you open).



## License

The material seems to have a MIT license attached. Though the material is not owned by me. This repository is licensed Apache 2 though this might be subject to change :)

Though it is good to note that the changes made to the material are MIT licensed, such as all the CMake files.
