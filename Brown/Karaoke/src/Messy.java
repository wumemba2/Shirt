package Karaoke.src;

import java.util.Arrays;
import java.util.List;

import javax.print.attribute.standard.PrinterLocation;

public class Messy {
  public static void main(String[] args) {
    System.out.println("one");
    System.out.println("two");
    System.out.println("three");
    System.out.println("four");
    System.out.println("five");
    
    // Please comment out this line and
    // this line as well with a hotkey that does multi-line commenting
    List<String> numberWords = Arrays.asList("six", "seven", "eight", "nine");
    for (String numberWord : numberWords) {
      System.out.println(numberWord);
      // Use the sout shortcut to write out numberWord;
    }
  }
}