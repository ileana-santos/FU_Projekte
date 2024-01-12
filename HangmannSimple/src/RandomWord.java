import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;


public class RandomWord {
    public static String get(){
        Path filePath = Paths.get("C:/Users/isanv/Desktop/Clase Concentracion/03.01.24/Hangman/random_words.txt");
        List<String> lines = null;
        try{
            lines = Collections.unmodifiableList(Files.readAllLines(filePath));
        } catch (IOException e){
            e.printStackTrace();
        }
        assert lines != null;
        return lines.get((int) (Math.random() * lines.size()) + 1);
    }
}
