import ast.Type;
import cfg.Block;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
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

         Block[] cfg = program.getCFG(blockList);

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
   }

   private static String _inputFile = null;

   private static void parseParameters(String [] args)
   {
      for (int i = 0; i < args.length; i++)
      {
         if (args[i].charAt(0) == '-')
         {
            System.err.println("unexpected option: " + args[i]);
            System.exit(1);
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
}
