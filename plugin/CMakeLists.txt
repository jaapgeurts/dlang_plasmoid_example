# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Author: Simon Brummer (simon.brummer@posteo.de)
# Description: CMake file building the QML Plugin.


# run command to execute dub build
#set(CRATE dlang_backend)
#set(CRATE_ARTIFACT ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/lib${CRATE}.so)

execute_process(dub "build")


# Specify Plugin install path.
# NOTE: The paths must match the module path specified in plugin/qmldir!
install(FILES ${CRATE_ARTIFACT} DESTINATION ${KDE_INSTALL_QMLDIR}/org/kde/plasma/private/dlang/backend)
install(FILES qmldir DESTINATION ${KDE_INSTALL_QMLDIR}/org/kde/plasma/private/dlang/backend)
