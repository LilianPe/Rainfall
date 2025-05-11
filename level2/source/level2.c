#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void p() {
    char buffer[76];
    fflush(stdout);
    gets(buffer);
    unsigned int val = (unsigned int)&buffer;
    if ((val & 0xb0000000) == 0xb0000000) {
        printf("0x%x\n", val);
        exit(1);
    }
    puts(buffer);
    strdup(buffer);
}

int main() {
    p();
    return 0;
}
