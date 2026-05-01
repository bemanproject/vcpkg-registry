vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/cache_latest
    REF "v0.1.0"
    SHA512 4fb47d0cbbd653d8819f5ea338f1dd3f06f8e3a73e7083b2a2f28065b7e8b6fa3c143cc1d5584bfc21208f1e1ab850178b1e0cb7b9a0b3e689c2bf6f0dbe17fe
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_CACHE_LATEST_BUILD_TESTS=OFF
        -DBEMAN_CACHE_LATEST_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.cache_latest
    CONFIG_PATH lib/cmake/beman.cache_latest
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
