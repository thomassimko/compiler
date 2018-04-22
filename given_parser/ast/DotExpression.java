package ast;

import llvm.GetElementPointer;
import llvm.Instruction;
import llvm.Load;
import llvm.value.Register;
import llvm.value.RegisterCounter;
import llvm.value.Value;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

public class DotExpression
   extends AbstractExpression
{
   private final Expression left;
   private final String id;
   private StructType leftType;

   public DotExpression(int lineNum, Expression left, String id)
   {
      super(lineNum);
      this.left = left;
      this.id = id;
   }

   public Type getType(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable, String currentFunctionName) {
      Type leftType = left.getType(globalTable, structTable, currentFunctionName);
      assert leftType instanceof StructType : "Left hand operator does not match type Struct on line " + this.lineNum;
      StructType structLeft = (StructType) leftType;
      this.leftType = structLeft;
      assert structTable.get(structLeft.getName()).containsKey(id) : "Id does not exist in type Struct " + id + " on line " + this.lineNum;
      return structTable.get(structLeft.getName()).get(id);
   }

   @Override
   public Value getCFGValue(List<Instruction> instructionList, HashMap<String, HashMap<String, Type>> structTable) {
      Value leftReg = left.getCFGValue(instructionList, structTable);
      Register r1 = RegisterCounter.getNextRegister();
      Register r2 = RegisterCounter.getNextRegister();

      HashMap<String, Type> structure = structTable.get(leftType.getName());
      List<String> sortedList = new ArrayList<>(structure.keySet());
      Collections.sort(sortedList);
      int index = sortedList.indexOf(id);

      GetElementPointer getElem = new GetElementPointer(r1, leftType.getCFGType(), leftReg, index);
      Load loadStruct = new Load(r2, structure.get(id).getCFGType(), r1);

      instructionList.add(getElem);
      instructionList.add(loadStruct);

      return r2;
   }
}

