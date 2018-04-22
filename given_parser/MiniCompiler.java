import ast.Type;
import cfg.Block;
import cfg.EndBlock;
import cfg.FakeBlock;
import cfg.StartBlock;
import llvm.FunctionDefine;
import llvm.FunctionEnd;
import llvm.Instruction;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

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

         Block[] cfg = program.getCFG(blockList, structTable);

         printCFG(blockList);

         if (stack) {
            printStackLLVM(program, blockList);
         }
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
            if(args[i].equals("-stack")) {
               stack = true;
            }
            else {
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

   private static void printStackLLVM(ast.Program program, List<Block> blockList) {
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

            for(Instruction instruction: block.getLLVM()) {
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
}
