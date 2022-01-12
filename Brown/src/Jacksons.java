import java.io.Console;

public class Jacksons {

    public static void main(String[] args) {
        Console console = System.console();

        String[] jacksons = {"Michael", "Jackie", "Tito", 
                            "Jermaine", "Marlon", "Randy"};

        console.printf("The Jackson 5 members consist of: %n"); 
        for (int i = 0; i < 6; i++) {
            console.printf("%s Jackson %n", jacksons[i]);

        }

    }
}