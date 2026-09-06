# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/emplace_from
    REF "v1.0.0"
    SHA512 742036c96aa41904626c31c6388886c71735c16ddf453d6b36a5f3109572193f6b1719a3a1cf8fe07268d8becc385eca6c97b6f550c138cbed1982f4fe5ee39b
    HEAD_REF main
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        modules   BEMAN_EMPLACE_FROM_USE_MODULES
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DBEMAN_EMPLACE_FROM_BUILD_TESTS=OFF
        -DBEMAN_EMPLACE_FROM_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.emplace_from
    CONFIG_PATH lib/cmake/beman.emplace_from
)

if(NOT "modules" IN_LIST FEATURES)
    file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug"
        "${CURRENT_PACKAGES_DIR}/lib"
    )
endif()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
