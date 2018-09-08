#!/bin/bash

runWithFlag () {
   echo "timing $2 $3:"
   cd given_parser
   java -ea MiniCompiler ../$1/$2.mini $3
   cp ../output.ll ../$1/$2.ll
   cp ../output.s ../$1/$2.s
   cd ..
   gcc -g -w -march=armv7-a -o $1/$2.out $1/$2.s
   time $1/./$2.out < $1/input.longer > ${d}/ourOutput.longer
   if cmp -s ${d}/ourOutput.longer ${d}/output.longer; then
      echo "RUNNING $d Regular ... PASSED"
   else
      echo "RUNNING $d Regular ... FAILED"
   fi
   echo ""
}


cd given_parser
export CLASSPATH="../lib/antlr-4.7.1-complete.jar:../lib/javax.json-1.0.4.jar:.:$CLASSPATH"
make clean
make
cd ..

for d in benchmarks/* ;do
#   runWithFlag ${d} `basename ${d}` "-stack"
#   runWithFlag ${d} `basename ${d}` ""
#   runWithFlag ${d} `basename ${d}` "-i"
#   runWithFlag ${d} `basename ${d}` "-c -u"
#   runWithFlag ${d} `basename ${d}` "-o"

   echo "timing $d GCC -O0"
   gcc -O0 -o ${d}/`basename ${d}`-gcc.out ${d}/`basename ${d}`.c
   time ${d}/./`basename ${d}`-gcc.out <  ${d}/input.longer > gccOut

   echo "timing $d GCC -O3"
   gcc -O3 -o ${d}/`basename ${d}`-gcc.out ${d}/`basename ${d}`.c
   time ${d}/./`basename ${d}`-gcc.out <  ${d}/input.longer > gccOut



#   cd given_parser
#   java -ea MiniCompiler -stack ../${d}/`basename ${d}`.mini
#   cp ../output.ll ../${d}/`basename ${d}`.ll
#   cp ../output.s ../${d}/`basename ${d}`.s
#   cd ..
#   gcc -g -w -march=armv7-a -o ${d}/`basename ${d}`.out ${d}/`basename ${d}`.s
#   ${d}/./`basename ${d}`.out <  ${d}/input > ${d}/ourOutput
#   if cmp -s ${d}/ourOutput ${d}/output; then
#      echo "RUNNING $d Regular ... PASSED"
#   else
#      echo "RUNNING $d Regular ... FAILED"
#   fi


#   echo "RUNNING $d Longer"
#   ${d}/./`basename ${d}`.out <  ${d}/input.longer > ${d}/ourOutputLonger
#   if diff ${d}/ourOutputLonger ${d}/output.longer &> /dev/null ; then
#      echo "PASSED"
#   else
#      echo "FAILED"
#   fi

done

