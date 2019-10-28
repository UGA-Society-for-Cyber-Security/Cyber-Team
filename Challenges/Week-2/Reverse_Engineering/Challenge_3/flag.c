#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {

  int result = strcmp(argv[1], "cyberhacker");
  
  if (argc > 1) {
    int result = strcmp(argv[1], "cyberhacker");

    if (result == 0) {
      printf("Success!\n");
      printf("Here's the flag: ugascs{tr4c1ng_ca1ls}");
    } //if
    else {
      printf("Incorrect password provided\n");
    }//else

      
  } // if

  else {
    printf("Run this program with a command line argument\n");
    printf("Ex $ ./flag password\n");
  } // else

  return 0;

} // main
