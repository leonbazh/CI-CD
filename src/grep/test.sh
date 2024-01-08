filename=Makefile;
echo ---MANUAL_FLAGS---
diff <(grep -e int test.txt) <(./s21_grep -e int test.txt) -s
diff <(grep -i int test.txt) <(./s21_grep -i int test.txt) -s
diff <(grep -v int test.txt) <(./s21_grep -v int test.txt) -s
diff <(grep -c int test.txt) <(./s21_grep -c int test.txt) -s
diff <(grep -l int test.txt) <(./s21_grep -l int test.txt) -s
diff <(grep -n int test.txt) <(./s21_grep -n int test.txt) -s
diff <(grep -h int test.txt) <(./s21_grep -h int test.txt) -s
diff <(grep -s int test.txt) <(./s21_grep -s int test.txt) -s
diff <(grep -f testf.txt grep.c) <(./s21_grep -f testf.txt grep.c) -s
diff <(grep -o int test.txt) <(./s21_grep -o int test.txt) -s
echo ---DOUBLE_FLAGS---
echo ---------E--------
diff <(grep -e int -i test.txt) <(./s21_grep -e int -i test.txt) -s
diff <(grep -e int -v test.txt) <(./s21_grep -e int -v test.txt) -s
diff <(grep -e int -c test.txt) <(./s21_grep -e int -c test.txt) -s
diff <(grep -e int -l test.txt) <(./s21_grep -e int -l test.txt) -s
diff <(grep -e int -n test.txt) <(./s21_grep -e int -n test.txt) -s
diff <(grep -e int -h test.txt) <(./s21_grep -e int -h test.txt) -s
diff <(grep -e int -s test.txt) <(./s21_grep -e int -s test.txt) -s
diff <(grep -e int -f testf.txt test.txt) <(./s21_grep -e int -f testf.txt test.txt) -s
diff <(grep -e int -o test.txt) <(./s21_grep -e int -o test.txt) -s
echo ---------I--------
diff <(grep -ie int test.txt) <(./s21_grep -ie int test.txt) -s
diff <(grep -iv int test.txt) <(./s21_grep -iv int test.txt) -s
diff <(grep -ic int test.txt) <(./s21_grep -ic int test.txt) -s
diff <(grep -il int test.txt) <(./s21_grep -il int test.txt) -s
diff <(grep -in int test.txt) <(./s21_grep -in int test.txt) -s
diff <(grep -ih int test.txt) <(./s21_grep -ih int test.txt) -s
diff <(grep -is int test.txt) <(./s21_grep -is int test.txt) -s
diff <(grep -if testf.txt test.txt) <(./s21_grep -if testf.txt test.txt) -s
diff <(grep -io int test.txt) <(./s21_grep -io int test.txt) -s
echo ---------C--------
diff <(grep -ci int test.txt) <(./s21_grep -ci int test.txt) -s
diff <(grep -cv int test.txt) <(./s21_grep -cv int test.txt) -s
diff <(grep -ce int test.txt) <(./s21_grep -ce int test.txt) -s
diff <(grep -cl int test.txt) <(./s21_grep -cl int test.txt) -s
diff <(grep -cn int test.txt) <(./s21_grep -cn int test.txt) -s
diff <(grep -ch int test.txt) <(./s21_grep -ch int test.txt) -s
diff <(grep -cs int test.txt) <(./s21_grep -cs int test.txt) -s
diff <(grep -cf testf.txt test.txt) <(./s21_grep -cf testf.txt test.txt) -s
diff <(grep -co int test.txt) <(./s21_grep -co int test.txt) -s
echo ---------L--------
diff <(grep -li int test.txt) <(./s21_grep -li int test.txt) -s
diff <(grep -lv int test.txt) <(./s21_grep -lv int test.txt) -s
diff <(grep -le int test.txt) <(./s21_grep -le int test.txt) -s
diff <(grep -lc int test.txt) <(./s21_grep -lc int test.txt) -s
diff <(grep -ln int test.txt) <(./s21_grep -ln int test.txt) -s
diff <(grep -lh int test.txt) <(./s21_grep -lh int test.txt) -s
diff <(grep -ls int test.txt) <(./s21_grep -ls int test.txt) -s
diff <(grep -lf testf.txt test.txt) <(./s21_grep -lf testf.txt test.txt) -s
diff <(grep -lo int test.txt) <(./s21_grep -lo int test.txt) -s
echo ---------N--------
diff <(grep -ni int test.txt) <(./s21_grep -ni int test.txt) -s
diff <(grep -nv int test.txt) <(./s21_grep -nv int test.txt) -s
diff <(grep -ne int test.txt) <(./s21_grep -ne int test.txt) -s
diff <(grep -nl int test.txt) <(./s21_grep -nl int test.txt) -s
diff <(grep -nc int test.txt) <(./s21_grep -nc int test.txt) -s
diff <(grep -nh int test.txt) <(./s21_grep -nh int test.txt) -s
diff <(grep -ns int test.txt) <(./s21_grep -ns int test.txt) -s
diff <(grep -nf testf.txt test.txt) <(./s21_grep -nf testf.txt test.txt) -s
diff <(grep -no int test.txt) <(./s21_grep -no int test.txt) -s
echo ---------H--------
diff <(grep -hi int test.txt) <(./s21_grep -hi int test.txt) -s
diff <(grep -hv int test.txt) <(./s21_grep -hv int test.txt) -s
diff <(grep -he int test.txt) <(./s21_grep -he int test.txt) -s
diff <(grep -hl int test.txt) <(./s21_grep -hl int test.txt) -s
diff <(grep -hn int test.txt) <(./s21_grep -hn int test.txt) -s
diff <(grep -hc int test.txt) <(./s21_grep -hc int test.txt) -s
diff <(grep -hs int test.txt) <(./s21_grep -hs int test.txt) -s
diff <(grep -hf testf.txt test.txt) <(./s21_grep -hf testf.txt test.txt) -s
diff <(grep -ho int test.txt) <(./s21_grep -ho int test.txt) -s
echo ---------S--------
diff <(grep -si int test.txt) <(./s21_grep -si int test.txt) -s
diff <(grep -sv int test.txt) <(./s21_grep -sv int test.txt) -s
diff <(grep -se int test.txt) <(./s21_grep -se int test.txt) -s
diff <(grep -sl int test.txt) <(./s21_grep -sl int test.txt) -s
diff <(grep -sn int test.txt) <(./s21_grep -sn int test.txt) -s
diff <(grep -sh int test.txt) <(./s21_grep -sh int test.txt) -s
diff <(grep -sc int test.txt) <(./s21_grep -sc int test.txt) -s
diff <(grep -sf testf.txt test.txt) <(./s21_grep -sf testf.txt test.txt) -s
diff <(grep -so int test.txt) <(./s21_grep -so int test.txt) -s
echo ---------F--------
diff <(grep -f testf.txt -i test.txt) <(./s21_grep -f testf.txt -i test.txt) -s
diff <(grep -f testf.txt -v test.txt) <(./s21_grep -f testf.txt -v test.txt) -s
diff <(grep -f testf.txt -l test.txt) <(./s21_grep -f testf.txt -l test.txt) -s
diff <(grep -f testf.txt -n test.txt) <(./s21_grep -f testf.txt -n test.txt) -s
diff <(grep -f testf.txt -h test.txt) <(./s21_grep -f testf.txt -h test.txt) -s
diff <(grep -f testf.txt -s test.txt) <(./s21_grep -f testf.txt -s test.txt) -s
diff <(grep -f testf.txt -c test.txt) <(./s21_grep -f testf.txt -c test.txt) -s
diff <(grep -f testf.txt -o test.txt) <(./s21_grep -f testf.txt -o test.txt) -s
echo ---------O--------
diff <(grep -oi int test.txt) <(./s21_grep -oi int test.txt) -s
diff <(grep -ov int test.txt) <(./s21_grep -ov int test.txt) -s
diff <(grep -oe int test.txt) <(./s21_grep -oe int test.txt) -s
diff <(grep -ol int test.txt) <(./s21_grep -ol int test.txt) -s
diff <(grep -on int test.txt) <(./s21_grep -on int test.txt) -s
diff <(grep -oh int test.txt) <(./s21_grep -oh int test.txt) -s
diff <(grep -os int test.txt) <(./s21_grep -os int test.txt) -s
diff <(grep -of testf.txt test.txt) <(./s21_grep -of testf.txt test.txt) -s
diff <(grep -oc int test.txt) <(./s21_grep -oc int test.txt) -s
echo -----ALL_FLAGS-----
diff <(grep -e int -ovlnhsc -f testf.txt test.txt) <(./s21_grep -e int -ovlnhsc -f testf.txt test.txt) -s