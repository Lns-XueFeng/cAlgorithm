#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char* argv[]) {
    printf("hello world (pid: %d)\n", (int) getpid());
    int rc = fork();   // only Unix (linux, mac)
    if (rc < 0) {   // 子进程创建失败
        fprintf(stderr, "fork failed\n");
        exit(1);
    }
    else if (rc == 0) {   // 子进程创建成功
        printf("hello, I am child (pid: %d)\n", (int) getpid());
    }
    else {   // 父进程rc为指向子进程pid
        printf("hello, I am parent of %d (pid: %d)\n", rc, (int) getpid());
    }
    return 0;
}
