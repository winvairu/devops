#ifndef S21_GREP_H
#define S21_GREP_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct options {
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
  int o;
  int options;
  int pattern;
  int files;
};

int find_options(int argc, char const *argv[], struct options *ptr_grep);
void find_pattern(int argc, char const *argv[], struct options *ptr_cat,
                  const int *arguments);
void open_file(int argc, char const *argv[], struct options *ptr_grep,
               const int *file_position, int *pattern_position);
void find_line(char const *argv[], FILE *file, struct options *ptr_grep,
               int *pattern_position, int *file_counter, int *file_position);
void e_s_option(char const *argv[], char *line, const int *pattern_position,
                const int *file_counter, const int *file_position);
void i_option(char const *argv[], char *line, const int *pattern_position,
              const int *file_counter, const int *file_position);
int c_l_option(char const *argv[], char *line, const int *pattern_position);
void n_option(char const *argv[], char *line, const int *pattern_position,
              const int *file_counter, const int *file_position,
              int *file_counter_n_option);
void h_option(char const *argv[], char *line, const int *pattern_position);
void o_option(char const *argv[], char *line, const int *pattern_position,
              const int *file_counter, const int *file_position);
void f_option(char const *argv[], char *line, const int *pattern_position,
              const int *file_counter, const int *file_position);
void v_option(char const *argv[], char *line, const int *pattern_position,
              const int *file_counter, const int *file_position);

#endif
