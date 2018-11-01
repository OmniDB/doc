#!/bin/bash

# Put file misc/eisvogel.latex in ~/.pandoc/templates/
# Credits: https://github.com/Wandmalfarbe/pandoc-latex-template

pandoc *.md -o omnidb_handbook.pdf --toc --template eisvogel --listings --top-level-division=chapter -V lang=en-US -V titlepage=true -V toc-own-page=true -V logo=../../misc/omnidb_logo.png -V logo-width=240 -V book -V classoption=oneside -V listings-disable-line-numbers=true
