# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/exemplar
    REF "v2.4.0"
    SHA512 9a46abf4718fdc9dc97552d23ec07219aef0b1dac1dc56a4b91cf900f662b169b26224246975aa39559b80a34ab55e1fab5f956358b8466fbb179f918a639e7b
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
