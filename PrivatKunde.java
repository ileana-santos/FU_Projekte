public class PrivatKunde extends Kunde{
    private String vorname;
    public PrivatKunde(String vorname, String nachname){
        super(nachname, (int)System.currentTimeMillis());
        this.vorname = vorname;
    }

    public String getVorname() {
        return vorname;
    }

    public void setVorname(String vorname) {
        this.vorname = vorname;
    }

    public String getType(){
        return "Privat";
    }
}