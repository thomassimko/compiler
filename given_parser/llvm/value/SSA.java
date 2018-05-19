package llvm.value;

import ast.Type;
import cfg.Block;
import llvm.Instruction;
import llvm.Phi;

import java.util.ArrayList;
import java.util.List;

public class SSA {

    public static boolean isSSA = true;

    public static void writeVariable(Block block, String varName, Value value) {
        if (!varName.contains("%")) {
            varName = "%" + varName;
        }
        //System.err.print("writing " + varName);
        //System.err.print(" : " + value.toLLVM());
        //System.err.println(" into block " + block.getLlvmLabel());
        block.getCurrentDef().put(varName, value);
    }

    public static Value readVariable(Block block, String varName, Type type) {
        if (!varName.contains("%")) {
            varName = "%" + varName;
        }
        if(block.getCurrentDef().containsKey(varName)) {
            return block.getCurrentDef().get(varName);
        }
        else {
            return readVariableFromPredecessors(block, varName, type);
        }
    }

    private static Value readVariableFromPredecessors(Block block, String varName, Type type) {

        //System.err.println("checking pred : " + varName + " in block " + block.getLlvmLabel());
        Value value = null;

        if(!block.isSealed()) {
            Phi phi = new Phi(block, varName, type);
            value = phi.getTarget();
            //System.err.println("phi -- " + varName);
            //System.err.println(varName + " : " + value.toLLVM());

            block.addIncompletePhi(phi);
        }
        else if(block.getPredecessors().size() == 0) {
            value = null;
            //System.err.println("no pred: " + varName);
        }
        else if(block.getPredecessors().size() == 1) {
            //System.err.println(block.getLlvmLabel() + " ::: " + varName);
            value = readVariable(block.getPredecessors().get(0), varName, type);
        }
        else {
            Phi phi = new Phi(block, varName, type);
            value = phi.getTarget();
            //System.err.println(varName + " : " + value.toLLVM());
            writeVariable(block, varName, value);
            addPhiOperands(varName, phi);
            block.addCompletedPhi(phi);
        }
        //System.out.println(varName);
        writeVariable(block, varName, value);
        return value;
    }

    private static void addPhiOperands(String varName, Phi phi) {

        //System.out.println("add op");

        for (Block pred : phi.getBlock().getPredecessors()) {
//            System.out.println(phi.getBlock().getLabel() + " : " + pred.getLabel() + " = " + phi.getBlock().getPredecessors().size());
            //System.out.println(varName + " : " + readVariable(pred, varName));
            phi.appendOperand(readVariable(pred, varName, phi.getType()), pred);
        }
    }

    public static void sealBlock(Block block) {
        block.sealBlock();
        for(Phi curPhi: block.incompletePhis()) {
            addPhiOperands(curPhi.getName(), curPhi);
            block.addCompletedPhi(curPhi);
        }
    }

//    phis = gatherAllPhis(cfg)
//   (trivial, workingSet) = splitTrivial(phis)
//   while (trivial is not empty):
//            for phi in trivial:
//    removeTrivialPhi(phi)
//      (trivial, workingSet) = splitTrivial(workingSet)
}
