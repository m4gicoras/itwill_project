import java.util.*;

public class Test {
    public static void main(String[] args) throws InterruptedException {
        String word = "ITWILL";
        for (char ch : word.toCharArray()) {
            System.out.print(ch);
            Thread.sleep(500);
        }
        System.out.println();
    }
}
