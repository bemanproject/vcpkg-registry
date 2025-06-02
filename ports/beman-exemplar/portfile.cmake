vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO bemanproject/exemplar
  REF ${VERSION}
  SHA512 492dea71e64f3ee08e502c8eda33697d30f9eb9c04f32b2e1f4ffad28a605448e47dd6242356033ce06fcc972d0816348d44cfb2bd0dead12dffffe3d9ab8e16
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
