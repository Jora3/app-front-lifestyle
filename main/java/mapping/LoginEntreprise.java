package mapping;

public class LoginEntreprise {
    private String nomEntreprise;
    private String pass;

    public LoginEntreprise(String nomEntreprise, String pass) {
        this.setNomEntreprise(nomEntreprise);
        this.setPass(pass);
    }

    public LoginEntreprise() {
    }

    public String getNomEntreprise() {
        return nomEntreprise;
    }

    public void setNomEntreprise(String nomEntreprise) {
        this.nomEntreprise = nomEntreprise;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
