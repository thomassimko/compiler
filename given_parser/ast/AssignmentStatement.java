package ast;

import cfg.Block;
import llvm.Read;
import llvm.Store;
import llvm.value.SSA;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class AssignmentStatement extends AbstractStatement
{
   private final Lvalue target;
   private final Expression source;
   private Type type;

   public AssignmentStatement(int lineNum, Lvalue target, Expression source)
   {
      super(lineNum);
      this.target = target;
      this.source = source;
   }

   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      Type leftType = target.getType(globalTable, structTable, currentFunctionName);
      Type sourceType = source.getType(globalTable, structTable, currentFunctionName);

      assert leftType.getClass() == sourceType.getClass()
              || (leftType instanceof StructType && sourceType instanceof VoidType)
              : "Cannot assign type " + sourceType.getClass() + " to " + leftType.getClass() + " : line " + lineNum;

      if(leftType instanceof StructType && sourceType instanceof StructType) {
         assert ((StructType) leftType).getName().equals(((StructType) sourceType).getName()) : "Struct types do not match on line " + lineNum;
      }

      this.type = leftType;

      return false;
   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable) {
      Value val = source.getCFGValue(curNode, curNode.getLLVM(), structTable);
      Value lVal = target.getCFGValue(curNode, curNode.getLLVM(), structTable);

//      if (source instanceof ReadExpression) {
//         curNode.addInstructionToLLVM(new Read(lVal));
//      }
//      else {
         if (SSA.isSSA && target instanceof LvalueId && ((LvalueId) target).isLocal()) {
            SSA.writeVariable(curNode, lVal.toLLVM(), val);
            //System.out.println(lVal.toLLVM() + " --- " + val.toLLVM());
         }
         else {
//            System.out.println("lval..." + lVal.toLLVM());
            curNode.addInstructionToLLVM(new Store(this.type.getCFGType(), lVal, val));
         }
      //}
      return curNode;
   }
}
