package ast;

import cfg.BasicBlock;
import cfg.Block;
import cfg.EndBlock;
import cfg.StartBlock;
import llvm.*;
import llvm.declarations.ParameterDeclaration;
import llvm.value.Register;
import llvm.value.SSA;
import llvm.value.Value;
import llvm.value.ValueLiteral;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Function /*implements Type*/
{
   private final int lineNum;
   private final String name;
   private final Type retType;
   private final List<Declaration> params;
   private final List<Declaration> locals;
   private final Statement body;

   public Function(int lineNum, String name, List<Declaration> params,
      Type retType, List<Declaration> locals, Statement body)
   {
      this.lineNum = lineNum;
      this.name = name;
      this.params = params;
      this.retType = retType;
      this.locals = locals;
      this.body = body;
   }

   public void addToTable(HashMap<String, Type> globalTable) {

      HashMap<String, Type> localTable = new HashMap<String, Type>();
      for(Declaration param: params) {
         param.addToTable(localTable);
      }
      for(Declaration local: locals) {
         local.addToTable(localTable);
      }
      FunctionType fType = new FunctionType(lineNum, name, localTable, params, retType);
      assert !globalTable.containsKey(name) : "Variable with name " + name + " is already defined : line " + lineNum;
      globalTable.put(name, fType);
   }

   public void checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable) {
      boolean doesReturn = body.checkTypes(globalTable, structTable, name);
      if (!(retType instanceof VoidType)) {
         assert doesReturn : "Function " + name + " does not return along all paths";
      }
   }

   public StartBlock getCFG(List<Block> blockList, HashMap<String, HashMap<String, Type>> structTable) {
      StartBlock start = new StartBlock(this.name);
      BasicBlock block = new BasicBlock(this.name + "Block1");
      EndBlock end = new EndBlock(this.name);

      start.addSuccessor(block);


      blockList.add(start);
      blockList.add(block);

      List<ParameterDeclaration> paramInstr = new ArrayList<ParameterDeclaration>();
      for(Declaration decl: params) {
         paramInstr.add(decl.getParamCFGValue());
      }
      start.addInstructionToLLVM(new FunctionDefine(this.name, paramInstr, this.retType.getCFGType()));

      if (!(this.retType instanceof VoidType))
         if(!SSA.isSSA) {
//            SSA.writeVariable(start, "_retval_", new ValueLiteral("void"));
//         }
//         else {
            block.addInstructionToLLVM(new Allocation(this.retType.getCFGType(), new Register("_retval_")));
         }
      for(Declaration decl: params) {
         if (SSA.isSSA) {
            Register reg = new Register(decl.getName());
            SSA.writeVariable(start, decl.getName(), reg);
         }
         else {
            block.addInstructionToLLVM(decl.getParamCFGValue().getAllocation());
            block.addInstructionToLLVM(decl.getParamCFGValue().getStore());
         }
      }

      for(Declaration decl: locals) {
         if (SSA.isSSA) {
            Register reg = new Register(decl.getName());
            SSA.writeVariable(start, "%" + decl.getName(), reg);
            //Register reg = new Register(decl.getParamCFGValue().toLLVM());
            //SSA.writeVariable(start, decl.getParamCFGValue().getName(), reg);
         }
         else {
            block.addInstructionToLLVM(decl.getLocalCFGValue());
         }
      }


      Block lastNode = body.getCFG(block, end, blockList, structTable);
      if(!lastNode.hasEndBlockSuccessor() && lastNode != end) {
         lastNode.addSuccessor(end);
         //System.err.println("4 branching to " + end.getLlvmLabel() + " from " + lastNode.getLlvmLabel());

         lastNode.addInstructionToLLVM(new UnconditionalBranch(end.getLlvmLabel()));
      }

      if (SSA.isSSA && !(retType instanceof VoidType)) {
         Value retVal = SSA.readVariable(end, "_retval_", retType);
         ReturnValue ret = new ReturnValue(retType.getCFGType(), retVal);
         end.addInstructionToLLVM(ret);
      }
      else if(!end.getHasReturn()) {
         end.addInstructionToLLVM(new ReturnVoid());
      }
      end.setHasReturn();

      blockList.add(end);

      end.addInstructionToLLVM(new FunctionEnd(name));
      SSA.sealBlock(end);

      return start;
   }
}
