# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Author: Simon Brummer (simon.brummer@posteo.de)
# Modified: Jaap Geurts (jaap.geurts@gmail.com)
# Description: CMake file building the entire project.
# Adapted for D from Simon Brummer's Rust example

cmake_minimum_required(VERSION 3.24)

set(CMAKE_D_COMPILER, "gdc")

set(CMAKE_BUILD_TYPE Debug)

# We must explicitly indicate we're using the D language
# in the project declaration.  Listing other languages
# is fine.
project(plasma_dlang_backend C D)

set(QT_MIN_VERSION "5.15.2")
set(KF5_MIN_VERSION "5.93.0")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(GLOBAL_DMD_DEFS "-w -shared -fPIC")
set(GLOBAL_GCC_DEFS "-Wall -pedantic")

# Don't use add_definitions() with a mixed C + D project
# since that adds the same flags to both C and D builds.
# Also, the D linker preference is set to 40, which is
# higher than C++ (30) and C (10).  This causes CMAKE
# to use the D linker in mixed linking cases.
# Append our own definitions to the defaults.
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${GLOBAL_GCC_DEFS}")
set(CMAKE_D_FLAGS "${CMAKE_D_FLAGS} ${GLOBAL_DMD_DEFS}")


find_package(ECM ${KF5_MIN_VERSION} REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})


include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(FeatureSummary)

find_package(KF5 REQUIRED COMPONENTS
    Plasma
)

find_package(Qt5 CONFIG REQUIRED COMPONENTS
    Qml
    Gui
    Core
)

# Install plasmoid
plasma_install_package(package org.kde.plasma.dlang.example)

# Install qml plugin
add_subdirectory(plugin)

feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
