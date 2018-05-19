package ast;

import cfg.Block;
import llvm.*;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.SSA;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class ReturnStatement
   extends AbstractStatement
{
   private final Expression expression;
   private Type returnType;

   public ReturnStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert currentFunctionName != null : "Cannot return from outside of a function : line " + lineNum;
      assert globalTable.get(currentFunctionName) instanceof FunctionType;
      FunctionType fType = (FunctionType) globalTable.get(currentFunctionName);
      this.returnType = fType.getReturnType();
      if(fType.getReturnType() instanceof StructType) {
         Type expType = expression.getType(globalTable, structTable, currentFunctionName);
         assert expType instanceof StructType || expType instanceof VoidType : "Return statement does not match return type on line " + lineNum;
         if (expType instanceof StructType) {
            assert ((StructType) expType).getName().equals(((StructType) fType.getReturnType()).getName()) : "Struct types do not match on line " + lineNum;
         }
      }
      else {
         assert expression.getType(globalTable, structTable, currentFunctionName).getClass() == fType.getReturnType().getClass()
                 : "Return type does not match value returned : line " + lineNum;
      }
      return true;
   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable) {
      curNode.addSuccessor(endNode);
      //store i32 %u9, i32* %_retval_
      //br label %LU9
      Value val = expression.getCFGValue(curNode, curNode.getLLVM(), structTable);
      //System.err.println("5 branching to " + endNode.getLlvmLabel() + " from " + curNode.getLlvmLabel());

      UnconditionalBranch retBranch = new UnconditionalBranch(endNode.getLlvmLabel());


      if(SSA.isSSA) {
         //System.err.println("branching to " + endNode.getLlvmLabel() + " from " + curNode.getLlvmLabel());
         SSA.writeVariable(curNode, "_retval_", val);
         curNode.addInstructionToLLVM(retBranch);

      } else {
         Register retLoc = new Register("_retval_");
         Store store = new Store(this.returnType.getCFGType(), retLoc, val);

         curNode.addInstructionToLLVM(store);
         curNode.addInstructionToLLVM(retBranch);

         Register r1 = RegisterCounter.getNextRegister();
         Instruction loadRet = new Load(r1, returnType.getCFGType(), retLoc);
         Instruction ret = new ReturnValue(this.returnType.getCFGType(), r1);

         if(!endNode.getHasReturn()) {
            endNode.addInstructionToLLVM(loadRet);
            endNode.addInstructionToLLVM(ret);
            endNode.setHasReturn();
         }
      }
      return curNode;
   }
}
