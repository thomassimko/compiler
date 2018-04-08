package ast;

import java.util.HashMap;

public class InvocationStatement extends AbstractStatement
{
   private final Expression expression;

   public InvocationStatement(int lineNum, Expression expression)
   {
      super(lineNum);
      this.expression = expression;
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert expression instanceof InvocationExpression : "Expressions is not an invocation expression : line " + lineNum;
      expression.getType(globalTable, structTable, currentFunctionName);
      return false;
   }
}
