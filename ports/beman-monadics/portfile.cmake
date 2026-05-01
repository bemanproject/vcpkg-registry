vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/monadics
    REF "v0.1.0"
    SHA512 f66e4568a33ee6305b88cc7d744d568cb77adb8332a98b7079c19d877223a65bd7eff47adc9f2eb4646b6dfce92e047dfcf329e88c028e103fa3e377ce999e09
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
