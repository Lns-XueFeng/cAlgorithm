#include <stdio.h>
#include <stdlib.h>

int two_dim_arr_sum(int **arr, int row, int col) {
    int sum = 0;
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            sum += arr[i][j];
        }
    }
    return sum;
}

int main(int argc, char* argv[]) {
    int row = 3;
    int col = 4;

    // 动态分配内存
    int **arr = malloc(row * sizeof(int *));
    for (int i = 0; i < row; i++) {
        arr[i] = malloc(col * sizeof(int));
        for (int j = 0; j < col; j++) {
            arr[i][j] = i + j;
        }
    }

    // 计算总和
    int sum = two_dim_arr_sum(arr, row, col);
    printf("sum: %d\n", sum);

    // 释放内存
    for (int i = 0; i < row; i++) {
        free(arr[i]);
    }
    free(arr);

    // 打印命令行参数
    for (int i=1; i<argc; i++) {
        printf("arguments %d: %s\n", i, argv[i]);
    }
    if (argc == 1) {
        printf("no command arguments\n");
    }

    return 0;
}
