vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/elide
    REF "v0.1.0"
    SHA512 8a7218495d3119b29b6ab69dcdace87a780560b37ad7aec8b36c326ca973b4ba60f841963b418c6e21473cf40deed37cbbd92ca86e029b99909241f5d3d392a1
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_ELIDE_BUILD_TESTS=OFF
        -DBEMAN_ELIDE_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.elide
    CONFIG_PATH lib/cmake/beman.elide
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
