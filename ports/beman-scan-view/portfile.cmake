vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/scan_view
    REF "v0.2.0"
    SHA512 f75457b1a20de3944f6fb01c3d1c05a3166818483d76bc26c1fcb5c3e0e0a17e5d54cdabf9d64cd4b637e27bdc2542df85d78333f72bdecb832b442322138fb7
    HEAD_REF main
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        modules   BEMAN_SCAN_VIEW_USE_MODULES
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DBEMAN_SCAN_VIEW_BUILD_TESTS=OFF
        -DBEMAN_SCAN_VIEW_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.scan_view
    CONFIG_PATH lib/cmake/beman.scan_view
)

if(NOT "modules" IN_LIST FEATURES)
    file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug"
        "${CURRENT_PACKAGES_DIR}/lib"
    )
endif()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
