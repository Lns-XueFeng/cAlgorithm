#include <stdio.h>

// 在 C 语言中，当二维数组作为函数参数时，需要指定除第一维以外的其他维度的大小
// 不用写第一维数是多少，它会当作第二个参数传入，但是第二维的一定要写
int two_dim_arr_sum(int arr[][4], int row) {
    int sum = 0;
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < 4; j++) {
            sum += arr[i][j];
        }
    }
    return sum;
}

int main() {
    int arr[3][4] = {
      {1, 2, 3, 4},
      {1, 2, 3, 4},
      {1, 2, 3, 4}
    };
    int sum = two_dim_arr_sum(arr, 3);
    printf("sum: %d\n", sum);
}
