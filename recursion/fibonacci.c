#include <stdio.h>
#include <stdlib.h>

int fib(int n) {
    if (n == 1 || n == 2) {
       return 1;
    }
    return fib(n -1) + fib (n - 2);
}

int main(int argc, char const *argv[]) {
  if (argc == 2) {
      int n = atoi(argv[1]);
      int result = fib(n);
      printf("fibonacci number %d: %d\n", n, result);
  } else {
      printf("please input correct argv\n");
  }
  return 0;
}
