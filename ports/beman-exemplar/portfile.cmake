vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO bemanproject/exemplar
  REF ${VERSION}
  SHA512 43038e4a676c9c3993e5db0f00f7f7f92927074f72c1c96d37207f732a0b464e265ba2768e9c0fd040011ea24357c169996f5c4ffc0fdf754bbeb96ff4008a3f
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
