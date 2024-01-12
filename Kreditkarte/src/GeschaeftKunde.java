public class GeschaeftKunde extends Kunde {
    private String firmaname;

    public GeschaeftKunde(String name) {
        super(name, (int)System.currentTimeMillis());
        this.firmaname = name;
    }

    public String getFirmaname() {
        return firmaname;
    }

    public void setFirmaname(String firmaname) {
        this.firmaname = name;
    }

    public String getType(){
        return "Geschäft";
    }
}
