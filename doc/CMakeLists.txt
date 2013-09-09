# CMakeLists.txt
# Date: 2013-09-09
# Author: Karsten Ahnert (karsten.ahnert@gmx.de)
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or
# copy at http://www.boost.org/LICENSE_1_0.txt)
#


project ( PROJECT )
cmake_minimum_required ( VERSION 2.6 )

# Add path for custom modules
set( CMAKE_MODULE_PATH
  ${CMAKE_MODULE_PATH}
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules
  )

find_package ( Boost REQUIRED )

if ( CMAKE_COMPILER_IS_GNUCXX )
    set ( CMAKE_CXX_FLAGS "-std=c++0x" )        ## Optimize
endif ()

include_directories ( ${Boost_INCLUDE_DIRS} )


