package llvm.lattice;

import cfg.Block;
import llvm.Instruction;
import llvm.value.Register;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class SSCP {

    public static HashMap<Register, LatticeValue> lattice = new HashMap<>();

    private Set<Register> workingSet;

    public SSCP() {
        this.workingSet = new HashSet<>();
    }


    public static LatticeValue matchTypes(LatticeValue val1, LatticeValue val2) {
        if (val1 instanceof LatticeTop) {
            return val2;
        } else if (val1 instanceof LatticeInteger) {
            LatticeInteger latInt1 = (LatticeInteger) val1;
            if (val2 instanceof LatticeTop
                    || (val2 instanceof LatticeInteger && ((LatticeInteger) val2).getValue() == latInt1.getValue())) {
                return val1;
            } else {
                return new LatticeBottom();
            }
        }
        return val1;
    }

    public static void propagate(List<Block> blockList) {
        for(Block block:blockList) {
            for(Instruction inst: block.getFinalLLVM()) {

            }
        }
    }

}
