#!/bin/bash

cd given_parser
export CLASSPATH="../lib/antlr-4.7.1-complete.jar:../lib/javax.json-1.0.4.jar:.:$CLASSPATH"
make clean
make
java -ea MiniCompiler $1 -o
cd ..
gcc -g -w -march=armv7-a -o output.out output.s
./output.out
