#!/bin/bash

cd given_parser
export CLASSPATH="../lib/antlr-4.7.1-complete.jar:../lib/javax.json-1.0.4.jar:.:$CLASSPATH"
make clean
make
for d in ../benchmarks/* ; do
   java -ea MiniCompiler -stack ${d}/`basename ${d}`.mini 
   cp ../output.ll ${d}/`basename ${d}`.ll
   cp ../output.s ${d}/`basename ${d}`.s
done
cd ..

echo "compiled!"

for d in benchmarks/* ;do
   
   echo "COMPILING $d Regular"
   gcc -g -w -march=armv7-a -o ${d}/`basename ${d}`.out ${d}/`basename ${d}`.s

done
