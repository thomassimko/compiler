package ast;

import cfg.Block;
import llvm.ArithmeticBool.ExclusiveOr;
import llvm.ArithmeticBool.Subtract;
import llvm.Instruction;
import llvm.Truncate;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.HashMap;
import java.util.List;

public class UnaryExpression
   extends AbstractExpression
{
   private final Operator operator;
   private final Expression operand;

   private UnaryExpression(int lineNum, Operator operator, Expression operand)
   {
      super(lineNum);
      this.operator = operator;
      this.operand = operand;
   }

   public static UnaryExpression create(int lineNum, String opStr,
      Expression operand)
   {
      if (opStr.equals(NOT_OPERATOR))
      {
         return new UnaryExpression(lineNum, Operator.NOT, operand);
      }
      else if (opStr.equals(MINUS_OPERATOR))
      {
         return new UnaryExpression(lineNum, Operator.MINUS, operand);
      }
      else
      {
         throw new IllegalArgumentException();
      }
   }

   private static final String NOT_OPERATOR = "!";
   private static final String MINUS_OPERATOR = "-";

   public enum Operator
   {
      NOT, MINUS
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      Type operandType = operand.getType(globalTable, structTable, currentFunctionName);
      if (operator == Operator.NOT) {
         assert operandType instanceof BoolType : "Operator is not of Bool type on line " + lineNum;
         return new BoolType();
      } else {
         assert operandType instanceof IntType : "Operator is not of Int type on line " + lineNum;
         return new IntType();
      }
   }

   @Override
   public Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      Value stored = operand.getCFGValue(block, instructionList, structTable);
      Register finalReg = RegisterCounter.getNextRegister();
      if (operator == Operator.NOT) {
         ExclusiveOr xor = new ExclusiveOr(stored, new ValueLiteral("1"), finalReg);
         instructionList.add(xor);
      }
      else {
         Subtract sub = new Subtract(new ValueLiteral("0"), stored, finalReg);
         instructionList.add(sub);
      }
      return finalReg;
   }
}
