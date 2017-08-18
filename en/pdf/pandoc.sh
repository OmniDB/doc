#!/bin/bash

version="2_0_4"

pandoc -N -fmarkdown-implicit_figures -o "omnidb_$version.pdf" ../src/*.md --variable mainfont="Palatino" --variable sansfont="Helvetica" --variable monofont="Menlo" --variable fontsize=12pt --variable version=$version --toc
