# 0.2 - Install and configure a compiler

If you want to run your code, is important to compile it into machine code.

Installing and configuring a compiler may vary in different operating systems. Here's a detailed guide for Linux, Windows, and macOS (This guide will focus on GCC (GNU Compiler Collection):

## Linux

### 1. Installing a Compiler
Most Linux distributions come with GCC pre-installed. If it’s not installed, you can install the package  ``` gcc ``` using the package manager specific to your distribution.

### 2. Verifying Installation
Check if GCC is installed and verify the version:
```bash
gcc --version
```

### 3. Configuring the Compiler
GCC typically doesn't require much configuration. However, you might want to set environment variables for custom configurations.

- **~/.profile or /etc/environment**
  ```bash
  export CC=gcc
  ```

## Windows

### 1. Installing a Compiler
Windows does not come with a native compiler, so you need to install one. The most common choice is MinGW-w64.

- **Installing MinGW-w64:**
  - Download the MinGW-w64 installer from [MinGW-w64](https://mingw-w64.org/doku.php/download).
  - Run the installer and follow the instructions to install the base tools.
  - Ensure you add the installation path (e.g., `C:\mingw-w64\bin`) to your system's PATH environment variable.

Alternatively, you can use Microsoft Visual Studio, which comes with its own compiler:

- **Installing Visual Studio:**
  - Download and install Visual Studio from [Visual Studio Downloads](https://visualstudio.microsoft.com/downloads/).
  - During installation, select the "Desktop development with C++" workload.

### 2. Verifying Installation
Open Command Prompt and check the GCC version (if using MinGW-w64):
```cmd
gcc --version
```

Or for Visual Studio, open the "Developer Command Prompt for Visual Studio" and check the MSVC version:
```cmd
cl
```

### 3. Configuring the Compiler
For MinGW-w64, set environment variables if needed:
```cmd
setx PATH "%PATH%;C:\mingw-w64\bin"
```

For Visual Studio, configuration is handled through the IDE settings.

## macOS

### 1. Installing a Compiler
macOS comes with Clang, an LLVM-based compiler, as part of the Xcode Command Line Tools.

- **Installing Xcode Command Line Tools:**
  ```bash
  xcode-select --install
  ```

Alternatively, you can install the full Xcode IDE from the App Store, which includes additional tools and a GUI.

### 2. Verifying Installation
Check if Clang is installed and verify the version:
```bash
clang --version
```

### 3. Configuring the Compiler
Similar to GCC on Linux, Clang usually requires minimal configuration. However, you can set environment variables as needed:

- **Setting Environment Variables:**
  ```bash
  export CC=clang
  export CXX=clang++
  ```

Add these lines to your shell initialization file (E.G. `~/.bash_profile` on Bash or `~/.zshrc` on Zsh) to make the changes permanent.

## Summary

- **Linux:** Use the package manager to install GCC, and set environment variables if needed.
- **Windows:** Use MinGW-w64 or Visual Studio, and ensure the PATH environment variable includes the compiler's binary path.
- **macOS:** Install Xcode Command Line Tools or Xcode, and configure Clang through environment variables if necessary.

By following these steps, you can successfully install and configure a compiler on your respective operating system, enabling you to compile and build applications efficiently.