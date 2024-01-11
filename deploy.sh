#!/usr/bin/bash

scp artifacts/s21_cat artifacts/s21_grep kristieg@172.24.116.8:/usr/bin/bash "echo suchkablyat"
ssh kristieg@172.24.116.8 ls /usr/bin/bash
