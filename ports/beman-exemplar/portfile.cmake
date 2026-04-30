vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/exemplar
    REF "v2.3.0"
    SHA512 fcda16a81fc84d4e5f38b2c9743ab99d436200a257df8e9c57499f800fd7c1f4f51a95dcd6f6dabc360cd8ec763018848b37607eaacfab42b52239612533e45c
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
