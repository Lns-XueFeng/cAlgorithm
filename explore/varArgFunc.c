#include <stdio.h>
#include <stdarg.h>

double sum(int count, ...) {
    double total = 0;
    va_list ap;
    va_start(ap, count);
    for (int i=0; i<count; i++) {
        total += va_arg(ap, double);   // 可变参数必须和va_arg第二个参数一致
    }
    va_end(ap);
    return total;
}


int main() {
    double (*p_sum)(int, ...) = &sum;   // 函数指针
    double total = (*p_sum)(5, 1.0, 2.0, 3.0, 4.0, 5.0);   // ==> sum(5, 1.0, 2.0, 3.0, 4.0, 5.0)
    printf("sum: %f\n", total);
}
