filename=Makefile;
echo ---MANUAL_FLAGS---
diff <(cat -b test.txt) <(./s21_cat -b test.txt) -s
diff <(cat -e "test.txt") <(./s21_cat -e "test.txt") -s
diff <(cat -n "test.txt") <(./s21_cat -n "test.txt") -s
diff <(cat -s "test.txt") <(./s21_cat -s "test.txt") -s
diff <(cat -v "test.txt") <(./s21_cat -v "test.txt") -s
diff <(cat -t "test.txt") <(./s21_cat -t "test.txt") -s
echo ---DOUBLE_FLAGS---
echo ---------B--------
diff <(cat -be test.txt) <(./s21_cat -be test.txt) -s
diff <(cat -bn test.txt) <(./s21_cat -bn test.txt) -s
diff <(cat -bs test.txt) <(./s21_cat -bs test.txt) -s
diff <(cat -bv test.txt) <(./s21_cat -bv test.txt) -s
diff <(cat -bt test.txt) <(./s21_cat -bt test.txt) -s
echo ---------E--------
diff <(cat -eb test.txt) <(./s21_cat -eb test.txt) -s
diff <(cat -en test.txt) <(./s21_cat -en test.txt) -s
diff <(cat -es test.txt) <(./s21_cat -es test.txt) -s
diff <(cat -ev test.txt) <(./s21_cat -ev test.txt) -s
diff <(cat -et test.txt) <(./s21_cat -et test.txt) -s
echo ---------N---------
diff <(cat -ne test.txt) <(./s21_cat -ne test.txt) -s
diff <(cat -nb test.txt) <(./s21_cat -nb test.txt) -s
diff <(cat -ns test.txt) <(./s21_cat -ns test.txt) -s
diff <(cat -nv test.txt) <(./s21_cat -nv test.txt) -s
diff <(cat -nt test.txt) <(./s21_cat -nt test.txt) -s
echo ---------S---------
diff <(cat -se test.txt) <(./s21_cat -se test.txt) -s
diff <(cat -sb test.txt) <(./s21_cat -sb test.txt) -s
diff <(cat -sn test.txt) <(./s21_cat -sn test.txt) -s
diff <(cat -sv test.txt) <(./s21_cat -sv test.txt) -s
diff <(cat -st test.txt) <(./s21_cat -st test.txt) -s
echo ---------V---------
diff <(cat -ve test.txt) <(./s21_cat -ve test.txt) -s
diff <(cat -vb test.txt) <(./s21_cat -vb test.txt) -s
diff <(cat -vs test.txt) <(./s21_cat -vs test.txt) -s
diff <(cat -vn test.txt) <(./s21_cat -vn test.txt) -s
diff <(cat -vt test.txt) <(./s21_cat -vt test.txt) -s
echo ---------T---------
diff <(cat -te test.txt) <(./s21_cat -te test.txt) -s
diff <(cat -tb test.txt) <(./s21_cat -tb test.txt) -s
diff <(cat -ts test.txt) <(./s21_cat -ts test.txt) -s
diff <(cat -tv test.txt) <(./s21_cat -tv test.txt) -s
diff <(cat -tn test.txt) <(./s21_cat -tn test.txt) -s
echo -----ALL_FLAGS-----
diff <(cat -bensvt test.txt) <(./s21_cat -bensvt test.txt) -s
