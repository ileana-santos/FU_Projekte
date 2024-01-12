import java.util.Scanner;

public class UserInterface {
/*    public Kunde createKunde(){
        String vorname = this.getLine("Vorname eingeben: ");
        String nachname = this.getLine("Nachname eingeben: ");
        return new Kunde(vorname, nachname);
    }*/

    private String getLine(String hint){
        System.out.println(hint);
        Scanner s = new Scanner(System.in);
        return s.nextLine();
    }
}
