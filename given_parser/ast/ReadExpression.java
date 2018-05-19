package ast;

import cfg.Block;
import llvm.Instruction;
import llvm.Load;
import llvm.Read;
import llvm.value.Global;
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
   public Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      Register r1 = RegisterCounter.getNextRegister();
      Global scratch = new Global(".read_scratch");
      Read read = new Read(scratch);
      Load load = new Load(r1, "i32", scratch);
      instructionList.add(read);
      instructionList.add(load);
      return r1;
   }
}
