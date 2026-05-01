vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/timed_lock_alg
    REF "v1.1.0"
    SHA512 0311af1e8c92e7b92bc31bb6c2fa199deb7347ca2e083905859e9bb2f665239876cc62ecdef0e3a17e1499bb832d122f93a994c7a4eee5cfb85d2cb62ebcf908
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_TIMED_LOCK_ALG_BUILD_TESTS=OFF
        -DBEMAN_TIMED_LOCK_ALG_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.timed_lock_alg
    CONFIG_PATH lib/cmake/beman.timed_lock_alg
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
