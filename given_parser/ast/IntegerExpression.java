package ast;

import cfg.Block;
import llvm.Instruction;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class IntegerExpression
   extends AbstractExpression {
   private final String value;

   public IntegerExpression(int lineNum, String value) {
      super(lineNum);
      this.value = value;
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      return new IntType();
   }

   @Override
   public Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      return new ValueLiteral(value);
   }
}
