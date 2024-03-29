# if(EXISTS "${CURRENT_BUILDTREES_DIR}/src/.git")
# file(REMOVE_RECURSE ${CURRENT_BUILDTREES_DIR}/src)
# endif()

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO google/fuzztest
  REF "6f4caf7abdd19a7f3b611789fa92a6be05b6c8f9"
  SHA512 1d8185278d3526c763ba7f102b4bdd773db03bc42a196f8fff0b5026f03057e878b835477ef70e937607b4016c513cc6d423533de640e49194abab1597058ac6
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"

  OPTIONS
  "-DFETCHCONTENT_FULLY_DISCONNECTED=OFF"

  # "-DFETCHCONTENT_FULLY_DISCONNECTED=ON"
  # "-DFETCHCONTENT_SOURCE_DIR_ABSEIL-CPPLIB=${SOURCE_PATH_ABSEIL}"
  # MAYBE_UNUSED_VARIABLES
  # "FETCHCONTENT_SOURCE_DIR_ABSEIL-CPPLIB"
)

vcpkg_cmake_install()

# vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")
# vcpkg_cmake_config_fixup()
vcpkg_fixup_pkgconfig()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# vcpkg_copy_pdbs()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
