#!/usr/bin/bash


scp artifacts/s21_cat artifacts/s21_grep kristieg@172.24.116.8:.
ssh -p 22 kristieg@172.24.116.8 "echo 'suchkablyat' | ls /usr/local/bin | sudo -S mv s21_cat s21_grep /usr/local/bin"
