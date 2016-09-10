project(hammer-bootstrap)
cmake_minimum_required(VERSION 3.0.2)

set (CMAKE_CXX_STANDARD 11)

IF(${CMAKE_CXX_COMPILER_ID} MATCHES "MSVC")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc")
ENDIF(${CMAKE_CXX_COMPILER_ID} MATCHES "MSVC")

if(CMAKE_COMPILER_IS_GNUCXX)
    add_compile_options(-Wno-deprecated-declarations)
endif()

add_subdirectory(dependencies)
add_subdirectory(hammer/core/build)
add_subdirectory(hammer/driver/build)
