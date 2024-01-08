#include "grep.h"

int main(int argc, char* argv[]) {
  grep flag = {0};
  char regbuff[BUFF_SIZE] = {0};
  flagparse(argc, argv, &flag, regbuff);
  fileparse(argc, argv, &flag, regbuff);
  return 0;
}

void flagparse(int argc, char* argv[], grep* flag, char* regbuff) {
  int opt;
  int reg_count = 0;
  while ((opt = getopt_long(argc, argv, "e:ivclnhsf:o", NULL, NULL)) != -1) {
    if (opt == 'e') {
      flag->e = 1;
      init_pattern(&reg_count, regbuff, optarg, flag);
    } else if (opt == 'i') {
      flag->i = 1;
      REG_OPT = REG_ICASE;
    } else if (opt == 'v') {
      flag->v = 1;
    } else if (opt == 'c') {
      flag->c = 1;
    } else if (opt == 'l') {
      flag->l = 1;
    } else if (opt == 'n') {
      flag->n = 1;
    } else if (opt == 'h') {
      flag->h = 1;
    } else if (opt == 's') {
      flag->s = 1;
    } else if (opt == 'f') {
      flag->f = 1;
      init_file(&reg_count, regbuff, optarg, flag);
    } else if (opt == 'o') {
      flag->o = 1;
    } else {
      fprintf(stderr,
              "usage: grep [-ivclnhso] [-e pattern] [-f file] [file ...]");
    }
  }
  if (flag->space) flag->o = 0;
  if (!flag->e && !flag->f) {
    if (argv[optind] == 0) {
      argv[optind] = ".";
    }
    strcat(regbuff, argv[optind]);
    optind++;
  }
}

void init_pattern(int* reg_count, char* regbuff, char* optarg, grep* flag) {
  if (*reg_count) strcat(regbuff, "|");
  if (!optarg) {
    optarg = ".";
    flag->space = 1;
  }
  if (strlen(regbuff) + strlen(optarg) > BUFF_SIZE) {
    fprintf(stderr, "error: regular_expression");
    exit(1);
  }
  strcat(regbuff, optarg);
  (*reg_count)++;
}

void init_file(int* reg_count, char* regbuff, char* optarg, grep* flag) {
  FILE* fp;
  char file[BUFF_SIZE] = {0};

  if ((fp = fopen(optarg, "r")) == NULL) {
    if (!flag->s) {
      fprintf(stderr, "grep: %s: No such file or directory", optarg);
    }
  }
  while (fgets(file, BUFF_SIZE, fp)) {
    if (file[strlen(file) - 1] == '\n')
      file[strlen(file) - 1] = 0;  // удаляем перенос строки для записи в буфер

    if (*reg_count) strcat(regbuff, "|");

    if (file == '\0') {
      strcat(regbuff, ".");
      flag->space = 1;
    } else {
      if (strlen(regbuff) + strlen(optarg) > BUFF_SIZE) {
        fprintf(stderr, "error");
        exit(1);
      }
      strcat(regbuff, file);
    }
    (*reg_count)++;
  }
  fclose(fp);
}

void fileparse(int argc, char* argv[], grep* flag, char* regbuff) {
  int filecount = argc - optind;
  FILE* fp;
  for (; optind < argc; optind++) {
    if ((fp = fopen(argv[optind], "r")) == NULL) {
      if (!flag->s) {
        printf("grep: %s: No such file or directory", argv[optind]);
      }
    } else {
      output(fp, argv, flag, regbuff, filecount);
    }
    fclose(fp);
  }
}

void output(FILE* fp, char* argv[], grep* flag, char* regbuff, int filecount) {
  regex_t regex;
  regmatch_t pmatch[1] = {0};
  int nmatch = 1;
  int linecount = 0;
  int o_count = 1;
  int n_count = 1;
  int comp;
  char str[LINE_SIZE] = {0};
  if ((comp = regcomp(&regex, regbuff, REG_EXTENDED | REG_OPT))) {
    fprintf(stderr, "errorcomp");
  }
  while (fgets(str, LINE_SIZE, fp)) {
    comp = regexec(&regex, str, nmatch, pmatch, 0);
    if (flag->v) comp = comp ? 0 : 1;  // если флаг -v то делаем наоборот
    if (!comp) {
      if (!flag->c && !flag->l) {
        if (filecount > 1 && !flag->h) printf("%s:", argv[optind]);
        if (flag->n) printf("%d:", n_count);
        if (flag->o && !flag->v) {
          o_count = 0;
          char* o_str = str;
          while (!regexec(&regex, o_str, nmatch, pmatch, 0)) {
            if (!(pmatch[0].rm_eo ==
                  pmatch[0].rm_so)) {  // если конец(eo) и начало(so)
                                       // совпадающей строки не равны
              printf("%.*s\n", (int)(pmatch[0].rm_eo - pmatch[0].rm_so),
                     o_str + pmatch[0].rm_so);  // определяем границы совпадения
              o_str += pmatch[0].rm_eo;  // переносим координаты чтобы искать
                                         // другие совпадения в строке
            }
          }
        }
        if (!flag->o || flag->v) printf("%s", str);
        if (str[strlen(str) - 1] != '\n' && o_count) printf("\n");
      }
      linecount++;
    }
    n_count++;
  }
  if (flag->c) {
    if (filecount > 1 && !flag->h) {
      printf("%s:", argv[optind]);
    }
    if (flag->l && linecount)
      printf("1\n");
    else
      printf("%d\n", linecount);
  }
  if (flag->l && linecount) printf("%s\n", argv[optind]);

  regfree(&regex);
}