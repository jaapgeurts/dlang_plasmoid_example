# Specify Plugin install path.
# NOTE: The paths must match the module path specified in plugin/qmldir!
message(STATUS ${LIBRARY_OUTPUT_NAME})
install(TARGETS dlang_backend DESTINATION ${KDE_INSTALL_QMLDIR}/org/kde/plasma/private/dlang/backend)
install(FILES qmldir DESTINATION ${KDE_INSTALL_QMLDIR}/org/kde/plasma/private/dlang/backend)
