#!/bin/bash

for md in $(ls -1 ../src/*.md)
do
    tmp=${md/..\/src\//}
    html=${tmp/.md/.html}
    pandoc -o $html $md
done
