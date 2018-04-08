package ast;

import java.util.HashMap;

public class AssignmentStatement extends AbstractStatement
{
   private final Lvalue target;
   private final Expression source;

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

      return false;
   }

}
