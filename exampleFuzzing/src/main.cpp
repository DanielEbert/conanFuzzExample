#include "examplePkg/examplePkg.hpp"

extern "C" int LLVMFuzzerTestOneInput(const uint8_t* input, uint32_t input_size)
{
    myAPI(input, input_size);
    return 0;
}
