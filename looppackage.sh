#!/bin/bash

for j in $@
do
 yum install $j -y
done