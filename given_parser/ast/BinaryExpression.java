package ast;

import cfg.Block;
import llvm.ArithmeticBool.*;
import llvm.Comparison;
import llvm.Instruction;
import llvm.ZExtend;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;

import java.util.HashMap;
import java.util.List;

public class BinaryExpression
   extends AbstractExpression
{
   private final Operator operator;
   private final Expression left;
   private final Expression right;
   private Type leftType;

   private BinaryExpression(int lineNum, Operator operator,
      Expression left, Expression right)
   {
      super(lineNum);
      this.operator = operator;
      this.left = left;
      this.right = right;
   }

   public static BinaryExpression create(int lineNum, String opStr,
      Expression left, Expression right)
   {
      switch (opStr)
      {
         case TIMES_OPERATOR:
            return new BinaryExpression(lineNum, Operator.TIMES, left, right);
         case DIVIDE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.DIVIDE, left, right);
         case PLUS_OPERATOR:
            return new BinaryExpression(lineNum, Operator.PLUS, left, right);
         case MINUS_OPERATOR:
            return new BinaryExpression(lineNum, Operator.MINUS, left, right);
         case LT_OPERATOR:
            return new BinaryExpression(lineNum, Operator.LT, left, right);
         case LE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.LE, left, right);
         case GT_OPERATOR:
            return new BinaryExpression(lineNum, Operator.GT, left, right);
         case GE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.GE, left, right);
         case EQ_OPERATOR:
            return new BinaryExpression(lineNum, Operator.EQ, left, right);
         case NE_OPERATOR:
            return new BinaryExpression(lineNum, Operator.NE, left, right);
         case AND_OPERATOR:
            return new BinaryExpression(lineNum, Operator.AND, left, right);
         case OR_OPERATOR:
            return new BinaryExpression(lineNum, Operator.OR, left, right);
         default:
            throw new IllegalArgumentException();
      }
   }

   private static final String TIMES_OPERATOR = "*";
   private static final String DIVIDE_OPERATOR = "/";
   private static final String PLUS_OPERATOR = "+";
   private static final String MINUS_OPERATOR = "-";
   private static final String LT_OPERATOR = "<";
   private static final String LE_OPERATOR = "<=";
   private static final String GT_OPERATOR = ">";
   private static final String GE_OPERATOR = ">=";
   private static final String EQ_OPERATOR = "==";
   private static final String NE_OPERATOR = "!=";
   private static final String AND_OPERATOR = "&&";
   private static final String OR_OPERATOR = "||";

   public enum Operator
   {
      TIMES, DIVIDE, PLUS, MINUS, LT, GT, LE, GE, EQ, NE, AND, OR
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      Type leftType = left.getType(globalTable, structTable, currentFunctionName);
      Type rightType = right.getType(globalTable, structTable, currentFunctionName);

      this.leftType = leftType;

      if (operator == Operator.AND || operator == Operator.OR) {
         assert leftType instanceof BoolType : "Left hand operator does not match type Bool on line " + this.lineNum;
         assert rightType instanceof BoolType : "Right hand operator does not match type Bool on line " + this.lineNum;
         return leftType;
      }
      else if (operator == Operator.MINUS || operator == Operator.PLUS || operator == Operator.DIVIDE || operator == Operator.TIMES) {
         assert leftType instanceof IntType : "Left hand operator does not match type Int on line " + this.lineNum;
         assert rightType instanceof IntType : "Right hand operator does not match type Int on line " + this.lineNum;
         return leftType;
      }
      else {
         if (leftType instanceof StructType || leftType instanceof VoidType) {
            assert rightType instanceof StructType || rightType instanceof VoidType : "Right hand operator does not match type Struct or Void on line " + this.lineNum;
            if(rightType instanceof StructType) {
               assert ((StructType) leftType).getName().equals(((StructType) rightType).getName()) : "Struct types do not match on line " + lineNum;
            }
         }
         else {
            assert leftType.getClass() == rightType.getClass() : "Right hand operator does not match left type on line " + this.lineNum;
         }
//         if(leftType instanceof IntType) {
//            assert rightType instanceof IntType : "Right hand operator does not match type Int on line " + this.lineNum;
//         }
//         else if(leftType instanceof BoolType) {
//            assert rightType instanceof BoolType : "Right hand operator does not match type Bool on line " + this.lineNum;
//         }
//         else {
//            //TODO: Doesnt compare actual structure types
//            if (leftType instanceof StructType)
//               assert rightType instanceof StructType || rightType instanceof VoidType : "Right hand operator does not match type Struct or Void on line " + this.lineNum;
//            else {
//               assert leftType instanceof VoidType : "Invalid left hand expression on line " + this.lineNum;
//            }
//         }
         return new BoolType();
      }
   }

   @Override
   public Value getCFGValue(Block block, List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      Value leftCFGValue = left.getCFGValue(block, instructionList, structTable);
      Value rightCFGValue = right.getCFGValue(block, instructionList, structTable);

      Register storeRegister = RegisterCounter.getNextRegister();
      Register storedTempResult;
      Instruction zExt;

      Instruction instruction = null;
      switch (operator) {
         case TIMES:
            instruction = new Multiply(leftCFGValue, rightCFGValue, storeRegister);
            instructionList.add(instruction);
            break;
         case DIVIDE:
            instruction = new Divide(leftCFGValue, rightCFGValue, storeRegister);
            instructionList.add(instruction);
            break;
         case AND:
            //storedTempResult = RegisterCounter.getNextRegister();
            instruction = new And(leftCFGValue, rightCFGValue, storeRegister);
            //zExt = new ZExtend(storeRegister, storedTempResult);
            instructionList.add(instruction);
            //instructionList.add(zExt);
            //return storedTempResult;
            return storeRegister;
         case OR:
            //storedTempResult = RegisterCounter.getNextRegister();
            instruction = new Or(leftCFGValue, rightCFGValue, storeRegister);
            //zExt = new ZExtend(storeRegister, storedTempResult);
            instructionList.add(instruction);
            //instructionList.add(zExt);
            //return storedTempResult;
            return storeRegister;
         case PLUS:
            instruction = new Add(leftCFGValue, rightCFGValue, storeRegister);
            instructionList.add(instruction);
            break;
         case MINUS:
            instruction = new Subtract(leftCFGValue, rightCFGValue, storeRegister);
            instructionList.add(instruction);
            break;
         default:
            String compOp = null;
            switch (operator) {
               case EQ:
                  compOp = "eq";
                  break;
               case NE:
                  compOp = "ne";
                  break;
               case GT:
                  compOp = "sgt";
                  break;
               case GE:
                  compOp = "sge";
                  break;
               case LT:
                  compOp = "slt";
                  break;
               case LE:
                  compOp = "sle";
                  break;
               default:
                  throw new Error("Unreachable case reached");
            }
            storedTempResult = RegisterCounter.getNextRegister();
            instruction = new Comparison(leftCFGValue, rightCFGValue, compOp, storeRegister, leftType);
            zExt = new ZExtend(storeRegister, storedTempResult);
            instructionList.add(instruction);
            instructionList.add(zExt);

            return storedTempResult;
      }

      return storeRegister;
   }
}
