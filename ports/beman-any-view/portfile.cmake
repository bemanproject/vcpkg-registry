vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/any_view
    REF "v1.1.0"
    SHA512 628645d4cf4855e05ed9ba2609899ccedb0618d4030d5dbd9aee2cfa38d9e2cbfa1fa038b886fd403b01c1739848060f12dff4f15522963a1f204ac9e2e54c27
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_ANY_VIEW_BUILD_TESTS=OFF
        -DBEMAN_ANY_VIEW_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.any_view
    CONFIG_PATH lib/cmake/beman.any_view
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
