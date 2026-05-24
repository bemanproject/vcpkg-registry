# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/exemplar
    REF "v2.4.1"
    SHA512 c2b7d2c06b6ca3ce832699c6b30653552b252fc1f17c4f464b8e10dd1fa9a41e112ee4409d6bfab3ceff7355081ad642186220a7f1035d30669f97f69cc1067e
    HEAD_REF main
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        modules   BEMAN_EXEMPLAR_USE_MODULES
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DBEMAN_EXEMPLAR_BUILD_TESTS=OFF
        -DBEMAN_EXEMPLAR_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.exemplar
    CONFIG_PATH lib/cmake/beman.exemplar
)

if(NOT "modules" IN_LIST FEATURES)
    file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug"
        "${CURRENT_PACKAGES_DIR}/lib"
    )
endif()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
