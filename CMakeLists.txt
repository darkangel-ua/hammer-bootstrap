project(hammer-bootstrap)
cmake_minimum_required(VERSION 3.0.2)

IF(${CMAKE_CXX_COMPILER_ID} MATCHES "MSVC")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc")
ENDIF(${CMAKE_CXX_COMPILER_ID} MATCHES "MSVC")

add_subdirectory(dependencies)
add_subdirectory(hammer/core/trunc/build)
add_subdirectory(hammer/driver/trunc/build)
