public abstract class Kunde {
    protected String name;
    private final int kundennummer;

    protected Kunde(String name, int kundennummer) {
        this.kundennummer = kundennummer;
        this.name = name;
    }
    public int getKundennummer() {
        return this.kundennummer;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public abstract String getType();

}