vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO bemanproject/exemplar
  REF ${VERSION}
  SHA512 78d85c7e976c0d80272c9ccdd2d1c71ac9c1fe6d0a23eaa1f36641051b70eec288879b63817068c64773353d674ed533d230e0cbd68fef97886f584eb2c4bb63
  HEAD_REF main
  PATCHES
    fix-export.patch
)

beman_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DBEMAN_EXEMPLAR_BUILD_TESTS=OFF
    -DBEMAN_EXEMPLAR_BUILD_EXAMPLES=OFF
)
beman_cmake_install()
beman_cmake_config_fixup(
  PACKAGE_NAME beman.exemplar
  CONFIG_PATH lib/cmake/beman.exemplar
)

file(REMOVE_RECURSE
  ${CURRENT_PACKAGES_DIR}/debug
  ${CURRENT_PACKAGES_DIR}/lib
)

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/LICENSE)
file(
  INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)
