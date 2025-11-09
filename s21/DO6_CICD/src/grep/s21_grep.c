#include "s21_grep.h"

int main(int argc, char const *argv[]) {
  struct options grep = {};
  struct options *ptr_grep;
  ptr_grep = &grep;
  if (argc > 1) {
    const int argument_counter = find_options(argc, argv, ptr_grep);
    if ((*ptr_grep).options != 1) {
      find_pattern(argc, argv, ptr_grep, &argument_counter);
    } else {
      fprintf(stderr, "error2_s21_grep: invalid option: %s\n",
              (argv[1][0] != '-') ? argv[argument_counter]
                                  : argv[argument_counter - 1]);
      fprintf(
          stderr,
          "usage: s21_grep [-ivclnhso] [-e pattern] [-f file] [pattern] [file "
          "...]\n");
    }
  } else {
    fprintf(
        stderr,
        "error1_s21_grep: usage: s21_grep [-ivclnhso] [-e pattern] [-f file] "
        "[pattern] [file ...]\n");
  }
  /*------------------------------------------------------------------*
    for (size_t i = 0; i < sizeof(struct options) / sizeof(int); i++) {
        printf("[%d]", ((int *)ptr_grep)[i]);
    }
    printf("\n");
  *------------------------------------------------------------------*/
  return 0;
}
