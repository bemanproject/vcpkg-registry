vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/indices_view
    REF "v0.1.0"
    SHA512 621881815d6c2c3c4e4c946958ce2c203b05392c7254f009dced7551fdb3a20f95dcf34dba67e3e58eddfaf827d34f6ab557faea9df27377232b672d57af98b3
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_INDICES_VIEW_BUILD_TESTS=OFF
        -DBEMAN_INDICES_VIEW_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.indices_view
    CONFIG_PATH lib/cmake/beman.indices_view
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
