#include "cat.h"

int main(int argc, char* argv[]) {
  cat flag = {0};
#ifdef __APPLE__
  char* flags = "+bensvtET";
#else
  char* flags = "bensvtET";
#endif
  flagparse(argc, argv, flags, flag);
  return 0;
}

void flagparse(int argc, char* argv[], char* flags, cat flag) {
  int opt;
  while ((opt = getopt_long(argc, argv, flags, long_options, NULL)) != -1) {
    if (opt == 'b') {
      flag.b = 1;
    } else if (opt == 'e') {
      flag.e = 1;
      flag.v = 1;
    } else if (opt == 'E') {
      flag.e = 1;
    } else if (opt == 'n') {
      flag.n = 1;
    } else if (opt == 's') {
      flag.s = 1;
    } else if (opt == 't') {
      flag.t = 1;
      flag.v = 1;
    } else if (opt == 'T') {
      flag.t = 1;
    } else if (opt == 'v') {
      flag.v = 1;
    } else {
      fprintf(stderr, "usage: cat [-benstuv] [file ...]");
    }
  }
  fileparse(argc, argv, flag);
}

void fileparse(int argc, char* argv[], cat flag) {
  for (; optind < argc; optind++) {
    output(argv[optind], flag);
  }
}

void output(char* filename, cat flag) {
  FILE* fp;
  char ch;
  int newline = 1;
  int secondline = 0;
  int s_arg = 1;
  int count = 1;
  if ((fp = fopen(filename, "r")) == NULL) {
    fprintf(stderr, "s21_cat: %s: No such file or directory", filename);
  } else {
    while ((ch = fgetc(fp)) != EOF) {
      if (flag.s) {
        if (ch == '\n') {
          s_arg++;
          if (s_arg > 2) {
            continue;
          }
        } else {
          s_arg = 0;
        }
      }
      if (flag.n) {
        if (newline && flag.b != 1) {
          printf("%6d\t", count++);
        }
      }
      if (flag.b) {
        if (newline && ch != '\n') {
          printf("%6d\t", count++);
        }
      }
      if (flag.e) {
        if (ch == '\n') {
          printf("$");
        }
      }
      if (flag.t) {
        if (ch == '\t') {
          printf("^");
          ch = 'I';
        }
      }
      if (flag.v) {
        int intch = (int)ch;
        if (ch < 0) {
          ch &= 127;
          intch = (int)ch;
          intch += 128;
        }
        if (intch != 9 && intch != 10 && intch < 32) {
          printf("^");
          ch += 64;
        } else if (intch == 127) {
          printf("^");
          ch = '?';
        } else if (intch > 127 && intch < 160) {
          printf("M-^");
          ch = intch - 64;
        } else if (intch > 160 && intch <= 255) {
          ch -= 128;
        }
      }
      if (secondline != -1) {
        printf("%c", ch);
      }
      newline = (ch == '\n') ? 1 : 0;
      secondline = (newline && ch == '\n') ? 1 : 0;
    }
  }
  fclose(fp);
}