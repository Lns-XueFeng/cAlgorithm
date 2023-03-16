#include <stdio.h>
#include <stdlib.h>

int factorial(int num) {
    if (num <= 0) {
      return 1;
    }
    return factorial(num - 1) * num;
}

int main(int argc, char const *argv[]) {
    if (argc == 2) {
        int num = atoi(argv[1]);
        int result = factorial(num);
        printf("num of factorial: %d\n", result);
    } else {
        printf("please input correct argv\n");
    }
    return 0;
}
