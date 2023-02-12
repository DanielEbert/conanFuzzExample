### Build and Run

~~~
conan install . -pr ../fuzzingProfile --build
mkdir build
cd build
cmake .. -DCMAKE_CXX_COMPILER=clang
cmake --build .
./bin/exampleFuzzing
~~~
