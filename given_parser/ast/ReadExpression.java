package ast;

import llvm.Instruction;
import llvm.Read;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class ReadExpression
   extends AbstractExpression {
   public ReadExpression(int lineNum) {
      super(lineNum);
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      return new IntType();
   }

   @Override
   public Value getCFGValue(List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      Register r1 = RegisterCounter.getNextRegister();
      Read read = new Read(r1);
      instructionList.add(read);
      return r1;
   }
}
