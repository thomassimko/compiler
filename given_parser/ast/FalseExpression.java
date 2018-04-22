package ast;

import llvm.Instruction;
import llvm.ZExtend;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class FalseExpression
   extends AbstractExpression
{
   public FalseExpression(int lineNum)
   {
      super(lineNum);
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      return new BoolType();
   }

   @Override
   public Value getCFGValue(List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      Value val = new ValueLiteral("0");
      Register r1 = RegisterCounter.getNextRegister();
      ZExtend extend = new ZExtend(val, r1);
      instructionList.add(extend);
      return r1;
   }
}
