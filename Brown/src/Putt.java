import java.io.Console;
import java.util.Random;


public class Putt {

    public static void main(String[] args) {
        Console console = System.console();
        Random luck = new Random();

        int numberOfPutts = 0;
        boolean ballInHole = false;

        do {
            console.printf("Putt putt %n");
            numberOfPutts++;
            ballInHole = luck.nextBoolean();

        } while (!ballInHole);

        if (numberOfPutts <= 1) {
                console.printf("Damn! You just got a hole-in-%d! %n", numberOfPutts);
        } else if (numberOfPutts <= 4) {
                console.printf("Hmmmm %d strokes...Not too shabby! %n", numberOfPutts);  
        } else {
            console.printf("Yooooh! Stick to pool! %d strokes is not a healthy situation! %n", numberOfPutts);       
        }
    

    }

}