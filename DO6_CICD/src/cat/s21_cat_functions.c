#include "s21_cat.h"

int find_options(int argc, char const *argv[], struct options *ptr_cat) {
  int for_files = 1;
  for (int count = 1; count < argc; count++) {
    if ((argv[count][0] == '-') && (argv[count][1] != '-')) {
      if ((strlen(argv[count]) == 1) && ((strcmp(argv[count], "-")) == 0)) {
        (*ptr_cat).options = 1;
      }
      search_single_options(argv, ptr_cat, count);
    } else if ((argv[count][0] == '-') && (argv[count][1] == '-')) {
      if (strcmp(argv[count], "--number-nonblank") == 0) {
        (*ptr_cat).b = 1;
      }
      if (strcmp(argv[count], "--number") == 0) {
        (*ptr_cat).n = 1;
      }
      if (strcmp(argv[count], "--squeeze-blank") == 0) {
        (*ptr_cat).s = 1;
      }
      if ((strcmp(argv[count], "--number-nonblank") != 0) &&
          (strcmp(argv[count], "--number") != 0) &&
          (strcmp(argv[count], "--squeeze-blank") != 0)) {
        (*ptr_cat).options = 1;
      }
    } else if (argv[count][0] != '-') {
      break;
    } else {
      ;
    }
    for_files += 1;
  }
  if (for_files == argc) {
    (*ptr_cat).files = 1;
  }
  return for_files;
}

void search_single_options(char const *argv[], struct options *ptr_cat,
                           int count) {
  for (size_t i = 1; i < strlen(argv[count]); i++) {
    if (argv[count][i] == 'b') {
      (*ptr_cat).b = 1;
    } else if (argv[count][i] == 'e') {
      (*ptr_cat).e = 1;
    } else if (argv[count][i] == 'E') {
      (*ptr_cat).e_max = 1;
    } else if (argv[count][i] == 'n') {
      (*ptr_cat).n = 1;
    } else if (argv[count][i] == 's') {
      (*ptr_cat).s = 1;
    } else if (argv[count][i] == 't') {
      (*ptr_cat).t = 1;
    } else if (argv[count][i] == 'T') {
      (*ptr_cat).t_max = 1;
    } else {
      (*ptr_cat).options = 1;
    }
  }
}

void open_file(int argc, char const *argv[], struct options *ptr_cat,
               const int *option) {
  FILE *file = NULL;
  for (int file_position = *option; file_position < argc; file_position++) {
    if ((file = fopen(argv[file_position], "r")) != NULL) {
      edit_display_buffer(file, ptr_cat);
      fclose(file);
    } else {
      fprintf(stderr, "error3_s21_cat: %s: No such file of directory\n",
              argv[file_position]);
    }
  }
  if ((*ptr_cat).files == 1) {
    fprintf(stderr, "error4_s21_cat: no file\n");
    fprintf(stderr, "usage: s21_cat [-benst] [file ...]\n");
  }
}

void edit_display_buffer(FILE *file, struct options *ptr_cat) {
  char line[1024];
  int line_number = 1;
  int empty_line_count = 1;
  while (fgets(line, sizeof(line), file)) {
    if (((*ptr_cat).b == 0) && ((*ptr_cat).e == 0) && ((*ptr_cat).e_max == 0) &&
        ((*ptr_cat).n == 0) && ((*ptr_cat).s == 0) && ((*ptr_cat).t == 0) &&
        ((*ptr_cat).t_max == 0)) {
      printf("%s", line);
    }
    if ((*ptr_cat).b == 1) {
      if (line[0] != '\n') {
        printf("%6d\t%s", line_number++, line);
      } else {
        printf("%s", line);
      }
    }
    if ((*ptr_cat).e == 1) {
      ptr_cat_v(line, ptr_cat);
      printf("$\n");
    }
    if ((*ptr_cat).e_max == 1) {
      char *ptr = strchr(line, '\n');
      if (ptr != NULL) {
        *ptr = '\0';
        printf("%s%c\n", line, 36);
      }
    }
    if ((*ptr_cat).n == 1) {
      printf("%6d\t%s", line_number++, line);
    }
    if ((*ptr_cat).s == 1) {
      empty_line_count = ptr_cat_s(line, empty_line_count);
    }
    if ((*ptr_cat).t == 1) {
      ptr_cat_v(line, ptr_cat);
      printf("\n");
    }
    if ((*ptr_cat).t_max == 1) {
      ptr_cat_t_max(line);
    }
  }
}

int ptr_cat_s(char *line, int empty_line_count) {
  if ((line[0] == '\n') && (empty_line_count == 1)) {
    printf("%s", line);
    empty_line_count++;
  } else if (line[0] != '\n') {
    printf("%s", line);
    empty_line_count = 1;
  } else {
    ;
  }
  return empty_line_count;
}

void ptr_cat_t_max(char *line) {
  int i = 0;
  while (*(line + i) != '\0') {
    if (*(line + i) == '\t') {
      printf("^|");
    } else {
      printf("%c", *(line + i));
    }
    i++;
  }
}

void ptr_cat_v(char *line, struct options *ptr_cat) {
  int i = 0;
  while (*(line + i) != '\n') {
    if (((*(line + i) >= 0x00) && (*(line + i) <= 0x08)) ||
        ((*(line + i) >= 0x0A) && (*(line + i) <= 0x1F))) {
      printf("^X");
    } else if (*(line + i) == 0x7F) {
      printf("^?");
    } else if (*(line + i) == 0x20) {
      printf(" ");
    } else if ((unsigned char)*(line + i) > 0x7F) {
      printf("M-");
    } else if ((*(line + i) == 0x09) && ((*ptr_cat).t == 1)) {
      printf("^I");
    } else {
      printf("%c", *(line + i));
    }
    i++;
  }
}
