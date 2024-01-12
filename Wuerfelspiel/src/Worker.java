public class Worker {
    private static final int[] augen = new int[6];

    public static void howMany(){
        Wuerfel w = new Wuerfel();
        int anzahl6 = 0;
        int anzahlNicht6 = 0;
        for(int i = 1; i <= 100; i++){
            int erg = w.wurf();
            if (erg == 6){
                anzahlNicht6++;
            }
        }
        System.out.printf("Gewürfelte 6er: %d. %nNicht 6er: %d ", anzahl6, anzahlNicht6);
    }

    public static void paschdetektor(int wurf1, int wurf2){
        if(wurf1 == wurf2){
            System.out.println("Pasch!");
        } else {
            System.out.println(" Kein Pasch!");
        }
    }

    public static void augenzaehlerBisHundert(){
        Wuerfel w = new Wuerfel();
        for(int i = 1; i <= 100; i++){
            //w.wurf() ergibt eine Zahl von 1 bis 6
            // Ergibnis der Würfel einer 1 werden in Index 0
            //u.s.w. gesperichert. Daher Ergibnis des Wurfs -1
            augen [w.wurf() -1]++;
        }
        int augenKey = 1;
        for (int auge : augen){
            System.out.println("Anzahl der Würfe einer " + augenKey + ": " + auge);
        }
    }

    /*public static void augenzaehler(){
        Wuerfel w = new Wuerfel();
        for(int i = 1; i <= 100; i++){
            augen[w.wurf() -1]++;
        }
        int augenKey = 1;
        for(int auge : augen){
            System.out.println("Anzahl der Würfel einer " + augenKey+ " : " + auge);
        }
    }*/

    public static void paschKurz(int wurf1, int wurf2){
        //tenary operator
        System.out.println(wurf1 == wurf2 ? "Pasch" : "Kein Pasch");
    }

    public static boolean pashBool(int wurf1, int wurf2){
        return wurf1 == wurf2;
    }

    public static void bisZumPaschUndDarueberHinaus(){
        Wuerfel w1 = new Wuerfel();
        Wuerfel w2 = new Wuerfel();
        int wuerfe = 0;
        int erfolglos = 0;
        boolean erg = false;

        while (wuerfe == 0){

            do{
                erg = Worker.pashBool(w1.wurf(), w2.wurf());
                if (erg) wuerfe++;
            } while (erg);

            erfolglos++;
        }
        System.out.println("Nach " + erfolglos + " Versuchn gab es einen Pasch - und dann direkt " + wuerfe + " hintereinander");
    }

   /* public void howManyNonStatic(){
        Wuerfel w = new Wuerfel();
        int anzahl6 = 0;
        int anzahlNicht6 = 0;
        for (int i = 1; i <= 100; i++){
            int erg = w.wurf();
            if (erg == 6){
                anzahl6++;
            }else {
                anzahlNicht6++;
            }
        }
        System.out.printf("Gewürfelte 6er: %d. %nNicht 6er: %d ", anzahl6, anzahlNicht6);
    }*/

    public static void augenProzent(int count){
        Wuerfel w = new Wuerfel();
        for (int i = 1; i <= count; i++){
            augen[w.wurf() -1]++;
        }
        int augenKey = 1;
        for (int auge : augen){
            double prozent = ((double) auge / count) * 100;
            System.out.print("Anzahl der Würfe einer " + augenKey + ": ");
            System.out.print(auge + "(" + Math.round((prozent*100)) / 100 + "%)\n ");
        }
    }
}
/*This `Worker` class seems to encapsulate various methods related to dice rolling and analysis.
Let's break down each method:

1. **`howMany()`**: Simulates rolling a die 100 times, counts how many times the result is a 6,
and how many times it's not a 6.

2. **`paschdetektor(int wurf1, int wurf2)`**: Compares two dice rolls and determines if they constitute a
"Pasch" (both values are the same) or not.

3. **`augenzaehler()`**: Counts the occurrences of each face of the die after rolling it 100 times.
It stores the counts in the `augen` array, tracking how many times each face appeared.

4. **`paschKurz(int wurf1, int wurf2)`**: Uses a ternary operator to quickly determine if two dice
rolls constitute a "Pasch" or not.

5. **`paschBool(int wurf1, int wurf2)`**: Similar to `paschdetektor`, this method returns a boolean indicating
if two rolls constitute a "Pasch" or not.

6. **`bisZumPaschUndDarueberHinaus()`**: Simulates rolling two dice repeatedly until a "Pasch" occurs and counts
how many attempts it took to get the first "Pasch" and subsequent consecutive "Pasch" results.

7. **`howManyNonStatic()`**: Similar to `howMany()`, but this method is not static and operates on an
 instance of the `Worker` class.

The methods use an instance of the `Wuerfel` class (which likely represents a die or dice) to generate
random dice rolls and perform various analyses on the results.

Overall, this class provides functionalities related to dice rolling, counting occurrences,
and detecting specific roll patterns like "Pasch" (when both dice show the same value).*/