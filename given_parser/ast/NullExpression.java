package ast;

import llvm.Instruction;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class NullExpression
   extends AbstractExpression {
   public NullExpression(int lineNum) {
      super(lineNum);
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      return new VoidType();
   }

   @Override
   public Value getCFGValue(List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      return new ValueLiteral("null");
   }
}
