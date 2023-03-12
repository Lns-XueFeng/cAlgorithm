#include <stdio.h>
#include <stdlib.h>

struct Node {
    int value;
    struct Node* next;
};

struct Queue {
    int size;
    int pointer;
    struct Node* tail;
};

typedef struct Queue* Queue;
typedef struct Node* Node;

Node find_head = NULL;   // 从队尾扫描至头部
Node head_back = NULL;  // 队首后面一个节点

Queue createQueue(int size) {
    Queue queue = malloc(sizeof(struct Queue));
    queue->size = size;
    queue->pointer = -1;
    queue->tail = malloc(sizeof(struct Node));
    return queue;
}

int empty(Queue queue) {
    return queue->pointer == -1;
}

int full(Queue queue) {
    return queue->pointer == queue->size - 1;
}

void enqueue(int value, Queue queue) {
    if (full(queue)) {
       printf("Now the queue has fulled");
       exit(1);
    }
    if (empty(queue)) {
        Node first_node = malloc(sizeof(struct Node));
        first_node->value = value;
        first_node->next = NULL;
        queue->pointer++;
        queue->tail = first_node;
    }
    else {
        Node new_node = malloc(sizeof(struct Node));
        new_node->value = value;
        new_node->next = queue->tail;
        queue->pointer++;
        queue->tail = new_node;
    }
}

int dequeue(Queue queue) {
    if (empty(queue)) {
        printf("Now the queue has no element");
        exit(1);
    }
    else {
        find_head = queue->tail;
        while (find_head->next != NULL) {
            head_back = find_head;
            find_head = find_head->next;
        }
        int head_value = find_head->value;
        free(find_head);
        if (queue->pointer != 0) {   // 当队列中仅有一个节点时不执行此步
            head_back->next = NULL;
        }
        find_head = NULL;
        head_back = NULL;
        queue->pointer--;
        return head_value;
    }
}

int main() {
    Queue queue = createQueue(10);
    // 10、5、0
    enqueue(10, queue);
    enqueue(5, queue);
    enqueue(0, queue);
    int value = dequeue(queue);
    printf("value: %d pointer: %d\n", value, queue->pointer);
    value = dequeue(queue);
    printf("value: %d pointer: %d\n", value, queue->pointer);
    value = dequeue(queue);
    printf("value: %d pointer: %d\n", value, queue->pointer);

    free(find_head); free(head_back); free(queue);
}
