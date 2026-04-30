vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/utf_view
    REF "v0.1.0"
    SHA512 7c843a13e1216f8ee0677d45f42b1cc80944fa1f063a3a60346e7f889821fa81b1cdb0c872fd4a042305148c4f74b758b496b960a007156143d343c7a7c0e44e
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_UTF_VIEW_BUILD_TESTS=OFF
        -DBEMAN_UTF_VIEW_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.utf_view
    CONFIG_PATH lib/cmake/beman.utf_view
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
