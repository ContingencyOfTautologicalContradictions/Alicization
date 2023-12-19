# Project Alicization

The project Alicization aims to become a fast, reliable, secure, and clean C++ general-purpose framework.


# Requisites

- One of the following C++23 compilers (latest version preferable):

  - MSVC
  - Apple Clang
  - Clang
  - GCC

- Targeting one of the following operatng systems:
  
  - iOS
  - macOS
  - Android
  - Linux
  - Windows

- CMake 3.28.1

- Ninja 1.11


# Inclusion

At your CMake file, include the Alicization.cmake defined at the root folder of this project, and call the function ``Alicization`` with the former parameter as the project you you're compiling, the second parameter as a boolean indicating whether your project is on debug mode or not, and the latter parameter as a string indicating the target OS in the form of one of the following strings:

- "ios"
- "mac"
- "android"
- "linux"
- "windows"

A working example (say you have a CMakeLists.txt at the root folder of this project):

```cmake
cmake_minimum_required(VERSION 3.28.1)
include(Alicization.cmake)
set(ALICE_PROJECT my_executable)
project(${ALICE_PROJECT})
add_executable(${ALICE_PROJECT} my_main.cpp)
Alicization(${ALICE_PROJECT} False "windows")
```