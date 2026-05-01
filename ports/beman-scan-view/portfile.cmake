vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/scan_view
    REF "v0.1.0"
    SHA512 e971fd22943e29301f8022a7dfec220183b47e695c9ef2d2c07ca09ae726c8c212d7cf0832c3abce5b5643eb61b7e73a97c550aa672b41148f50f6f6122f64b2
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_SCAN_VIEW_BUILD_TESTS=OFF
        -DBEMAN_SCAN_VIEW_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.scan_view
    CONFIG_PATH lib/cmake/beman.scan_view
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
