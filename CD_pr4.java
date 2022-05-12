import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;
import java.util.*;
public class CD_pr4 {
    public static void main(String[] args) {
        Map<String, Map<String, ArrayList<String>>> table = new TreeMap<>();
        Map<String, String> map = new TreeMap<>();
        map.putIfAbsent("C", "Championship");
        map.putIfAbsent("b", "ball");
        map.putIfAbsent("t", "toss");
        map.putIfAbsent("is", "is");
        map.putIfAbsent("wa", "want");
        map.putIfAbsent("won", "won");
        map.putIfAbsent("P", "Played");
        map.put("me", "me");
        map.put("I", "I");
        map.put("y", "you");
        map.put("India", "India");
        map.put("AUS", "Australia");
        map.put("St", "Steve");
        map.put("J", "John");
        map.put("the", "the");
        map.put("a", "a");
        map.put("an", "an");
        Map<String, ArrayList<String>> r = new TreeMap<>();
        for(Map.Entry<String, String> val: map.entrySet()){
            if(val.getKey() == "C" || val.getKey() == "b" || val.getKey() ==
                    "t") continue;
            r.put(val.getValue(), new ArrayList<>(Arrays.asList("NP", "VP")));
        }
        table.put("S", r);
        r = new TreeMap<>();
        ArrayList<String> k = new ArrayList<>(Arrays.asList("me", "I", "y"));
        for(String l: k){
            r.put(map.get(l), new ArrayList<>(Arrays.asList("P")));
        }
        k = new ArrayList<>(Arrays.asList("India", "AUS", "St", "J"));
        for(String l: k){
            r.put(map.get(l), new ArrayList<>(Arrays.asList("PN")));
        }
        k = new ArrayList<>(Arrays.asList("the", "a", "an"));
        for(String l: k){
            r.put(map.get(l), new ArrayList<>(Arrays.asList("D","N")));
        }
        table.put("NP", r);
        r = new TreeMap<>();
        k = new ArrayList<>(Arrays.asList("is","wa","won","P"));
        for (String l : k){
            r.put(map.get(l), new ArrayList (Arrays.asList("V","NP")));
        }
        table.put("VP",r);
        r = new TreeMap<>();
        k = new ArrayList<>(Arrays.asList("C","b","t"));
        for (String l : k){
            r.put(map.get(l), new ArrayList (Arrays.asList(map.get(l))));
        }
        table.put("N",r);
        r = new TreeMap<>();
        k = new ArrayList<>(Arrays.asList("is","wa","won","P"));
        for (String l : k){
            r.put(map.get(l), new ArrayList(Arrays.asList(map.get(l))));
        }
        table.put("V",r);
        r = new TreeMap<>();
        k = new ArrayList<>(Arrays.asList("me","I","y"));
        for (String l : k){
            r.put(map.get(l), new ArrayList(Arrays.asList(map.get(l))) );
        }
        table.put("P",r);
        r = new TreeMap<>();
        k = new ArrayList<>(Arrays.asList("India","AUS","St","J"));
        for (String l : k){
            r.put(map.get(l), new ArrayList(Arrays.asList(map.get(l))) );
        }
        table.put("PN",r);
        r = new TreeMap<>();
        k = new ArrayList<>(Arrays.asList("the","a","an"));
        for (String l : k){
            r.put(map.get(l), new ArrayList( Arrays.asList(map.get(l))));
        }
        table.put("D",r);
        for(Map.Entry<String, Map<String, ArrayList<String>>> l:
                table.entrySet()){
            System.out.println(l.getKey() + " -> ");
            for(Map.Entry<String, ArrayList<String>> i:
                    l.getValue().entrySet()){
                System.out.print("\t"+i.getKey() + " -> ");
                System.out.println(i.getValue());
            }
        }
        String inputString = "India won the $";
        String[] ipArr = inputString.split(" ");
        System.out.println(new ArrayList(Arrays.asList(ipArr)));
        ArrayList<String> terminals = new ArrayList<>();
        for ( String key : map.keySet() ) {
            terminals.add(map.get(key));
        }
        ArrayList<String> nonTerminals = new ArrayList<>();
        for(String key : table.keySet()){
            nonTerminals.add(key);
        }

        Stack<String> stack = new Stack<>();
        boolean errF = false;
        int i = 0;
        stack.push("$");
        stack.push("S");
        while(!stack.empty()){
            System.out.print("stack : ");
            System.out.println(stack);
            String A = stack.peek();
            String ree = ipArr[i];
            if( terminals.contains(A) || A.equals("$")){
                if(A.equals(ree)){
                    i++;
                    stack.pop();
                }
                else{
                    errF = true;
                    break;
                }
            }
            else if(nonTerminals.contains(A)){
                Map<String, ArrayList<String>> bigger = table.get(A);
                ArrayList<String> smaller = bigger.get(ree);
                System.out.println(smaller);
                if(smaller == null){
                    errF = true;
                    System.out.println("ntbreak");
                    break;
                }
                else{
                    stack.pop();
                    for (int iter = smaller.size() - 1; iter >= 0; iter--) {
                        stack.push(smaller.get(iter));
                    }
                }
            }

        }
        System.out.print("stack : ");System.out.println(stack);
        if(errF){
            System.out.println("invalid");
        }
        else{
            System.out.println("valid");
        }
    }
}