 import java.io.Console;
 
 public class Questions {
	 
	 public static void main(String[] args) {
		 Console console = System.console();
		 
		 String anyQuestions = console.readLine("Are there any questions?  %n");
		 while (anyQuestions.equals ("yes")) {
			 String question = console.readLine("What is your question? %n");
			 console.printf("I don't understand your question: %s", question);
			 anyQuestions = Console.readLine("Are there any more questions? %n,");
		 }
		 Console.printf("Next Slide...");
		 
		 
	 }
 
 }