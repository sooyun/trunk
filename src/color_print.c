#include <stdio.h>

#define RED_PRINT(fmt, args...)    	printf("\x1b[%dm\x1b[%dm" fmt "\x1b[0m", 40, 31, ##args);
#define GREEN_PRINT(fmt, args...)  	printf("\x1b[%dm\x1b[%dm" fmt "\x1b[0m", 40, 32, ##args);
#define YELLOW_PRINT(fmt, args...) 	printf("\x1b[%dm\x1b[%dm" fmt "\x1b[0m", 40, 33, ##args);
#define BLUE_PRINT(fmt, args...)   	printf("\x1b[%dm\x1b[%dm" fmt "\x1b[0m", 40, 34, ##args);
#define PUPPLE_PRINT(fmt, args...)	printf("\x1b[%dm\x1b[%dm" fmt "\x1b[0m", 40, 35, ##args);

int main(void)
{
	RED_PRINT("RED\n");
	GREEN_PRINT("GREEN\n");
	YELLOW_PRINT("YELLOW\n");
	BLUE_PRINT("BLUE\n");
	PUPPLE_PRINT("PUPPLE\n");
}
