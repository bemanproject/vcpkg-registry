vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/range_searcher
    REF "v0.1.0"
    SHA512 64300d9696a8525b846a5427757d34bf78e6cc698da53bc04da2d4a84827e377bd1f9cd6ca69df83ff29629480d7a4f8b274f4d493d426fc826979a4df9bf27a
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_RANGE_SEARCHER_BUILD_TESTS=OFF
        -DBEMAN_RANGE_SEARCHER_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.range_searcher
    CONFIG_PATH lib/cmake/beman.range_searcher
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
