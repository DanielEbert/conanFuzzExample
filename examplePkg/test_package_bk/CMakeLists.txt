cmake_minimum_required(VERSION 3.15)
project(PackageTest CXX)

set(CMAKE_CXX_COMPILER clang)

find_package(examplePkg CONFIG REQUIRED)

add_executable(example src/example.cpp)
target_link_libraries(example examplePkg::examplePkg)
