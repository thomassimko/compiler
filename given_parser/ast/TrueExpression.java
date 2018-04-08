package ast;

import java.util.HashMap;

public class TrueExpression
   extends AbstractExpression {
   public TrueExpression(int lineNum) {
      super(lineNum);
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      return new BoolType();
   }
}
