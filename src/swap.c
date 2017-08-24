#include <stdio.h>

#define SWAP16(s) \
    (((((s) & 0xff) << 8) | (((s) >> 8) & 0xff)))

#define SWAP32(l) \
    (((((l) & 0xff000000) >> 24) | \
     (((l) & 0x00ff0000) >> 8)  | \
  (((l) & 0x0000ff00) << 8)  | \
  (((l) & 0x000000ff) << 24)))

int main(void)
{
	short test16 = 0xabcd;
	int test32 = 0xabcdef12;

	test16 = SWAP16(test16);

	printf("test16 = 0x%x\n", test16);

	test32 = SWAP32(test32);

	printf("test32 = 0x%x\n", test32);

}
