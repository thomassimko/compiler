package ast;

import java.util.HashMap;

public class ReturnEmptyStatement
   extends AbstractStatement
{
   public ReturnEmptyStatement(int lineNum)
   {
      super(lineNum);
   }

   @Override
   public boolean checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert currentFunctionName != null : "Cannot call return when not inside a function : line " + lineNum;
      assert globalTable.get(currentFunctionName) instanceof FunctionType : "Variable is not of type function : line " + lineNum;
      assert ((FunctionType) globalTable.get(currentFunctionName)).getReturnType() instanceof VoidType
              : "Return type does not match value returned : line " + lineNum;
      return true;
   }
}
