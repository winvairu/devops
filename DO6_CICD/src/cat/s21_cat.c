#include "s21_cat.h"

int main(int argc, char const *argv[]) {
  struct options cat = {};
  struct options *ptr_cat;
  ptr_cat = &cat;
  if (argc > 1) {
    const int option = find_options(argc, argv, ptr_cat);
    if ((*ptr_cat).options != 1) {
      open_file(argc, argv, ptr_cat, &option);
    } else {
      fprintf(stderr, "error2_s21_cat: illegal option: %s\n", argv[option - 1]);
      fprintf(stderr, "usage: s21_cat [-benst] [file ...]\n");
    }
  } else {
    fprintf(stderr, "error1_s21_cat: usage: s21_cat [-benst] [file ...]\n");
  }
  /*-------------------------------------------------------------------*
  for (size_t i = 0; i < sizeof(struct options) / sizeof(int); i++) {
      printf("[%d]", ((int *)ptr_cat)[i]);
  }
  printf("\n");
  *-------------------------------------------------------------------*/
  return 0;
}
