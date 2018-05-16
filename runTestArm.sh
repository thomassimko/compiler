#!/bin/bash

cd given_parser
export CLASSPATH="../lib/antlr-4.7.1-complete.jar:../lib/javax.json-1.0.4.jar:.:$CLASSPATH"
make clean
make
java -ea MiniCompiler $1 -stack
cd ..
dot -Tpng interference.gv -o interference.png
open interference.png
open -a "Xcode" output.s
