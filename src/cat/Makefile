GCC = gcc -Wall -Werror -Wextra

all : s21_cat

s21_cat :
	$(GCC) -c cat.c
	$(GCC) cat.o -o s21_cat

clean :
	rm -rf *.o

rebuild :
	rm -rf *.o
	rm s21_cat
	make -f Makefile
