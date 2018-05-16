#!/bin/bash

cd given_parser
export CLASSPATH="../lib/antlr-4.7.1-complete.jar:../lib/javax.json-1.0.4.jar:.:$CLASSPATH"
make clean
make
cd ..

for d in benchmarks/* ;do
   cd given_parser
   java -ea MiniCompiler -stack ../${d}/`basename ${d}`.mini
   cp ../output.ll ../${d}/`basename ${d}`.ll
   cp ../output.s ../${d}/`basename ${d}`.s
   cd ..
   gcc -g -w -march=armv7-a -o ${d}/`basename ${d}`.out ${d}/`basename ${d}`.s
   ${d}/./`basename ${d}`.out <  ${d}/input > ${d}/ourOutput
   if cmp -s ${d}/ourOutput ${d}/output; then
     echo "RUNNING $d Regular ... PASSED"
   else
     echo "RUNNING $d Regular ... FAILED"
   fi


#   echo "RUNNING $d Longer"
#   ${d}/./`basename ${d}`.out <  ${d}/input.longer > ${d}/ourOutputLonger
#   if diff ${d}/ourOutputLonger ${d}/output.longer &> /dev/null ; then
#      echo "PASSED"
#   else
#      echo "FAILED"
#   fi

done
