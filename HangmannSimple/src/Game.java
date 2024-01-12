import java.util.Arrays;
import java.util.Scanner;

public class Game {
    private int lives = 10;
    private char [] board;
    private String wort;
    private final char[] tipps = new char[26];

    public Game(){}

    public Game(int lives) {
        this.lives = lives;
    }

    public void start(){
        this.wort = RandomWord.get();
        this.initBoard();
        System.out.println("Das Wort hat " + wort.length() + " Buchstaben");
        int korrekt = 0;
        while ((lives >= 1)){
            System.out.println("Du hast " + lives + " Vesuche, um das gesuchte Wort zu erraten");
            this.showBoard();
            Scanner s = new Scanner(System.in);
            char buchstaben = s.nextLine().toLowerCase().toCharArray()[0];
            if (validGuess(buchstaben)) {
                if (exists(buchstaben)){
                    korrekt = rightGuess(buchstaben, korrekt);
                } else {
                    System.out.println("Der gewählte Buchstabe ist leider nicht im Wort enthalten");
                    lives--;
                }
            } else {
                System.out.println("Du hast diesen Buchstaben bereist getippt");
                this.printGuesses();
            }

        }
    }

    private int rightGuess(char buchstabe, int korrekt){
        System.out.println("Du hast richtig geraten");
        int[] positions = this.getPositions(buchstabe);
        showBoard(positions);
        addToGuess(buchstabe);
        printGuesses();
        korrekt++;
        if (korrekt == this.wort.length()){
            System.out.println("Du hast gewonnen!");
            System.exit(0);
        }
        return korrekt;
    }
    private int[] getPositions(char buchstabe){
        int[] tempResult = new int[this.wort.length()];
        int findings = 0;
        for(int i = 0; i < wort.length(); i++){
            if(wort.toLowerCase().charAt(i) == buchstabe){
                tempResult[i] = i;
                findings++;
            } else {
                tempResult[i] =-1;
            }
        }
        int[] result = new int[findings];
        int j = 0;
        for (int i = 0; i < wort.length(); i++){
            if (tempResult[i] > -1){
                result[j] = tempResult[i];
                j++;
            }
        }
        return result;
    }
    private boolean validGuess(char buchstabe){
        for (char tipp : this.tipps){
            if (tipp == buchstabe){
                return false;
            }
        }
        return true;
    }
    private void addToGuess(char buchstabe){
        for (int i = 0; i < this.tipps.length; i++){
            if (this.tipps[i] == 0){
                this.tipps[i] = buchstabe;
                break;
            }
        }
    }
    private void printGuesses(){
        System.out.println("Deine bisher geratenen Buchstabe sind: ");
        for (char tipp : this.tipps){
            if (tipp > 0){
                System.out.print(tipp + " ");
            }
        }
        System.out.println();
    }
    private boolean exists(char buchstabe){
        return this.wort.toLowerCase().indexOf(buchstabe) > -1;
    }
    private void initBoard(){
        board = new char[wort.length()];
        Arrays.fill(board,'_');
    }
    private void showBoard(){
        System.out.println(board);
    }
    private void showBoard(int[] positions){
        for (int position : positions){
            this.board[position] = this.wort.charAt(position);
        }
    }
}
