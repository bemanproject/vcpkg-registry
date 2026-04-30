vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/transform_view
    REF "v0.1.0"
    SHA512 9709c9e0d2252a20c40dd882e4d3f15db98817594f4b0542216fb4c646102bf6d6eeffab0fc10a57ecf01c794ed80208e1894137a92496b152b01afccecfb1aa
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_TRANSFORM_VIEW_BUILD_TESTS=OFF
        -DBEMAN_TRANSFORM_VIEW_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.transform_view
    CONFIG_PATH lib/cmake/beman.transform_view
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
