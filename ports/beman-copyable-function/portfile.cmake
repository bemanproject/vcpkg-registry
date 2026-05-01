vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/copyable_function
    REF "v0.1.0"
    SHA512 7aca39601a25bb897860de2060012617b85b478788217631e6d57beaba98de13adaa16ef1aad58819565c07a4adf60fc6848b1374cd636ea4ba047d7a5f9917f
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_COPYABLE_FUNCTION_BUILD_TESTS=OFF
        -DBEMAN_COPYABLE_FUNCTION_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.copyable_function
    CONFIG_PATH lib/cmake/beman.copyable_function
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
