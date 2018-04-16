package ast;

import cfg.Block;

import java.util.List;

public abstract class AbstractStatement
   implements Statement
{
   public final int lineNum;

   public AbstractStatement(int lineNum)
   {
      this.lineNum = lineNum;
   }

   public Block getCFG(Block curNode, Block endNode, List<Block> blockList) {
      return curNode;
   }
}
