GCC = gcc -Wall -Werror -Wextra

all : s21_grep

s21_grep :
	$(GCC) -c grep.c
	$(GCC) grep.o -o s21_grep

clean :
	rm -rf *.o

rebuild :
	rm -rf *.o
	rm s21_grep
	make -f Makefile
