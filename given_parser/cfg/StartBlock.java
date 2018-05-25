package cfg;

import llvm.declarations.ParameterDeclaration;
import llvm.lattice.LatticeValue;
import llvm.value.Register;

import java.util.*;

public class StartBlock extends Block {

    private List<ParameterDeclaration> params;
    private HashMap<Register, LatticeValue> lattice;
    private List<Register> workingSet;

    public StartBlock(String funcName, List<ParameterDeclaration> params) {
        super(funcName + "StartBlock");
        super.sealBlock();
        this.params = params;
        lattice = new HashMap<>();
        workingSet = new ArrayList<>();
    }

    public List<ParameterDeclaration> getParams() {
        return params;
    }

    public HashMap<Register, LatticeValue> getLattice() {
        return lattice;
    }

    public List<Register> getWorkingSet() {
        return workingSet;
    }
}
