#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    char *command[] = {"true", NULL};

    execvp(command[0], command);
    perror("execvp failed");
    return 1;
}
