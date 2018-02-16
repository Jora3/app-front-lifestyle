package utils;

public class ReponseException {
    private String erreur;
    private String object;

    public ReponseException(String reponse) {
        String[] tabReponse = reponse.split(","),
                erreur = tabReponse[0].split(":"),
                object = tabReponse[1].split(":");
        setErreur(erreur[1]);
        setObject(object[1].substring(0,object[1].length()-1));
    }

    public ReponseException(String erreur, String object) {
        this.setErreur(erreur);
        this.setObject(object);
    }

    public ReponseException() {
    }

    public String getErreur() {
        return erreur;
    }

    public void setErreur(String erreur) {
        this.erreur = erreur;
    }

    public String getObject() {
        return object;
    }

    public void setObject(String object) {
        this.object = object;
    }
}
