#!/bin/bash

version="2_0_1"

pandoc -N -o "omnidb_$version.pdf" ../src/*.md --variable mainfont="Palatino" --variable sansfont="Helvetica" --variable monofont="Menlo" --variable fontsize=12pt --variable version=$version --toc
