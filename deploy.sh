#!/usr/bin/bash


scp artifacts/s21_cat scp artifacts/s21_grep kristieg@172.24.116.8:/home/kristieg/
ssh -p 22 kristieg@172.24.116.8
mv s21_cat s21_grep /usr/local/bin
