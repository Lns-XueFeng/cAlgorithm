#include <stdio.h>
#include <stdlib.h>

struct Stack {
    int size;
    int top_point;
    int* items;
};

typedef struct Stack* stack;   // 结构体指针stack

stack create_stack(int);
int empty(stack);
int full(stack);
int length(stack);
int push(int, stack);
int pop(stack);

void main() {
    stack sk = create_stack(10);
    push(10, sk);
    push(5, sk);
    push(15, sk);
    printf("Now the top element of stack: %d\n", sk->items[sk->top_point]);
    printf("Now the length of stack: %d\n", length(sk));
    printf("Now to pop the top element of stack: %d\n", pop(sk));
    printf("Now the top element of stack: %d\n", sk->items[sk->top_point]);
    printf("Now the length of stack: %d\n", length(sk));
    while (!empty(sk)) {
        int poped_value = pop(sk);
        printf("Poped: %d\n", poped_value);
    }
    if (empty(sk)) {
        printf("The stack has completely poped");
    }
    free(sk->items); free(sk);
}

stack create_stack(int size) {
    stack sk = malloc(sizeof(struct Stack));
    sk->size = size;
    sk->top_point = -1;
    sk->items = malloc(sizeof(int) * size);
    return sk;
}

int empty(stack sk) {
    return sk->top_point == -1;   // 等于-1则为空栈
}

int full(stack sk) {
    return (sk->size - sk->top_point) == 1;
}

int length(stack sk) {
  return sk->top_point + 1;
}

int push(int item, stack sk) {
    if (full(sk)){
        printf("Warning: the stack of size has fulled");
    }
    esle {
        sk->items[++sk->top_point] = item;
    }
}

int pop(stack sk) {
    if (empty(sk)) {
        printf("Warning: the stack has not element");
    }
    else {
        return sk->items[sk->top_point--];
    }
}
