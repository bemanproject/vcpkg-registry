vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/range_searcher
    REF "v0.2.0"
    SHA512 6a2093e922174a611704f92e3086e0b3f7aed3441a04758527cd48bb6594c03c3cca2036b1ce8083192a7f70fa20459a2f5aee3626d6746965ac70087dc0bfb0
    HEAD_REF main
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        modules   BEMAN_RANGE_SEARCHER_USE_MODULES
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DBEMAN_RANGE_SEARCHER_BUILD_TESTS=OFF
        -DBEMAN_RANGE_SEARCHER_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.range_searcher
    CONFIG_PATH lib/cmake/beman.range_searcher
)

if(NOT "modules" IN_LIST FEATURES)
    file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug"
        "${CURRENT_PACKAGES_DIR}/lib"
    )
endif()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
