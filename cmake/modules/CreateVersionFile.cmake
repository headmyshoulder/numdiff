find_package ( Git )

if ( NOT EXISTS "${CMAKE_SOURCE_DIR}/.git/" )
  return ()
endif ()

execute_process ( COMMAND git describe --abbrev=4 HEAD
                  COMMAND sed -e "s/-/./g"
                  OUTPUT_VARIABLE NUMDIFF_GIT_VERSION
                  OUTPUT_STRIP_TRAILING_WHITESPACE )
                  
execute_process ( COMMAND git status -uno -s 
                  OUTPUT_VARIABLE NUMDIFF_GIT_STATUS 
                  OUTPUT_STRIP_TRAILING_WHITESPACE )


string ( REGEX REPLACE "^v([0-9]+)\\..*" "\\1" NUMDIFF_VERSION_MAJOR "${NUMDIFF_GIT_VERSION}" )
string ( REGEX REPLACE "^v[0-9]+\\.([0-9]+).*" "\\1" NUMDIFF_VERSION_MINOR "${NUMDIFF_GIT_VERSION}" )
string ( REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.([0-9]+).*" "\\1" NUMDIFF_VERSION_PATCH "${NUMDIFF_GIT_VERSION}" )
string ( REGEX REPLACE "^v[0-9]+\\.[0-9]+\\.[0-9]+.(.*)" "\\1" NUMDIFF_VERSION_SHA1 "${NUMDIFF_GIT_VERSION}" )

if ( ${NUMDIFF_VERSION_PATCH} STREQUAL ${NUMDIFF_GIT_VERSION} )
  set ( NUMDIFF_VERSION_PATCH "0" )
  set ( NUMDIFF_VERSION_SHA1 "0" )
endif ()

math ( EXPR NUMDIFF_VERSION_PATCH "${NUMDIFF_VERSION_PATCH} + 1" )

set ( NUMDIFF_VERSION_SHORT "${NUMDIFF_VERSION_MAJOR}.${NUMDIFF_VERSION_MINOR}.${NUMDIFF_VERSION_PATCH}" )

# message ( STATUS "${NUMDIFF_VERSION_MAJOR}" )
# message ( STATUS "${NUMDIFF_VERSION_MINOR}" )
# message ( STATUS "${NUMDIFF_VERSION_PATCH}" )
# message ( STATUS "${NUMDIFF_VERSION_SHA1}" )
# message ( STATUS "${NUMDIFF_VERSION_SHORT}" )

if ( NOT ( NUMDIFF_GIT_STATUS STREQUAL "" ) )

  message ( STATUS "generating new config_version.hpp" )
  configure_file ( ${CMAKE_SOURCE_DIR}/include/numdiff/config_version.hpp.cmake ${CMAKE_SOURCE_DIR}/include/numdiff/config_version.hpp )

endif ()

