import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Konto {

    private final Kunde kunde;
    private List<Kreditkarte> karten = new ArrayList<>();
    private int kontonummer;

    // Verwendung von Arraylist
    public Konto(Kunde kunde){
        Random r = new Random();
        this.kontonummer = r.nextInt(900) + 100;
        this.kunde = kunde;
        karten.add(new Kreditkarte());
    }

    public void removeKreditkarte(Kreditkarte k){
        this.karten.remove(k);
    }

    public void addKreditkarte(){
        this.karten.add(new Kreditkarte());
    }

    public void removeKreditkarteFromList(Kreditkarte k){
        this.karten.remove(k);
    }

    public void addKreditkarteToList(){
        this.karten.add(new Kreditkarte());
    }

    public List<Kreditkarte> getKarten() {
        return karten;
    }

    public void setKarten(List<Kreditkarte> karten) {
        this.karten = karten;
    }

    public int getKontonummer() {
        return kontonummer;
    }

    public void setKontonummer(int kontonummer) {
        this.kontonummer = kontonummer;
    }

    public Kunde getKunde(){
        return this.kunde;
    }
}
