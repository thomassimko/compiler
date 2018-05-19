package ast;

import cfg.Block;
import llvm.Instruction;
import llvm.Load;
import llvm.value.*;

import java.util.HashMap;
import java.util.List;

public class IdentifierExpression
   extends AbstractExpression
{
   private final String id;
   private boolean isLocal;
   private Type type;

   public IdentifierExpression(int lineNum, String id)
   {
      super(lineNum);
      this.id = id;
      isLocal = false;
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      if (currentFunctionName != null) {
         FunctionType fType = (FunctionType) globalTable.get(currentFunctionName);

         assert fType.getLocalScope().containsKey(id) || globalTable.containsKey(id) : "Id not defined at line " + this.lineNum;

         if (fType.getLocalScope().containsKey(id)) {
            isLocal = true;
            type = fType.getLocalScope().get(id);
            return this.type;
         }
      }
      assert globalTable.containsKey(id) : "Id not defined at line " + this.lineNum;
      type = globalTable.get(id);
      return this.type;
   }

   @Override
   public Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      Value value;
      if (isLocal) {
         if (SSA.isSSA) {
//            System.out.println("reading " + id + " on line " + lineNum + ", found value " + SSA.readVariable(block, id, type).toLLVM());
            return SSA.readVariable(block, id, type);
         }
         value = new Register(id);
      } else {
         value = new Global(id);
      }
      Register returnReg = RegisterCounter.getNextRegister();
      Instruction instruction = new Load(returnReg, this.type.getCFGType(), value);
      instructionList.add(instruction);
      return returnReg;
   }
}
