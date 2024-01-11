#!/bin/bash

scp artifacts/s21_cat artifacts/s21_grep kristieg@172.24.116.8:.
ssh kristieg@172.24.116.8
sudo mv s21_grep /usr/local/bin/
sudo mv s21_cat /usr/local/bin/
logout
