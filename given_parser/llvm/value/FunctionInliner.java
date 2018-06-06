package llvm.value;

import cfg.Block;
import cfg.EndBlock;
import cfg.StartBlock;
import llvm.Instruction;
import llvm.InvocationCall;
import llvm.ReturnValue;
import llvm.UnconditionalBranch;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class FunctionInliner {

    public static void inlineFunctions(List<Block> blocks, List<StartBlock> startBlocks) {
        HashMap<String, List<InvocationCall>> callCounts = new HashMap<>();
        HashMap<String, Integer> blockCounts = new HashMap<>();

        String curFunction = null;
        for(Block block: blocks) {

            if(block instanceof StartBlock) {
                curFunction = ((StartBlock) block).getFunctionName();
                blockCounts.put(curFunction, 0);
                //System.out.println("checking function " + curFunction);
            }
            else if(!(block instanceof EndBlock)) {
                //System.out.println("block " + block.getFunction());
                for(Instruction inst:block.getLLVM()) {
                    if (inst instanceof InvocationCall) {
                        InvocationCall call = (InvocationCall) inst;

                        if(!callCounts.containsKey(call.getFunctionName())) {
                            callCounts.put(call.getFunctionName(), new ArrayList<>());
                        }
                        callCounts.get(call.getFunctionName()).add(call);
                        //System.out.println("adding call");
                    }
                }
                blockCounts.put(block.getFunction(), blockCounts.get(block.getFunction()) + 1);
            }
        }

        for(String funcName: callCounts.keySet()) {
            //System.out.println("attempting to inline " + funcName);
            if(!funcName.equals("main") && callCounts.containsKey(funcName)
                    && callCounts.get(funcName).size() == 1 && blockCounts.containsKey(funcName)
                    && blockCounts.get(funcName) == 1) {
                //System.out.println("inlining " + funcName);
                for(StartBlock start:startBlocks) {
                    if(start.getFunctionName().equals(funcName)) {

                        HashMap<Value, Value> valueHashMap = new HashMap<>();

                        Block onlyBlock = start.getSuccessors().get(0);
                        InvocationCall onlyCall = callCounts.get(funcName).get(0);

                        for(Block block:blocks) {
                            if(block.getLLVMWithPhis().contains(onlyCall)) {
                                block.inlineFunction(onlyCall, onlyBlock.getLLVMWithPhis());
                            }
                        }

                        //Do return
                        Block end = onlyBlock.getSuccessors().get(0);
                        assert end instanceof EndBlock;
                        ReturnValue ret = null;
                        for(Instruction inst : end.getLLVMWithPhis()) {
                            //System.out.println(inst.toLLVM());
                            if(inst instanceof ReturnValue) {
                                ret = (ReturnValue) inst;
                                //System.out.println(ret.toLLVM());
                            }
                        }

                        //if it returns a value
                        if(ret != null) {

                            //System.out.println("here");

                            HashMap<Value, Value> returnMap = new HashMap<>();
                            Register target = onlyCall.getTarget();

                            //System.out.println(target.toLLVM());
                            returnMap.put(target, ret.getValue());

                            List<Instruction> uses = target.getUses();
                            //System.out.println(target.toLLVM() + " : " + uses.size());
                            //System.out.println(String.join(", ", uses.stream().map(use -> use.toLLVM()).toArray(String[]::new)));
                            for(int i = uses.size() - 1; i >= 0; i--) {
                                Instruction inst = uses.get(i);

                                //System.out.println("inst " + i + " " + inst.toLLVM());

                                String[] paramNames = start.getParams().stream().map(param -> param.getName()).toArray(String[]::new);

                                //returnMap.put(target, ret.getValue());
                                //inst.replaceSource(returnMap);


                                //System.out.println(String.join(", ", paramNames));
                                //System.out.println(target.toLLVM());

                                Value retValue = ret.getValue();
                                //System.out.println(retValue.toLLVM());

                                if(Arrays.stream(paramNames).filter(name -> name.equals(retValue.toLLVM())).count() > 0) {

                                    //System.out.println("returning a parameter");
                                    //System.out.println(String.join(", ", paramNames));
                                    //System.out.println(retValue.toLLVM());

                                    Value[] args = onlyCall.getArgs();
                                    for(int j = 0; j < paramNames.length; j++) {
                                        //System.out.print(paramNames[j] + " : " + retValue.toLLVM());
                                        if(paramNames[j].equals(retValue.toLLVM())) {
                                            //System.out.println("replacing " + onlyCall.getTarget().toLLVM() + " with " + args[j].toLLVM() + " in " + inst.toLLVM());

                                            returnMap.put(target, args[j]);
                                        }
                                    }
                                } else {
                                    //System.out.println("replacing " + onlyCall.getTarget().toLLVM() + " with " + ret.getValue().toLLVM() + " in " + inst.toLLVM());

                                    returnMap.put(target, retValue);
                                }
                                inst.replaceSource(returnMap);

                                //System.out.println(inst.toLLVM());

                                //System.out.println("replacing " + onlyCall.getTarget().toLLVM() + " with " + ret.getValue().toLLVM() + " in " + inst.toLLVM());
                                //inst.replaceSource(returnMap);
                            }

//                            System.out.println("replacing " + onlyCall.getTarget().toLLVM() + " with " + ret.getValue().toLLVM());
//
//                            boolean inlining = false;
//                            for (Block block : blocks) {
//                                if (block.getLLVM().contains(onlyCall)) {
//                                    System.out.println("has it");
//                                    inlining = true;
//                                } else if (block instanceof EndBlock) {
//                                    inlining = false;
//                                }
//
//                                if (inlining) {
//                                    for(Instruction inst : end.getLLVMWithPhis()) {
//                                        inst.replaceSource(returnMap);
//                                    }
//
//                                }
//                            }
                        }

                        //Do parameters

                        for(Instruction inst : onlyBlock.getLLVMWithPhis()) {
                            String[] paramNames = start.getParams().stream().map(param -> param.getName()).toArray(String[]::new);
                            Value[] args = onlyCall.getArgs();
                            Value[] sources = inst.getSources();
                            for(Value source : sources) {
                                for(int i = 0; i < paramNames.length; i++) {
                                    if(paramNames[i].equals(source.toLLVM())) {
                                        valueHashMap.put(source, args[i]);
                                    }
                                }
                            }
                        }
                        for(Instruction inst : onlyBlock.getLLVMWithPhis()) {
                            inst.replaceSource(valueHashMap);
                        }



                        blocks.remove(start);
                        blocks.remove(onlyBlock);
                        blocks.remove(onlyBlock.getSuccessors().get(0));

                        //startBlocks.remove(start);
                    }
                }
            }
        }

    }
}
