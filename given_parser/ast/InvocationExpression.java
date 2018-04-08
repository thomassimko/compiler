package ast;

import java.util.HashMap;
import java.util.List;

public class InvocationExpression extends AbstractExpression {
   private final String name;
   private final List<Expression> arguments;

   public InvocationExpression(int lineNum, String name,
                               List<Expression> arguments) {
      super(lineNum);
      this.name = name;
      this.arguments = arguments;
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      assert globalTable.containsKey(name) : "No function defined with name " + name + " : line " + lineNum;
      assert globalTable.get(name) instanceof FunctionType: name + " is not a function : line " + lineNum;
      FunctionType fType = (FunctionType) globalTable.get(name);
      List<Type> parameterTypes = fType.getParamTypes();
      assert arguments.size() == parameterTypes.size() : "Number of arguments does not match desired number of parameters : line " + lineNum;
      for (int i = 0; i< parameterTypes.size(); i++) {
         Type argType = arguments.get(i).getType(globalTable, structTable, currentFunctionName);
         assert argType.getClass() == parameterTypes.get(i).getClass()
                 || (argType instanceof VoidType && parameterTypes.get(i) instanceof StructType)
                 : "Parameter and argument types don't match : line " + lineNum;
      }
      return fType.getReturnType();
   }

   public String getName() {
      return this.name;
   }
}
