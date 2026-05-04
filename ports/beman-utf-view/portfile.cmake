vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/utf_view
    REF "v0.2.0"
    SHA512 ba69c3330c9cc8d0a8d38d590b1b3c36747568472b1a35d90302b08730de752ee4d84fd39ee526b5f15bc72bf05e148633217f9d27624a8a0dae33482e25aa99
    HEAD_REF main
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        modules   BEMAN_UTF_VIEW_USE_MODULES
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DBEMAN_UTF_VIEW_BUILD_TESTS=OFF
        -DBEMAN_UTF_VIEW_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.utf_view
    CONFIG_PATH lib/cmake/beman.utf_view
)

if(NOT "modules" IN_LIST FEATURES)
    file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug"
        "${CURRENT_PACKAGES_DIR}/lib"
    )
endif()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
