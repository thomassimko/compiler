#!/bin/bash

rm -f cfg.ps cfg.gv
cd given_parser
export CLASSPATH="../lib/antlr-4.7.1-complete.jar:../lib/javax.json-1.0.4.jar:.:$CLASSPATH"
make clean
make
java -ea MiniCompiler $1
cd ..
dot -Tps cfg.gv -o cfg.ps
open cfg.ps
