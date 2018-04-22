package ast;

import llvm.Instruction;
import llvm.Load;
import llvm.value.Global;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;

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
   public Value getCFGValue(List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      Register returnReg = RegisterCounter.getNextRegister();
      Value value;
      if (isLocal) {
         value = new Register(id);
      } else {
         value = new Global(id);
      }
      Instruction instruction = new Load(returnReg, this.type.getCFGType(), value);
      instructionList.add(instruction);
      return returnReg;
   }
}
