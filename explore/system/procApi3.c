#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>

int main(int argc, char* argv[]) {
    printf("hello world (pid: %d)\n", (int) getpid());
    int rc = fork();   // only Unix (linux, mac)
    if (rc < 0) {
        fprintf(stderr, "fork failed\n");
        exit(1);
    }
    else if (rc == 0) {
        printf("hello, I am child (pid: %d)\n", (int) getpid());
        char* myargs[3];
        myargs[0] = strdup("wc");   // program: "wc" (word count)
        myargs[1] = strdup("p3.c")   // argument: file to count
        myargs[2] = NULL;   // marks end of array
        execvp(myargs[0], myargs);   // runs word count
        // exec()会从可执行程序加载代码和静态数据，并用它覆盖自己的代码段（以及静态数据），
        // 堆、栈及其它内存空间也会被重新初始化。然后操作系统就执行该程序，将参数通过argv传递给该进程。
        // 因此它并没有创建新进程，而是直接将当前运行的程序(以前的p3)替换为不同的运行程序(wc)。
        // 子进程执行exec()之后，几乎就像p3.c从未运行过一样。对exec的成功调用永远不会返回。
        printf("this shouldn't print out");
    }
    else {
        int wc = wait(NULL);
        printf("hello, I am parent of %d (wc: %d) (pid: %d)\n", rc, wc, (int) getpid());
    }
    return 0;
}
