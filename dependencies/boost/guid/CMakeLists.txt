add_library(boost.guid INTERFACE)
target_include_directories(boost.guid INTERFACE ./1.40.0/include)
target_link_libraries(boost.guid INTERFACE boost.all)
