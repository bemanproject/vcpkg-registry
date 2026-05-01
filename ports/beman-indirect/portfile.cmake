vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/indirect
    REF "v0.1.0"
    SHA512 785264a63b48eee4b0efc7be4ef9ccf1145483bdf752dd4fdf0b0780fb210648c9afd2d22a707679374732c8217964a43dae402824a9631907225166393dc3ec
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_INDIRECT_BUILD_TESTS=OFF
        -DBEMAN_INDIRECT_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.indirect
    CONFIG_PATH lib/cmake/beman.indirect
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
