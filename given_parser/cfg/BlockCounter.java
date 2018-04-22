package cfg;



public class BlockCounter {

    private static int currentBlock = 0;

    public static String getNextBlockLabel() {
        int block = currentBlock;
        currentBlock++;
        return "L" + currentBlock;
    }
}
