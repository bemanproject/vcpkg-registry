vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO bemanproject/exemplar
  REF ${VERSION}
  SHA512 a73765939285b2f9a60b19958d0551f15688949651ef65a27f7dace2aa1436f41f7a8523d3439c419488c6eea043eb2e36000ac492189fc5422667886638a69f
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
