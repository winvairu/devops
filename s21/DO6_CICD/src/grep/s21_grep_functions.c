#include "s21_grep.h"

int find_options(int argc, char const *argv[], struct options *ptr_grep) {
  int argument_counter = 1;
  for (int count = 1; count < argc; count++) {
    if ((argv[count][0] == '-') && (argv[count][1] != '-')) {
      if ((strlen(argv[count]) == 1) && ((strcmp(argv[count], "-")) == 0)) {
        (*ptr_grep).options = 1;
      }
      for (size_t i = 1; i < strlen(argv[count]); i++) {
        if (argv[count][i] == 'e') {
          (*ptr_grep).e = 1;
        } else if (argv[count][i] == 'i') {
          (*ptr_grep).i = 1;
        } else if (argv[count][i] == 'v') {
          (*ptr_grep).v = 1;
        } else if (argv[count][i] == 'c') {
          (*ptr_grep).c = 1;
        } else if (argv[count][i] == 'l') {
          (*ptr_grep).l = 1;
        } else if (argv[count][i] == 'n') {
          (*ptr_grep).n = 1;
        } else if (argv[count][i] == 'h') {
          (*ptr_grep).h = 1;
        } else if (argv[count][i] == 's') {
          (*ptr_grep).s = 1;
        } else if (argv[count][i] == 'f') {
          (*ptr_grep).f = 1;
        } else if (argv[count][i] == 'o') {
          (*ptr_grep).o = 1;
        } else {
          (*ptr_grep).options = 1;
        }
      }
    } else if (argv[count][0] != '-') {
      break;
    } else {
      ;
    }
    argument_counter += 1;
  }
  return argument_counter;
}

void find_pattern(int argc, char const *argv[], struct options *ptr_grep,
                  const int *argument_counter) {
  int pattern_position = *argument_counter;
  const int file_position = pattern_position + 1;
  open_file(argc, argv, ptr_grep, &file_position, &pattern_position);
  if (pattern_position == argc) {
    (*ptr_grep).pattern = 1;
    fprintf(stderr, "error4_s21_grep: no pattern\n");
    fprintf(
        stderr,
        "usage: s21_grep [-ivclnhso] [-e pattern] [-f file] [pattern] [file "
        "...]\n");
  } else if (file_position == argc) {
    (*ptr_grep).files = 1;
    fprintf(stderr, "error5_s21_grep: no file\n");
    fprintf(
        stderr,
        "usage: s21_grep [-ivclnhso] [-e pattern] [-f file] [pattern] [file "
        "...]\n");
  } else {
    ;
  }
}

void open_file(int argc, char const *argv[], struct options *ptr_grep,
               const int *file_position, int *pattern_position) {
  FILE *file = NULL;
  int file_counter = argc - *file_position;
  for (int count = *file_position; count < argc; count++) {
    if ((file = fopen(argv[count], "r")) != NULL) {
      find_line(argv, file, ptr_grep, pattern_position, &file_counter, &count);
      fclose(file);
    } else {
      (*ptr_grep).files = 1;
      if ((*ptr_grep).s != 1) {
        perror(argv[count]);
      }
    }
  }
}

void find_line(char const *argv[], FILE *file, struct options *ptr_grep,
               int *pattern_position, int *file_counter, int *file_position) {
  char line[1024];
  int line_counter = 0;
  int file_counter_l_option = 0;
  int file_counter_n_option = 1;
  while (fgets(line, sizeof(line), file)) {
    if (!(*ptr_grep).e && !(*ptr_grep).i && !(*ptr_grep).v && !(*ptr_grep).c &&
        !(*ptr_grep).l && !(*ptr_grep).n && !(*ptr_grep).h && !(*ptr_grep).s &&
        !(*ptr_grep).f && !(*ptr_grep).o) {
      e_s_option(argv, line, pattern_position, file_counter, file_position);
    }
    if (((*ptr_grep).e == 1) || ((*ptr_grep).s == 1)) {
      e_s_option(argv, line, pattern_position, file_counter, file_position);
    }
    if ((*ptr_grep).i == 1) {
      i_option(argv, line, pattern_position, file_counter, file_position);
    }
    if ((*ptr_grep).v == 1) {
      v_option(argv, line, pattern_position, file_counter, file_position);
    }
    if ((*ptr_grep).c == 1) {
      int count = c_l_option(argv, line, pattern_position);
      line_counter += count;
    }
    if ((*ptr_grep).l == 1) {
      int count = c_l_option(argv, line, pattern_position);
      file_counter_l_option += count;
    }
    if ((*ptr_grep).n == 1) {
      n_option(argv, line, pattern_position, file_counter, file_position,
               &file_counter_n_option);
      file_counter_n_option++;
    }
    if ((*ptr_grep).h == 1) {
      h_option(argv, line, pattern_position);
    }
    if ((*ptr_grep).f == 1) {
      f_option(argv, line, pattern_position, file_counter, file_position);
    }
    if ((*ptr_grep).o == 1) {
      o_option(argv, line, pattern_position, file_counter, file_position);
    }
  }
  if ((*ptr_grep).c == 1) {
    if (*file_counter > 1) {
      printf("%s:%d\n", argv[*file_position], line_counter);
    } else {
      printf("%d\n", line_counter);
    }
  }
  if ((*ptr_grep).l == 1) {
    if (file_counter_l_option > 0) {
      printf("%s\n", argv[*file_position]);
    }
  }
}

void e_s_option(char const *argv[], char *line, const int *pattern_position,
                const int *file_counter, const int *file_position) {
  if (strstr(line, argv[*pattern_position]) != NULL) {
    if (*file_counter > 1) {
      printf("%s:%s", argv[*file_position], line);
    } else {
      printf("%s", line);
    }
  }
}

void i_option(char const *argv[], char *line, const int *pattern_position,
              const int *file_counter, const int *file_position) {
  char lowercase_line[1024];
  char search_string[1024];
  strcpy(lowercase_line, line);
  for (size_t i = 0; lowercase_line[i] != '\0'; ++i) {
    if (lowercase_line[i] >= 'A' && lowercase_line[i] <= 'Z') {
      lowercase_line[i] += ('a' - 'A');
    }
  }
  strcpy(search_string, argv[*pattern_position]);
  for (size_t i = 0; search_string[i] != '\0'; ++i) {
    if (search_string[i] >= 'A' && search_string[i] <= 'Z') {
      search_string[i] += ('a' - 'A');
    }
  }
  if (strstr(lowercase_line, search_string) != NULL) {
    if (*file_counter > 1) {
      printf("%s:%s", argv[*file_position], line);
    } else {
      printf("%s", line);
    }
  }
}

int c_l_option(char const *argv[], char *line, const int *pattern_position) {
  if (strstr(line, argv[*pattern_position]) != NULL) {
    return 1;
  } else {
    return 0;
  }
}

void n_option(char const *argv[], char *line, const int *pattern_position,
              const int *file_counter, const int *file_position,
              int *file_counter_n_option) {
  if (strstr(line, argv[*pattern_position]) != NULL) {
    if (*file_counter > 1) {
      printf("%s:%d:%s", argv[*file_position], *file_counter_n_option, line);
    } else {
      printf("%d:%s", *file_counter_n_option, line);
    }
  }
}

void h_option(char const *argv[], char *line, const int *pattern_position) {
  if (strstr(line, argv[*pattern_position]) != NULL) {
    printf("%s", line);
  }
}

void f_option(char const *argv[], char *line, const int *pattern_position,
              const int *file_counter, const int *file_position) {
  FILE *file = NULL;
  if ((file = fopen(argv[*pattern_position], "r")) != NULL) {
    char f_line[1024];
    while (fgets(f_line, sizeof(f_line), file)) {
      char *pattern = strtok(f_line, "\n");
      if (strstr(line, pattern) != NULL) {
        if (*file_counter > 1) {
          printf("%s:%s", argv[*file_position], line);
        } else {
          printf("%s", line);
        }
        break;
      }
    }
    fclose(file);
  }
}

void o_option(char const *argv[], char *line, const int *pattern_position,
              const int *file_counter, const int *file_position) {
  if (strstr(line, argv[*pattern_position]) != NULL) {
    if (*file_counter > 1) {
      printf("%s:%s\n", argv[*file_position], argv[*pattern_position]);
    } else {
      printf("%s\n", argv[*pattern_position]);
    }
  }
}

void v_option(char const *argv[], char *line, const int *pattern_position,
              const int *file_counter, const int *file_position) {
  if (strstr(line, argv[*pattern_position]) == NULL) {
    if (*file_counter > 1) {
      printf("%s:%s", argv[*file_position], line);
    } else {
      printf("%s", line);
    }
  }
}
