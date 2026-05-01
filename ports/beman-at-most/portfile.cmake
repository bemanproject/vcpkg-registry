vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/at_most
    REF "v0.1.0"
    SHA512 252377a1c4f3f0bafdb9d541c482e6c3a3e2cd70661720752db09617db1853753addf0fcb02fb62ac6609803b6df2153bfdd699843ae31937dbaa50022b42800
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_AT_MOST_BUILD_TESTS=OFF
        -DBEMAN_AT_MOST_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.at_most
    CONFIG_PATH lib/cmake/beman.at_most
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
