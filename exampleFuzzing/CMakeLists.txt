project("exampleFuzzing")
add_definitions("-std=c++11")

include(conanbuildinfo.cmake)
conan_basic_setup()

set(CMAKE_C_COMPILER hfuzz-g++)
set(CMAKE_CXX_COMPILER hfuzz-g++)
#set(CMAKE_C_COMPILER_WORKS 1)
#set(CMAKE_CXX_COMPILER_WORKS 1)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fsanitize=address")

add_executable(exampleFuzzing src/main.cpp)
target_link_libraries(exampleFuzzing ${CONAN_LIBS})
