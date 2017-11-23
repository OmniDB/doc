#!/bin/bash

version="2_4_0"

pandoc -N -s -fmarkdown-implicit_figures -o "omnidb_$version.html" ../src/*.md --toc
