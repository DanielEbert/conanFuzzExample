### Plan

- use honggfuzz
- use hfuzz-g++ (needs version 9+): ~/P/honggfuzz/hfuzz_cc/hfuzz-g++ -fsanitize=address main.cpp -o main && ~/P/honggfuzz/honggfuzz -P -i i -o o -- ./main
- In profile, add sanitizer:
~~~
[conf]
tools.build:cxxflags=['-fsanitize=address'
~~~

### TODO

- I can recompile hfuzz-cc with -fsanitize=address to have it always included. maybe make separate file for that setting.
