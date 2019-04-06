/*Rewrite the program cat from Chapter 7 using read,write,open and close
instead of their standard library equivalents. Perform experiments to determine
the relative speeds of the two versions */ 

/* cat: concatenate files - read/write/open/close */

// #include <iostream>
#include <stdio.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define STDIN 0
#define STDOUT 1
#define STDERR 2

int main(int argc, char *argv[]) {
  
  char command[69];

  if( argc == 2 ) { 
    strcpy(command, "html2text ");
    strcat(command, argv[1]);
    strcat(command, " | pygmentize -f terminal256 -O style=monokai -g");
    system(command);
    printf("%s is converting to plain text with [html2text] \n", argv[1]);
    printf("%s is highlighting with [pygmentize] \n\n", argv[1]);
    // free (command);
  } 
  else if( argc == 3 ) {
     strcpy(command, "html2text ");
    strcat(command, argv[1]);
    strcat(command, " | pygmentize -f terminal256 -O style=monokai -g");
    strcat(command, " > argv[2]");
    system(command);
    printf("%s is converting to plain text with [html2text] \n", argv[1]);
    printf("%s is highlighting with [pygmentize] \n\n", argv[2]);
    // free (command);
  } 
  else if( argc > 3 ) {
      printf("Too many arguments supplied.\n");
  } 
  else {
      printf("One argument expected.\n");
  }
  return (0);
}
