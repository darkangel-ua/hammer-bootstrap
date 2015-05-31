include_directories(. ./1.40.0/include)

file(GLOB sources ./1.40.0/src/*.cpp)
add_library(boost.crypto STATIC ${sources})

target_link_libraries(boost.crypto boost.all)
target_include_directories(boost.crypto PUBLIC ./1.40.0/include)
