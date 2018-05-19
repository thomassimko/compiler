package ast;

import cfg.Block;
import llvm.Instruction;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public abstract class AbstractExpression
   implements Expression
{
   public final int lineNum;

   public AbstractExpression(int lineNum)
   {
      this.lineNum = lineNum;
   }

   @Override
   public Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      return null;
   }
}
