#include <stdio.h>
#include <stdlib.h>

int sum(int *arr, int n) {
    if (n == 0) {
        return 0;
    }
    return sum(arr, n-1) + arr[n-1];
}

int main(int argc, char const *argv[]) {
    if (argc >= 2) {
        int *arr = malloc(sizeof(int) * (argc-1));
        for (int i=1; i<argc; i++) {
            arr[i-1] = (int) atoi(argv[i]);
        }
        int n = argc - 1;
        int arr_sum = sum(arr, n);
        printf("sum of arr is: %d\n", arr_sum);
    } else {
        printf("please input correct argv\n");
    }

    return 0;
}
