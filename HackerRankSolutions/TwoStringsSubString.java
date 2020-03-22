import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {

    static int MAX_CHAR = 26; 

    static String twoStrings(String s1, String s2) {

        
        int len1 = s1.length();
        int len2 = s2.length();

        char[] s1Array = s1.toCharArray();
        char[] s2Array = s2.toCharArray();

        Set charSet = new HashSet();
        for(int i = 0; i < len1; i++){
            charSet.add(s1Array[i]);
        }

        boolean found = false;
        for(int i = 0; i < len2; i++){
            if(charSet.contains(s2Array[i])){
                found = true;
                break;
            }
            found = false;
        }
        return found ? "YES" : "NO";
        
       
    }

    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) throws IOException {
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        int q = scanner.nextInt();
        scanner.skip("(\r\n|[\n\r\u2028\u2029\u0085])?");

        for (int qItr = 0; qItr < q; qItr++) {
            String s1 = scanner.nextLine();

            String s2 = scanner.nextLine();

            String result = twoStrings(s1, s2);

            bufferedWriter.write(result);
            bufferedWriter.newLine();
        }

        bufferedWriter.close();

        scanner.close();
    }
}
