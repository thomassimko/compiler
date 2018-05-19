package ast;

import cfg.Block;
import llvm.BitCast;
import llvm.InvocationCall;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class DeleteStatement extends AbstractStatement
{
   private final Expression expression;
   private StructType type;

   public DeleteStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      Type expType = expression.getType(globalTable, structTable, currentFunctionName);
      assert expType instanceof StructType : "Statement is not of type Struct : line " + lineNum;
      this.type = (StructType) expType;
      return false;
   }

   @Override
   public Block getCFG(Block curNode, Block endNode, List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable) {
      //%u82 = load %struct.foo** %math1
      //%u83 = bitcast %struct.foo* %u82 to i8*
      //call void @free(i8* %u83)
      Register r1 = RegisterCounter.getNextRegister();
      //Register r2 = RegisterCounter.getNextRegister();
      Value val = expression.getCFGValue(curNode, curNode.getLLVM(), structTable);
      //Load load = new Load(r1, this.type.getCFGType(), val);
      BitCast bitcast = new BitCast(r1, val, this.type.getCFGType(), "i8*");
      Value[] valArr = {r1};
      String[] typeArr = {"i8*"};
      InvocationCall call = new InvocationCall("void", "free", valArr, typeArr);

      //curNode.addInstructionToLLVM(load);
      curNode.addInstructionToLLVM(bitcast);
      curNode.addInstructionToLLVM(call);

      return super.getCFG(curNode, endNode, blockList, structTable);
   }
}
