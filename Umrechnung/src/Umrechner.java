import com.sun.org.apache.xalan.internal.xsltc.trax.XSLTCSource;

import java.util.Scanner;

public class Umrechner {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.println("cm oder m?");
    //String cmm = stringScanner.next();
    System.out.println("Welches Maß möchten Sie umrechnen?");
    System.out.println("1. inch");
    System.out.println("2. foot");
    System.out.println("3. yard");
    System.out.println("4. mile to cm");
    int auswahl = scanner.nextInt();

    double eingabe;
    if (cmm == cm)
    switch(auswahl){
      case 1:
        System.out.println("Bitte geben Sie die Anzahl der Inch ein: ");
        double inches = scanner.nextDouble();
        eingabe = inches * 2.54;
        System.out.println(inches + " inch = " + eingabe + " cm");
        break;
      case 2:
        System.out.println("Bitte geben Sie die Anzahl der foot ein: ");
        double foot = scanner.nextDouble();
        eingabe = foot * 30.48;
        System.out.println(foot + " foot = " + eingabe + " cm");
        break;
      case 3:
        System.out.println("Bitte geben Sie die Anzahl der yard ein: ");
        double yard = scanner.nextDouble();
        eingabe = yard * 91.44;
        System.out.println(yard + " yard = " + eingabe + " cm");
        break;
      case 4:
        System.out.println("Bitte geben Sie die Anzahl der mile ein: ");
        double mile = scanner.nextDouble();
        eingabe = mile * 16093.4;
        System.out.println(mile + " mile = " + eingabe + " cm");
        break;

      default:
        System.out.println("ungültige Auswahl!");
    }

    scanner.close();
  }
}
