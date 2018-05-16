#!/bin/bash

rm -f cfg.ps cfg.gv
cd given_parser
export CLASSPATH="../lib/antlr-4.7.1-complete.jar:../lib/javax.json-1.0.4.jar:.:$CLASSPATH"
make clean
make
java -ea MiniCompiler -stack $1
cd ..
dot -Tpng cfg.gv -o cfg.png
open cfg.png
open -a "Xcode" output.ll
