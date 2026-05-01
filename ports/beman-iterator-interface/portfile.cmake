vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bemanproject/iterator_interface
    REF "v0.1.0"
    SHA512 8724943e326c629876093663240e54cfcaa42801632802be7ca784bfc3bc95afac27b0fca9c65f567ccba814bd78ac71615cc458c6423ad27e1db3fb4c45cd50
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBEMAN_ITERATOR_INTERFACE_BUILD_TESTS=OFF
        -DBEMAN_ITERATOR_INTERFACE_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    PACKAGE_NAME beman.iterator_interface
    CONFIG_PATH lib/cmake/beman.iterator_interface
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
