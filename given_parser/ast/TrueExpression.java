package ast;

import cfg.Block;
import llvm.Instruction;
import llvm.ZExtend;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class TrueExpression
   extends AbstractExpression {
   public TrueExpression(int lineNum) {
      super(lineNum);
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      return new BoolType();
   }

   @Override
   public Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      Value val = new ValueLiteral("1");
      Register r1 = RegisterCounter.getNextRegister();
      ZExtend extend = new ZExtend(val, r1);
      instructionList.add(extend);
      return r1;
   }
}
