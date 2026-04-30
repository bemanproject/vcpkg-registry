vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/exemplar
    REF "${VERSION}"
    SHA512 43db705282a3fceb18ec1e60ee73a85e1b47252a2e0298b9d27303aee29a3c62a6b1906b53920f1de114c0713f8da77a2b2f4a0472af6ba7432a5d64208da182
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_EXEMPLAR_BUILD_TESTS=OFF
        -DBEMAN_EXEMPLAR_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.exemplar
    CONFIG_PATH lib/cmake/beman.exemplar
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
