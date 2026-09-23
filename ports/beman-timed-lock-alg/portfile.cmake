# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/timed_lock_alg
    REF "v1.2.0"
    SHA512 6765de90f9d3fc72ca856a29f0da68de17f004ccd1f6c94d6fe46719918b4f038e20063760a2c01b76d7e58fade983c914c39c1e18d6670319193022dd6d5a0b
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
