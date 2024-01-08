#ifndef CAT_H
#define CAT_H

#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

typedef struct {
  int b, e, n, s, v, t;
} cat;

struct option long_options[] = {{"number-nonblank", 0, 0, 'b'},
                                {"number", 0, 0, 'n'},
                                {"squeeze-blank", 0, 0, 's'}};

void flagparse(int argc, char* argv[], char* flags, cat flag);
void fileparse(int argc, char* argv[], cat flag);
void output(char* filename, cat flag);
#endif