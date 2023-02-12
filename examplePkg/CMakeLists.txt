cmake_minimum_required(VERSION 3.15)
project(examplePkg CXX)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

add_library(examplePkg src/examplePkg.cpp)
target_include_directories(examplePkg PUBLIC include)

SET(CMAKE_CXX_COMPILER clang)
SET(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -fsanitize=fuzzer,address")

install(TARGETS examplePkg)
