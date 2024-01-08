#!/bin/bash

rm -rf style_check.txt
clang-format -n */*.c &> "style_check.txt"
check=$(cat style_check.txt)
if [[ -n $check ]];then
  echo Code is not clang-formatted
  echo $check
  exit 1
else
  echo Code is clang-formatted
fi
