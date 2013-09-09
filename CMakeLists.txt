# CMakeLists.txt
# Date: 2013-09-09
# Author: Karsten Ahnert (karsten.ahnert@gmx.de)
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or
# copy at http://www.boost.org/LICENSE_1_0.txt)
#

set ( CMAKE_C_COMPILER "gcc-4.7" )
set ( CMAKE_CXX_COMPILER "g++-4.7" )
set ( CMAKE_CXX_FLAGS "-std=c++11" )

project ( numdiff )

cmake_minimum_required ( VERSION 2.8 )

# Add path for custom modules
set( CMAKE_MODULE_PATH
  ${CMAKE_MODULE_PATH}
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules
  )

include ( CreateVersionFile )

message ( STATUS "Building project ${CMAKE_PROJECT_NAME}" )
message ( STATUS "Version ${NUMDIFF_VERSION_SHORT}" )

find_package ( Boost REQUIRED )

include_directories ( ${Boost_INCLUDE_DIRS} )
include_directories ( ${CMAKE_CURRENT_SOURCE_DIR}/include )

add_subdirectory ( examples )
add_subdirectory ( test )



