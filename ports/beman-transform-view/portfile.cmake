vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/transform_view
    REF "enolan_modules3"
    SHA512 fb24446f6f53a06c22ccded2c33d11ad0c0ddcbba31dbf6716e7d761a11e1078d7393eca3959eae218584525467118934deef3972c61b3c49dddfab43a681363
    HEAD_REF main
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        modules   BEMAN_TRANSFORM_VIEW_USE_MODULES
)

if("modules" IN_LIST FEATURES)
    list(APPEND FEATURE_OPTIONS -DCMAKE_CXX_STANDARD=23)
endif()

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

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
