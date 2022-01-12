import java.io.Console;

public class Milk {

    public static void main(String[] args) {
        Console console = System.console();
    
    
    String milk = ("milk");
    String damn = ("No more damn");
    String ground = ("they're all on the ground");

        for (int i = 99; i > 3; i--) {
            console.printf("%d bottles of %s on the wall, %d bottles of %s, take one down...pass it around %n" +
            "%d bottles of %s on the wall. %n %n", 
            i, milk, i, milk, i-1, milk);
            }

              for (int i = 1; i > 0; i--) {
              console.printf("%d bottles of %s on the wall, %d bottle of %s, take one down...pass it around %n" +
              "%d bottles of %s on the wall. %n %n", 
              i+2, milk, i+2, milk, i+1, milk);
              }

                for (int i = 1; i > 0; i--) {
                  console.printf("%d bottles of %s on the wall, %d bottles of %s, take one down...pass it around %n" +
                  "%d bottle of %s on the wall. %n %n", 
                  i+1, milk, i+1, milk, i, milk);
                }

                  for (int i = 0; i > -1; i--) {
                      console.printf("%d bottle of %s on the wall, %s bottle of %s, take one down...%s %n" +
                      "%s bottles of %s on the wall. %n %n", 
                      i+1, milk, i+1, milk, ground, damn, milk);
    
            }
    }
}



