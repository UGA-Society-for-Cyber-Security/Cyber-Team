// This C file prints out "Hello World"

#include <stdio.h>

int main(int argc, char * argv[]){
    int i;
    int var;

    var = 1;

    for(i=0; i < 7; i++){
        printf("Hello World!");
        var = var * 2;
    }
}
