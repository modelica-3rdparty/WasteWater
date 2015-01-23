#!/bin/sh
# Generates mos-scripts to simulate using omc

for num in 1 2d 3; do
  for upper in Complex Bench Small; do
    lower=`echo $upper | tr "A-Z" "a-z"`
    sed -e "s/#num/$num/g" -e "s/#upper/$upper/g" -e "s/#lower/$lower/g" gen_omc.tpl > ../ASM$num/omc_$lower.mos
  done
done
