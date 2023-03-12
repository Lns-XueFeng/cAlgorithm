#include <stdio.h>
#include <stdlib.h>

struct Node {
    int value;
    struct Node* next;
};

struct Stack {
    int size;
    int index;
    struct Node* head;
};

typedef struct Node* node;
typedef struct Stack* stack;

node temp = NULL;
node current_node = NULL;

stack create_stack(int);
int empty(stack);
int length(stack);
int full(stack);
void push(int, stack);
int pop(stack);

void main() {
    stack sk = create_stack(10);
    push(10, sk);
    printf("%d, %d, %d\n", sk->size, sk->index, sk->head->value);
    push(5, sk);
    printf("%d, %d, %d\n", sk->size, sk->index, sk->head->value);
    pop(sk);
    printf("%d, %d, %d\n", sk->size, sk->index, sk->head->value);
    push(12, sk);
    printf("%d, %d, %d\n", sk->size, sk->index, sk->head->value);
    // 清空栈，避免内存遗留
    while (!empty(sk)) {
        int poped_value = pop(sk);
        printf("Poped: %d\n", poped_value);
    }
    int poped_value = pop(sk);
    printf("Poped: %d\n", poped_value);
    if (empty(sk)) {
        printf("The stack has completely poped");
    }
}

stack create_stack(int size) {
    stack sk = malloc(sizeof(struct Stack));
    sk->size = size;
    sk->index = -1;
    sk->head = malloc(sizeof(struct Node));
    return sk;
}

int empty(stack sk) {
    return sk->index == -1;
}

int length(stack sk) {
    return sk->index + 1;
}

int full(stack sk) {
    return sk->size - sk->index == 1;
}

void push(int num, stack sk) {
    if (full(sk)) {
        printf("Now the stack has fulled\n");
        exit(0);
    }
    if (empty(sk)) {
        current_node = malloc(sizeof(struct Node));
        current_node->value = num;
        current_node->next = NULL;
        temp = current_node;
    }
    else {
        current_node = malloc(sizeof(struct Node));
        current_node->value = num;
        current_node->next = temp;
        temp = current_node;
    }
    sk->head = current_node;
    sk->index++;
    current_node = NULL;
}

int pop(stack sk) {
    if (empty(sk)) {
        printf("Now the stack has no element\n");
    }
    else{
      int poped_value = sk->head->value;
      sk->head = sk->head->next;
      sk->index--;
      free(temp);
      temp = sk->head;
      current_node = NULL;
      return poped_value;
    }
}
