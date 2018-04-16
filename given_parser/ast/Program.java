package ast;

import cfg.Block;
import cfg.StartBlock;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;


public class Program
{
   private final List<TypeDeclaration> types;
   private final List<Declaration> decls;
   private final List<Function> funcs;

   public Program(List<TypeDeclaration> types, List<Declaration> decls, List<Function> funcs)
   {
      this.types = types;
      this.decls = decls;
      this.funcs = funcs;
   }

   private void buildTables(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable) {
      for(Declaration decl: decls) {
         decl.addToTable(globalTable);
      }
      for(TypeDeclaration type: types) {
         type.addToTable(structTable);
      }
      for(Function func: funcs) {
         func.addToTable(globalTable);
      }
   }

   public void checkTypes(HashMap<String, Type> globalTable, HashMap<String, HashMap<String, Type>> structTable) {
      this.buildTables(globalTable, structTable);
      for(Function func: funcs) {
         func.checkTypes(globalTable, structTable);
      }
      assert globalTable.containsKey("main") : "No main function defined.";
      assert globalTable.get("main") instanceof FunctionType: "main is not of type function";
      FunctionType mainFunc = (FunctionType) globalTable.get("main");
      assert mainFunc.getReturnType() instanceof IntType : "main does not return type Int";
      assert mainFunc.getParamTypes().size() == 0 : "main cannot take parameters";
   }

   public StartBlock[] getCFG(List<Block> blockList) {
      return funcs.stream().map(func -> func.getCFG(blockList)).toArray(StartBlock[]::new);
   }

}
