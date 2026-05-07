vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/monadics
    REF "v1.0.0"
    SHA512 01f3b11e9c0e1647c65ba27149286b8dccedbfaabc8e2d6e5776f74aea2ab00d774e68d1563cc191b52933f4be23042e5fdeb13f35c4e95f536084ed6c447d2a
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_MONADICS_BUILD_TESTS=OFF
        -DBEMAN_MONADICS_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.monadics
    CONFIG_PATH lib/cmake/beman.monadics
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
