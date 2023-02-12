project("exampleFuzzing")
add_definitions("-std=c++11")

set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=fuzzer,address")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=fuzzer,address")

include(conanbuildinfo.cmake)
conan_basic_setup()

add_executable(exampleFuzzing src/main.cpp)
target_link_libraries(exampleFuzzing ${CONAN_LIBS})
