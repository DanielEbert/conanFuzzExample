#include "examplePkg/examplePkg.hpp"

int myAPI(const uint8_t* input, uint32_t input_size)
{
    if(input_size < 3) return 0;

    return input[1005];

    if (input[0] == 'F')
    {
        if(input[1] == 'U')
        {
            if(input[2] == 'Z')
            {
                if(input[3] == 'Z')
                {
                    return 1;
                }
            }
        }
    }
    return 0;  
}
