#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char* argv[]) {
    printf("hello world (pid: %d)\n", (int) getpid());
    int rc = fork();   // only Unix (linux, mac)
    if (rc < 0) {
        fprintf(stderr, "fork failed\n");
        exit(1);
    }
    else if (rc == 0) {
        printf("hello, I am child (pid: %d)\n", (int) getpid());
    }
    else {
        int wc = wait(NULL);   // 等待子进程：wc表示等待的进程pid
        printf("hello, I am parent of %d (wc: %d) (pid: %d)\n", rc, wc, (int) getpid());   // modify
    }
    return 0;
}
