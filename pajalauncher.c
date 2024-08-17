#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MINECRAFT_JAR_PATH "path/to/your/minecraft.jar"
#define JAVA_PATH "path/to/your/java"

void launch_minecraft(const char *username) {
    char command[1024];

    // Comando básico para lanzar Minecraft
    snprintf(command, sizeof(command),
             "\"%s\" -jar \"%s\" --username %s",
             JAVA_PATH, MINECRAFT_JAR_PATH, username);

    printf("Running command: %s\n", command);
    system(command);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <username>\n", argv[0]);
        return 1;
    }

    const char *username = argv[1];

    // Lanza Minecraft con el nombre de usuario proporcionado
    launch_minecraft(username);

    return 0;
}
