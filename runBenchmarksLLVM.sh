#!/bin/bash

cd given_parser
export CLASSPATH="../lib/antlr-4.7.1-complete.jar:../lib/javax.json-1.0.4.jar:.:$CLASSPATH"
make clean
make
for d in ../benchmarks/* ; do
   java -ea MiniCompiler -stack ${d}/`basename ${d}`.mini 
   cp ../output.ll ${d}/`basename ${d}`.ll
done
cd ..

for d in benchmarks/* ;do
   
   echo "RUNNING $d Regular"
   clang -m32 -w -o ${d}/exe ${d}/`basename ${d}`.ll
   ${d}/./exe <  ${d}/input > ${d}/ourOutput
   diff ${d}/ourOutput ${d}/output 

   echo "RUNNING $d Longer"
   clang -m32 -w -o ${d}/exeLonger ${d}/`basename ${d}`.ll
   ${d}/./exeLonger <  ${d}/input.longer > ${d}/ourOutputLonger
   diff ${d}/ourOutputLonger ${d}/output.longer

done
