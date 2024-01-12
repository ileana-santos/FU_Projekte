import java.util.Scanner;

public class Umrechner2 {
    private Scanner s = new Scanner(System.in);

    public double getResult(int zieleinheit, int zielformat){
        double eingabe = -1.0;
        try {
            eingabe = Double.parseDouble(s.nextLine());
        } catch (NumberFormatException e){
            System.out.println(e.getMessage());
        }
        double multiplikator = 1.0;

        if (zielformat == 1){
            multiplikator = 100.0;
        }

        if (eingabe > -1.0){
            switch (zieleinheit){
                case 1:
                    return eingabe * 0.0254 * multiplikator;
                case 2:
                    return eingabe * 0.3048 * multiplikator;
                case 3:
                 return eingabe * 0.9144 * multiplikator;
                case 4:
                    return eingabe * 1609.34 * multiplikator;
                default:
                    return -1.0;
            }
        }
        return eingabe;
    }
}
