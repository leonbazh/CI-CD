#ifndef S21_GREP_H
#define S21_GREP_H

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFF_SIZE 100000
#define LINE_SIZE 100000

int REG_OPT = 0;

typedef struct {
  int e, i, v, c, l, n, h, s, f, o, space;
} grep;

void flagparse(int argc, char* argv[], grep* flag, char* regbuff);
void fileparse(int argc, char* argv[], grep* flag, char* regbuff);
void init_pattern(int* reg_count, char* regbuff, char* arg, grep* flag);
void init_file(int* reg_count, char* regbuff, char* optarg, grep* flag);
void output(FILE* fp, char* argv[], grep* flag, char* regbuff, int filecount);

#endif