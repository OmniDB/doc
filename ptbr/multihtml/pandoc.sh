#!/bin/bash

for md in $(ls -1 ../src/*.md)
do
    tmp=${md/..\/src\//}
    html=${tmp/.md/.html}
    pandoc -fmarkdown-implicit_figures -o $html $md
done
