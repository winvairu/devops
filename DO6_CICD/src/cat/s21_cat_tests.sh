#!/bin/bash
echo "Option test: -b"
cat -b man_cat.txt > b_catd.txt
./s21_cat -b man_cat.txt > b_s21_catd.txt
echo "The number of lines in b_catd.txt: $(wc -l < b_catd.txt)"
echo "The number of lines in b_s21_catd.txt: $(wc -l < b_s21_catd.txt)"
diff --brief b_catd.txt b_s21_catd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: --number-nonblank"
cat -b man_cat.txt > number_nonblank_catd.txt
./s21_cat --number-nonblank man_cat.txt > number_nonblank_s21_catd.txt
echo "The number of lines in number_nonblank_catd.txt: $(wc -l < number_nonblank_catd.txt)"
echo "The number of lines in number_nonblank_s21_catd.txt: $(wc -l < number_nonblank_s21_catd.txt)"
diff --brief number_nonblank_catd.txt number_nonblank_s21_catd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -e"
cat -e man_cat.txt > e_catd.txt
./s21_cat -e man_cat.txt > e_s21_catd.txt
echo "The number of lines in e_catd.txt: $(wc -l < e_catd.txt)"
echo "The number of lines in e_s21_catd.txt: $(wc -l < e_s21_catd.txt)"
diff --brief e_catd.txt e_s21_catd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -n"
cat -n man_cat.txt > n_catd.txt
./s21_cat -n man_cat.txt > n_s21_catd.txt
echo "The number of lines in n_catd.txt: $(wc -l < n_catd.txt)"
echo "The number of lines in n_s21_catd.txt: $(wc -l < n_s21_catd.txt)"
diff --brief n_catd.txt n_s21_catd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: --number"
cat -n man_cat.txt > number_catd.txt
./s21_cat --number man_cat.txt > number_s21_catd.txt
echo "The number of lines in number_catd.txt: $(wc -l < number_catd.txt)"
echo "The number of lines in number_s21_catd.txt: $(wc -l < number_s21_catd.txt)"
diff --brief number_catd.txt number_s21_catd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi

echo
echo "Option test: -s"
cat -s text.txt > s_catd.txt
./s21_cat -s text.txt > s_s21_catd.txt
echo "The number of lines in s_catd.txt: $(wc -l < s_catd.txt)"
echo "The number of lines in s_s21_catd.txt: $(wc -l < s_s21_catd.txt)"
diff --brief s_catd.txt s_s21_catd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi


echo
echo "Option test: --squeeze-blank"
cat -s text.txt > squeeze_blank_catd.txt
./s21_cat --squeeze-blank text.txt > squeeze_blank_s21_catd.txt
echo "The number of lines in squeeze_blank_catd.txt: $(wc -l < squeeze_blank_catd.txt)"
echo "The number of lines in squeeze_blank_s21_catd.txt: $(wc -l < squeeze_blank_s21_catd.txt)"
diff --brief squeeze_blank_catd.txt squeeze_blank_s21_catd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi


echo
echo "Option test: -t"
cat -t tab.txt > t_catd.txt
./s21_cat -t tab.txt > t_s21_catd.txt
echo "The number of lines in t_catd.txt: $(wc -l < t_catd.txt)"
echo "The number of lines in t_s21_catd.txt: $(wc -l < t_s21_catd.txt)"
diff --brief t_catd.txt t_s21_catd.txt > /dev/null
if [ $? -eq 0 ]; then
    echo "The files are identical."
else
    echo "The files are not identical."
fi
