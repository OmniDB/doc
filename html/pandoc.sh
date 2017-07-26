#!/bin/bash

version="2_0_1"

pandoc -N -s -o "omnidb_$version.html" ../src/*.md
