#include <stdio.h>
#include <stdlib.h>

struct QueueObject{
    int size;
    int index;
    int* array;
};

typedef struct QueueObject* Queue;

Queue createQueue(int size);
int empty(Queue queue);
int full(Queue queue);
int enQueue(int value, Queue queue);
int deQueue(Queue queue);

void main(){
    Queue queue = createQueue(10);
    enQueue(1, queue);
    enQueue(2, queue);
    enQueue(3, queue);
    int value;
    value = deQueue(queue);
    printf("Size: %d Length: %d Value: %d\n",
      queue->size, queue->index+1, value);
    value = deQueue(queue);
    printf("Size: %d Length: %d Value: %d\n",
      queue->size, queue->index+1, value);
    value = deQueue(queue);
    printf("Size: %d Length: %d Value: %d\n",
      queue->size, queue->index+1, value);
    if (empty(queue)){
        printf("Now the Queue has no item\n");
    }
    free(queue->array);
    free(queue);
}

Queue createQueue(int size){
    Queue queue = malloc(sizeof(struct QueueObject));
    queue->size = size;
    queue->index = -1;
    queue->array = malloc(sizeof(int) * size);
    return queue;
}

int empty(Queue queue){
    return queue->index == -1;
}

int full(Queue queue){
    return queue->index == queue->size - 1;
}

int enQueue(int value, Queue queue){
    if (full(queue)){
        printf("Now the Queue has fulled");
    }
    else{
        queue->index++;
        queue->array[queue->index] = value;
    }
}

int deQueue(Queue queue){
    if (empty(queue)){
        printf("Now the Queue has no item");
        return -1;
    }
    int value = queue->array[0];   // 拿到队首的值
    // 将队列中的所有元素往队首移动一个
    for (int i=0; i < queue->index; i++){
        queue->array[i] = queue->array[i+1];
    }
    queue->index--;
    return value;
}
