#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>
#include <fcntl.h>

int main(int argc, char* argv[]) {
    printf("hello world (pid: %d)\n", (int) getpid());
    int rc = fork();   // only Unix (linux, mac)
    if (rc < 0) {
        fprintf(stderr, "fork failed\n");
        exit(1);
    }
    else if (rc == 0) {
        close(STDOUT_FILENO);
        open("./p4.output", O_CREAT|O_WRONLY|O_TRUNC, SIRWXU);

        // now exec "wc"...
        char* myargs[3];
        myargs[0] = strdup("wc");   // program: "wc" (word count)
        myargs[1] = strdup("p3.c")   // argument: file to count
        myargs[2] = NULL;   // marks end of array
        execvp(myargs[0], myargs);   // runs word count
        printf("this shouldn't print out");
    }
    else {
        int wc = wait(NULL);
    }
    return 0;
}
