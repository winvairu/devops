CC = gcc
CFLAGS = -std=c11 -Wall -Werror -Wextra
CAT = ../cat/
GREP = ../grep/

.PHONY: all s21_cat rebuild clean

all: s21_cat


s21_cat: $(CAT)s21_cat.o $(CAT)s21_cat_functions.o
		$(CC) $(CAT)s21_cat.o $(CAT)s21_cat_functions.o -o $(CAT)s21_cat

s21_cat.o: $(CAT)s21_cat.c
		$(CC) -c $(CFLAGS) $(CAT)s21_cat.c

s21_cat_functions.o: $(CAT)s21_cat_functions.c
		$(CC) -c $(CFLAGS) $(CAT)s21_cat_functions.c


s21_grep: $(GREP)s21_grep.o $(GREP)s21_grep_functions.o
		$(CC) $(GREP)s21_grep.o $(GREP)s21_grep_functions.o -o $(GREP)s21_grep

s21_grep.o: $(GREP)s21_grep.c
		$(CC) -c $(CFLAGS) $(GREP)s21_grep.c

s21_grep_functions.o: $(GREP)s21_grep_functions.c
		$(CC) -c $(CFLAGS) $(GREP)s21_grep_functions.c


rebuild: clean all

clean:
		rm -rf $(CAT)*.o
		rm -rf $(CAT)s21_cat
		rm -rf $(CAT)*d.txt
		rm -rf $(GREP)*.o
		rm -rf $(GREP)s21_grep
		rm -rf $(GREP)*d.txt

clean_cat:
		rm -rf $(CAT)*.o
		rm -rf $(CAT)s21_cat
		rm -rf $(CAT)*d.txt

clean_grep:
		rm -rf $(GREP)*.o
		rm -rf $(GREP)s21_grep
		rm -rf $(GREP)*d.txt
