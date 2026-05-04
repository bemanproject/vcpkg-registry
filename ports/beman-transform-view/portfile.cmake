vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/transform_view
    REF "v0.2.0"
    SHA512 e4dc5584d7e4c05eda0fcaab2599d7db2cbf6739cb66059994f6e38145e6ce6d7f3c1e5b527f87f31d7090d081015214487df8557a057941fc362bf05e124fd4
    HEAD_REF main
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        modules   BEMAN_TRANSFORM_VIEW_USE_MODULES
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DBEMAN_TRANSFORM_VIEW_BUILD_TESTS=OFF
        -DBEMAN_TRANSFORM_VIEW_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.transform_view
    CONFIG_PATH lib/cmake/beman.transform_view
)

if(NOT "modules" IN_LIST FEATURES)
    file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug"
        "${CURRENT_PACKAGES_DIR}/lib"
    )
endif()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
