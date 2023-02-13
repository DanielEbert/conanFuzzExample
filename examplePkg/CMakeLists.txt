cmake_minimum_required(VERSION 3.15)
project(examplePkg CXX)

add_library(examplePkg src/examplePkg.cpp)
target_include_directories(examplePkg PUBLIC include)

install(TARGETS examplePkg)
