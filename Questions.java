import java.io.Console;

	public class Questions {

		public static void main(String[] args) {
        Console console = System.console();

		String anyQuestions = console.readLine("Are there any questions? %n");
		while (anyQuestions.contains("yes") || anyQuestions.equalsIgnoreCase("Yes")){

		String question = console.readLine("What is your question? %n");
		console.printf("I don't understand your question: %s %n", question);

		anyQuestions = console.readLine("Are there any more questions? %n");                                                            
	}

	console.printf("Next slide please....");        


    }

}