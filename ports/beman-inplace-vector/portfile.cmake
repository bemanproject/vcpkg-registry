vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/inplace_vector
    REF "v0.1.0"
    SHA512 04d902ea613118769298cc9e4e85ecc64af7cb54379caad95a8b195e0e2e19a2ff25a44deefb22da8bdace817031fe04dc29485d953eaba6a5ccec1282f3b552
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_INPLACE_VECTOR_BUILD_TESTS=OFF
        -DBEMAN_INPLACE_VECTOR_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.inplace_vector
    CONFIG_PATH lib/cmake/beman.inplace_vector
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
