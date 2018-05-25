import arm.*;
import arm.ArmValue.ArmRegister;
import ast.Type;
import cfg.Block;
import cfg.EndBlock;
import cfg.FakeBlock;
import cfg.StartBlock;
import llvm.FunctionDefine;
import llvm.FunctionEnd;
import llvm.Instruction;
import llvm.Phi;
import llvm.declarations.ParameterDeclaration;
import llvm.lattice.LatticeBottom;
import llvm.lattice.LatticeInteger;
import llvm.lattice.LatticeTop;
import llvm.lattice.LatticeValue;
import llvm.value.Register;
import llvm.value.SSA;
import llvm.value.Value;
import llvm.value.ValueToArm;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

public class MiniCompiler
{
   public static HashMap<String, Type> globalTable = new HashMap<String, Type>();
   public static HashMap<String, HashMap<String, Type>> structTable = new HashMap<String, HashMap<String, Type>>();


   public static void main(String[] args)
   {
      parseParameters(args);

      CommonTokenStream tokens = new CommonTokenStream(createLexer());
      MiniParser parser = new MiniParser(tokens);
      ParseTree tree = parser.program();

      if (parser.getNumberOfSyntaxErrors() == 0) {
         MiniToAstProgramVisitor programVisitor =
                 new MiniToAstProgramVisitor();
         ast.Program program = programVisitor.visit(tree);

         program.checkTypes(globalTable, structTable);

         List<Block> blockList = new ArrayList<Block>();

         StartBlock[] cfg = program.getCFG(blockList, structTable);

         constantPropagation(blockList, cfg);

         convertToArm(blockList, program);

         printCFG(blockList);

         printLLVM(program, blockList);
      }
   }

   private static String _inputFile = null;
   private static boolean stack = false;

   private static void parseParameters(String [] args)
   {
      for (int i = 0; i < args.length; i++)
      {
         if (args[i].charAt(0) == '-')
         {
            switch(args[i]) {
               case "-stack":
                  stack = true;
                  SSA.isSSA = false;
                  break;
               default:
                  System.err.println("unexpected option: " + args[i]);
                  System.exit(1);
            }
         }
         else if (_inputFile != null)
         {
            System.err.println("too many files specified");
            System.exit(1);
         }
         else
         {
            _inputFile = args[i];
         }
      }
   }

   private static void error(String msg)
   {
      System.err.println(msg);
      System.exit(1);
   }

   private static MiniLexer createLexer()
   {
      try
      {
         CharStream input;
         if (_inputFile == null)
         {
            input = CharStreams.fromStream(System.in);
         }
         else
         {
            input = CharStreams.fromFileName(_inputFile);
         }
         return new MiniLexer(input);
      }
      catch (java.io.IOException e)
      {
         System.err.println("file not found: " + _inputFile);
         System.exit(1);
         return null;
      }
   }

   private static void printCFG(List<Block> blockList) {
      try {
         FileWriter writer = new FileWriter(new File("../cfg.gv"));
         writer.write("digraph G {\n");
         writer.write("size =\"8.5,11\";");

         for (Block block : blockList) {
            writer.write(block.getGraphVisFormat());
         }
         writer.write("}");

         writer.flush();
         writer.close();
      } catch (IOException ex) {
         System.err.println(ex);
      }
   }

   private static void printLLVM(ast.Program program, List<Block> blockList) {
      try {
         String outputPath = "../output.ll";
         FileWriter writer = new FileWriter(outputPath);
         writer.write("target triple=\"i686\"\n\n");

         writer.write(String.join("\n",
                 Arrays.stream(program.getDeclarationFunctions()).map(instruction -> instruction.toLLVM()).toArray(String[]::new)));

         writer.write("\n\n");
         for(Block block:blockList) {

            if (!(block instanceof StartBlock) && !(block instanceof FakeBlock))
               writer.write(block.getLlvmLabel() + ":\n");

            for(Instruction instruction: block.getFinalLLVM()) {
               if(!(instruction instanceof FunctionDefine) && !(instruction instanceof FunctionEnd)) {
                  writer.write('\t');
               }
               writer.write(instruction.toLLVM() + "\n");
            }
         }

         writer.write("declare i8* @malloc(i32)\n" +
                 "declare void @free(i8*)\n" +
                 "declare i32 @printf(i8*, ...)\n" +
                 "declare i32 @scanf(i8*, ...)\n" +
                 "@.println = private unnamed_addr constant [5 x i8] c\"%ld\\0A\\00\", align 1\n" +
                 "@.print = private unnamed_addr constant [5 x i8] c\"%ld \\00\", align 1\n" +
                 "@.read = private unnamed_addr constant [4 x i8] c\"%ld\\00\", align 1\n" +
                 "@.read_scratch = common global i32 0, align 8");
         writer.close();
      } catch (IOException ex) {
         System.err.println(ex);
      }

   }

   private static void printArm(ast.Program program, List<ArmInstruction> armInstructions) {

      try {
         String outputPath = "../output.s";
         FileWriter writer = new FileWriter(outputPath);

         writer.write("\t.arch armv7-a\n");

         List<ArmInstruction> globalDecs = new ArrayList<>();

         Arrays.stream(program.getDeclarationFunctions()).forEach(instruction -> instruction.toArm(globalDecs, null));
         for(ArmInstruction instruction : globalDecs) {
            writer.write(instruction.toArm() + "\n");
         }

         writer.write("\n\n.text\n");

         for(ArmInstruction instruction : armInstructions) {
            if (!(instruction instanceof ArmFunction) && !(instruction instanceof ArmLabel))
               writer.write('\t');
            writer.write(instruction.toArm() + "\n");

            if(instruction instanceof ArmFunctionEnd) {
               writer.write("\n\n");
            }
         }




         writer.write("\t.section\t.rodata\n" +
                 "\t.align\t2\n.PRINTLN_FMT:\n" +
                 "\t.asciz\t\"%ld\\n\"\n" +
                 "\t.align\t2\n" +
                 ".PRINT_FMT:\n" +
                 "\t.asciz\t\"%ld \"\n" +
                 "\t.align\t2\n" +
                 ".READ_FMT:\n" +
                 "\t.asciz\t\"%ld\"\n" +
                 "\t.comm\t.read_scratch,4,4\n" +
                 "\t.global\t__aeabi_idiv");
         writer.close();
      } catch (IOException ex) {
         System.err.println(ex);
      }
   }

   private static void printInterferenceGraph(Set<ArmRegister> nodes) {
      try {
         FileWriter writer = new FileWriter(new File("../interference.gv"));
         writer.write("graph G {\n");
         writer.write("size =\"8.5,11\";\n");
         writer.write("graph [ dpi = 500 ];\n");

         for (ArmRegister node : nodes) {
            for(ArmRegister interferenceNode : node.getInterferences()) {
               writer.write(node.toArm().replace('%', 'v') +
                       " -- " + interferenceNode.toArm().replace('%', 'v') + ";\n");
            }
         }
         writer.write("}");

         writer.flush();
         writer.close();
      } catch (IOException ex) {
         System.err.println(ex);
      }
   }

   private static void convertToArm(List<Block> blockList, ast.Program program) {
      List<ArmInstruction> armInstructions = new ArrayList<>();
      HashMap<String, Integer> armOffsets = new HashMap<>();
      ArmStackAllocation stackAlloc = new ArmStackAllocation(false, 0);

      for(Block block:blockList) {
         List<ArmInstruction> blockArmInstructions = new ArrayList<>();
         if(block instanceof StartBlock) {
            stackAlloc = new ArmStackAllocation(false, 0);
            armOffsets = new HashMap<>();
         }
         else if(block instanceof EndBlock) {
            stackAlloc.setStackSize(armOffsets.size());
         }
         if (!(block instanceof StartBlock) && !(block instanceof FakeBlock))
            blockArmInstructions.add(new ArmLabel(block.getLlvmLabel()));

         for(Instruction instruction: block.getFinalLLVM()) {

            if (instruction instanceof FunctionEnd) {
               blockArmInstructions.add(new ArmStackAllocation(true, armOffsets.size()));
            }

            instruction.toArm(blockArmInstructions, armOffsets);

            if(instruction instanceof FunctionDefine) {
               blockArmInstructions.add(stackAlloc);
            }
         }

         block.setArmCode(blockArmInstructions);

      }
      for (Block block : blockList) {
         for(Instruction instruction: block.getFinalLLVM()) {
            if(instruction instanceof Phi) {
               Phi phi = (Phi) instruction;
               List<Value> operands = phi.getOperands();
               List<Block> operandBlock = phi.getOperandFrom();
               for (int i = 0; i < operands.size(); i++) {
                  List<ArmInstruction> succArm = /*new ArrayList<>();//*/operandBlock.get(i).getArmCode();
                  List<ArmInstruction> phiInst = new ArrayList<>();
                  //System.out.println("adding move from " + operands.get(i).toArmRegister(succArm).toArm() + " to " + phi.getPhiValue().toArm() + " in block " + operandBlock.get(i).getLlvmLabel());
                  Move phiMove = new Move(MoveType.DEFAULT, phi.getPhiValue(), operands.get(i).toArmRegister(phiInst), 0, false);
                  //succArm.add(phiMove);
                  phiInst.add(phiMove);
                  operandBlock.get(i).addPhiMove(phiInst);
                  //succArm.add(phiMove);
                  //operandBlock.get(i).setArmCode(succArm);
               }
            }
         }
      }

      for (Block block : blockList) {
         armInstructions.addAll(block.getArmCode());
      }
      for (Block block : blockList) {
         block.setGenKillSets();
      }
      for (Block block : blockList) {
         block.setLiveOut();
      }

      boolean changed = true;
      while(changed) {
         changed = false;
         for (Block block : blockList) {
            if (block.setLiveOut()) {
               changed = true;
            }
         }
      }


      Set<ArmRegister> interferenceNodeSet = new HashSet<>();
      for(Block block: blockList) {
         block.buildInterferenceGraph(interferenceNodeSet);
      }

      printInterferenceGraph(interferenceNodeSet);

      Map<String, String> colorMaps = GraphColorer.allocateRegisters(interferenceNodeSet);

      for(ArmInstruction instruction: armInstructions) {
         instruction.replaceRegisters(colorMaps);
      }
      printArm(program, armInstructions);

   }

   private static void constantPropagation(List<Block> allBlocks, StartBlock[] cfg) {
      HashMap<Register, LatticeValue> lattice = new HashMap<>();
      List<Register> workList = new ArrayList<>();
      for (Block block : allBlocks) {
         //initialize registers
         if (block instanceof StartBlock) {
            StartBlock start = (StartBlock) block;
            lattice = start.getLattice();
            workList = start.getWorkingSet();
            for (ParameterDeclaration param : start.getParams()) {
               Register paramReg = param.getUsedRegisters()[0];
               workList.add(paramReg);
               lattice.put(paramReg, new LatticeBottom());
            }
         }
         for (Register curReg : block.getRegisters()) {
            //System.out.println("added " + curReg.toLLVM() + " as top");
            lattice.put(curReg, new LatticeTop());
         }
//         System.out.println(block.getLlvmLabel());
//         System.out.println(String.join(", ", lattice.keySet().stream().map(register -> register.toLLVM()).toArray(String[]::new)));
//         System.out.println();
      }

      for(StartBlock start:cfg) {

         lattice = start.getLattice();
//         System.out.println(start.getLlvmLabel());
//         System.out.println();
         workList = start.getWorkingSet();

         //update lattice values
         for(Register curReg: lattice.keySet()) {
//            System.out.print(curReg.toLLVM() + " - ");
//            System.out.println(curReg.getDef());
            LatticeValue value;
            try {
               value = curReg.getDef().getLatticeValue(lattice);
               //System.out.println(curReg.getDef().toLLVM());
            } catch (NullPointerException e) {
               //System.out.println(e);
               value = new LatticeBottom();
               //System.err.println("value not found for " + curReg.toLLVM());
            }
            if(!(value instanceof LatticeTop)) {
               //System.out.println("Adding " + curReg.toLLVM() + " to worklist");
               workList.add(curReg);
            }
//            System.out.print("saving " + curReg.toLLVM());
//            System.out.println(" as " + value);
//            System.out.println();
            lattice.put(curReg, value);
         }



         //go through the working list
         while(!workList.isEmpty()) {
            Register curReg = workList.get(0);
            workList.remove(curReg);
            for(Instruction inst: curReg.getUses()) {
               Register savedReg = inst.getTarget();
               if(savedReg != null) {
                  LatticeValue tempValue = savedReg.getLatticeValue(lattice);

                  //System.out.println(String.join(", ", lattice.keySet().stream().map(register -> register.toLLVM()).toArray(String[]::new)));
                  //System.out.println("save reg " + savedReg.toLLVM());
                  //System.out.println(tempValue);
                  //System.out.println();
                  //if it is not already at bottom
                  if (!(tempValue instanceof LatticeBottom)) {
                     LatticeValue newVal = inst.getLatticeValue(lattice);
                     if(newVal != null) {
//                        System.out.println(newVal);
//                        System.out.println(tempValue);
//                        System.out.println(inst.toLLVM());
//                        System.out.println();
                        lattice.put(savedReg, newVal);
                        if ((tempValue instanceof LatticeInteger) && (newVal instanceof LatticeInteger) && ((LatticeInteger) newVal).getValue() != ((LatticeInteger) tempValue).getValue()) {
                           workList.add(savedReg);
                           //System.out.println("adding " + savedReg.toLLVM() + " to working");
                        } else if (tempValue == null || tempValue.getClass() != newVal.getClass()) {
                           workList.add(savedReg);
                        }
                     }
                  }
               }
               else {
                  //System.err.println("target not found for inst : " + inst.toLLVM());
               }
            }
         }

         for(Register curReg: lattice.keySet()) {
            LatticeValue value = lattice.get(curReg);
            if(value instanceof LatticeInteger) {
               LatticeInteger latInt = (LatticeInteger) value;
               for(Instruction inst:curReg.getUses()) {
                  inst.replaceRegisterWithLattice(lattice);
               }
            }
         }

         //System.out.println(lattice.values());


      }

      for (Block block : allBlocks) {
         //initialize registers
         if (block instanceof StartBlock) {
            StartBlock start = (StartBlock) block;
            lattice = start.getLattice();
         }
         List<Instruction> instructions = block.getFinalLLVM();
         List<Instruction> newInstructions = new ArrayList<>();
         for(Instruction instruction:instructions) {
            instruction.replaceRegisterWithLattice(lattice);
            if(!(lattice.get(instruction.getTarget()) instanceof LatticeInteger)) {
               newInstructions.add(instruction);
            }
         }
      }
   }
}
