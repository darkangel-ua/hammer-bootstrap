add_library(boost.process INTERFACE)
target_include_directories(boost.process INTERFACE ./1.58.0/include)
target_link_libraries(boost.process INTERFACE boost.all)
