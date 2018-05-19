package ast;

import cfg.Block;
import llvm.Instruction;
import llvm.InvocationCall;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class InvocationExpression extends AbstractExpression {
   private final String name;
   private final List<Expression> arguments;
   private FunctionType retType;
   private boolean isStatement;

   public InvocationExpression(int lineNum, String name,
                               List<Expression> arguments) {
      super(lineNum);
      this.name = name;
      this.arguments = arguments;
      this.isStatement = false;
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
      this.retType = fType;
      return fType.getReturnType();
   }

   public String getName() {
      return this.name;
   }

   @Override
   public Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {

      InvocationCall call;
      Value[] argVals = this.arguments.stream().map(arg -> arg.getCFGValue(block, instructionList, structTable)).toArray(Value[]::new);
      List<Type> paramTypes = this.retType.getParamTypes();
      String[] argTypes = paramTypes.stream().map(param -> param.getCFGType()).toArray(String[]::new);

      if (!isStatement) {
         Register r1 = RegisterCounter.getNextRegister();
         call = new InvocationCall(r1, this.retType.getCFGType(), this.name, argVals, argTypes);
         instructionList.add(call);
         return r1;
      }
      else {
         call = new InvocationCall(this.retType.getCFGType(), this.name, argVals, argTypes);
         instructionList.add(call);
         return new ValueLiteral("void");
      }
   }

   public void setIsStatement() {
      this.isStatement = true;
   }
}
