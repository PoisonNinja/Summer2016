#include <stdio.h>

extern int multiply(int, int);

int main(int argc, char ** argv) {
    printf("2 * 3 = %d\n", multiply(2, 3));
}
