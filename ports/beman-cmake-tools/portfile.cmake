if(VCPKG_CROSSCOMPILING)
  message(WARNING "beman-tools is a host-only port; please mark it as a host port in your dependencies.")
endif()

file(
  INSTALL
    "${CMAKE_CURRENT_LIST_DIR}/beman_cmake_build.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/beman_cmake_config_fixup.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/beman_cmake_configure.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/beman_cmake_install.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/vcpkg-port-config.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/copyright"
  DESTINATION
    "${CURRENT_PACKAGES_DIR}/share/${PORT}"
)

set(VCPKG_POLICY_CMAKE_HELPER_PORT enabled)
