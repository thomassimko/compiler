package ast;

import cfg.Block;
import llvm.BitCast;
import llvm.Instruction;
import llvm.Malloc;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class NewExpression
   extends AbstractExpression
{
   private final String id;

   public NewExpression(int lineNum, String id)
   {
      super(lineNum);
      this.id = id;
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert structTable.containsKey(id) : "No structure " + id + " defined : line " + lineNum;
      return new StructType(lineNum, id);
   }

   @Override
   public Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      Register reg1 = RegisterCounter.getNextRegister();
      Register reg2 = RegisterCounter.getNextRegister();

      Instruction malloc = new Malloc(reg1, structTable.get(id).size());
      Instruction bitcast = new BitCast(reg2, reg1, "i8*", "%struct." + id + "*");

      instructionList.add(malloc);
      instructionList.add(bitcast);

      return reg2;
   }
}
