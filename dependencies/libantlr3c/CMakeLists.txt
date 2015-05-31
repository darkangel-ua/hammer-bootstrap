project(libantlr3c)

file(GLOB src ./3.1.1/src/*.c)

add_library(antlr3c STATIC ${src})
target_include_directories(antlr3c PUBLIC ./3.1.1/include)
