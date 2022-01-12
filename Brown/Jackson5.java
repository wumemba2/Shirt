import java.io.Console;

public class Jackson5 {

    public static void main(String[] args) {
        Console console = System.console();

        String[] jacksons = {"Michael", "Jacky", "Tito", 
                            "Jermain", "Marlon", "Randy"};

        console.printf("The Jackson 5 members consist of: %n");

        for (String jackson : jacksons) {
            console.printf("%s Jackson %n", jackson);
        }

        
    }   
}