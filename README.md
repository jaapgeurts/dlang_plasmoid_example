# Example KDE Widget with a Dlang backend

## Motivation

I like to develop in D and as KDE user, I though at some point "I really would like to implement widgets with D as backend".
Then I searched for examples and howtos and did not find anything. I did find a Rust project example which was really helpful. Then I thought "It can't be that hard to do that", so ended up creating a PoC/this repo.

To get this to work, I basically merged code from three separate examples/project that solve parts of my problem.

I am standing here on the shoulders of giants so many thanks to:

- [KDE](https://github.com/KDE/plasma-framework)
- [DOtherSide](https://github.com/filcuc/dotherside)
- [Dqml](https://github.com/filcuc/dqml)
- [Simon Bummer's Rust example](https://github.com/brummer-simon/rust_plasmoid_example)
- [Cmake-d](https://github.com/dcarp/cmake-d)

Please note that both DOtherSide and Dqml have been adapted. Methods for plugin creation have been added.

## What does it do?

It is a click counter widget, manipulating a counter maintained in the dlang component.

## How does it work?

The D backend uses qmetaobject to register Dlang types as QML types as part of a QML extension plugin. These custom QML types can be used in plasma widgets.

The entire example is built via KDE CMake build scripts to install things in the correct locations.

# Build instructions

## Build instructions

It is assumed that D(GDC), QT and KDE develop requirements are met.
The following commands build and install the project.

Download and install cmake-d in a folders.
https://github.com/dcarp/cmake-d

NOTE: it currently only works with GDC. (LDC crashes on exit)

```
$ cd plugin
$ dub generate cmake
# Fix the files to match your project
$ cd ..
$ mkdir build
$ cd build
# to install in system location
$ DC=gdc cmake -DCMAKE_MODULE_PATH:PATH=/path/to/cmake-d ..
# to install in custom location
$ DC=gdc cmake -DCMAKE_INSTALL_PREFIX=~/<dstfolder>/ -DCMAKE_MODULE_PATH:PATH=/path/to/cmake-d ..
$ cmake --build .
$ cmake --install .
```

## Run contained environment

```
$ source ./prefix.sh # only if you used the install prefix in a custom location
$ plasmoidviewer -a org.kde.plasma.dlang.example
```
