#!/bin/bash
echo "Option test: -e"
grep -e All man_grep.txt > e_grepd.txt
./s21_grep -e All man_grep.txt > e_s21_grepd.txt
echo "The number of lines in e_grepd.txt: $(wc -l < e_grepd.txt)"
echo "The number of lines in e_s21_grepd.txt: $(wc -l < e_s21_grepd.txt)"
diff --brief e_grepd.txt e_s21_grepd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -i"
grep -i All man_grep.txt man_grep.txt > i_grepd.txt
./s21_grep -i All man_grep.txt man_grep.txt > i_s21_grepd.txt
echo "The number of lines in i_grepd.txt: $(wc -l < i_grepd.txt)"
echo "The number of lines in i_s21_grepd.txt: $(wc -l < i_s21_grepd.txt)"
diff --brief i_grepd.txt i_s21_grepd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -v"
grep -v All man_grep.txt > v_grepd.txt
./s21_grep -v All man_grep.txt > v_s21_grepd.txt
echo "The number of lines in v_grepd.txt: $(wc -l < v_grepd.txt)"
echo "The number of lines in v_s21_grepd.txt: $(wc -l < v_s21_grepd.txt)"
diff --brief v_grepd.txt v_s21_grepd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -c"
grep -c All man_grep.txt t > c_grepd.txt
./s21_grep -c All man_grep.txt t > c_s21_grepd.txt
echo "The number of lines in c_grepd.txt: $(wc -l < c_grepd.txt)"
echo "The number of lines in c_s21_grepd.txt: $(wc -l < c_s21_grepd.txt)"
diff --brief c_grepd.txt c_s21_grepd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -l"
grep -l All man_grep.txt pattern.txt > l_grepd.txt
./s21_grep -l All man_grep.txt pattern.txt > l_s21_grepd.txt
echo "The number of lines in l_grepd.txt: $(wc -l < l_grepd.txt)"
echo "The number of lines in l_s21_grepd.txt: $(wc -l < l_s21_grepd.txt)"
diff --brief l_grepd.txt l_s21_grepd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -n"
grep -n All man_grep.txt > n_grepd.txt
./s21_grep -n All man_grep.txt > n_s21_grepd.txt
echo "The number of lines in n_grepd.txt: $(wc -l < n_grepd.txt)"
echo "The number of lines in n_s21_grepd.txt: $(wc -l < n_s21_grepd.txt)"
diff --brief n_grepd.txt n_s21_grepd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -h"
grep -h All man_grep.txt pattern.txt qw > h_grepd.txt
./s21_grep -h All man_grep.txt pattern.txt qw > h_s21_grepd.txt
echo "The number of lines in h_grepd.txt: $(wc -l < h_grepd.txt)"
echo "The number of lines in h_s21_grepd.txt: $(wc -l < h_s21_grepd.txt)"
diff --brief h_grepd.txt h_s21_grepd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -s"
grep -s All man_grep.txt pattern.txt qw > s_grepd.txt
./s21_grep -s All man_grep.txt pattern.txt qw > s_s21_grepd.txt
echo "The number of lines in s_grepd.txt: $(wc -l < s_grepd.txt)"
echo "The number of lines in s_s21_grepd.txt: $(wc -l < s_s21_grepd.txt)"
diff --brief s_grepd.txt s_s21_grepd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -f file"
grep -f pattern.txt man_grep.txt > f_grepd.txt
./s21_grep -f pattern.txt man_grep.txt > f_s21_grepd.txt
echo "The number of lines in f_grepd.txt: $(wc -l < f_grepd.txt)"
echo "The number of lines in f_s21_grepd.txt: $(wc -l < f_s21_grepd.txt)"
diff --brief f_grepd.txt f_s21_grepd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -o"
grep -o All man_grep.txt tttt > o_grepd.txt
./s21_grep -o All man_grep.txt tttt > o_s21_grepd.txt
echo "The number of lines in o_grepd.txt: $(wc -l < o_grepd.txt)"
echo "The number of lines in o_s21_grepd.txt: $(wc -l < o_s21_grepd.txt)"
diff --brief o_grepd.txt o_s21_grepd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi
