#ifndef S21_CAT_H
#define S21_CAT_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct options {
  int b;
  int e;
  int e_max;
  int n;
  int s;
  int t;
  int t_max;
  int options;
  int files;
};

int find_options(int argc, char const *argv[], struct options *ptr_cat);
void search_single_options(char const *argv[], struct options *ptr_cat,
                           int count);
void ptr_cat_t_max(char *line);
int ptr_cat_s(char *line, int empty_line_count);
void open_file(int argc, char const *argv[], struct options *ptr_cat,
               const int *option);
void edit_display_buffer(FILE *file, struct options *ptr_cat);
void ptr_cat_v(char *line, struct options *ptr_cat);

#endif
