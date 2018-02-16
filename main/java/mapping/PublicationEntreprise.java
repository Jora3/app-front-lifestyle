package mapping;

import java.io.Serializable;

public class PublicationEntreprise implements Serializable {
    private String publicationId;
    private Bazar bazar;
    private String date;
    private int nbAjouts;

    public PublicationEntreprise(String publicationId, Bazar bazar, String date, int nbAjouts) {
        this.setPublicationId(publicationId);
        this.setBazar(bazar);
        this.setDate(date);
        this.setNbAjouts(nbAjouts);
    }

    public PublicationEntreprise() {
    }

    public String getPublicationId() {
        return publicationId;
    }

    public void setPublicationId(String publicationId) {
        this.publicationId = publicationId;
    }

    public Bazar getBazar() {
        return bazar;
    }

    public void setBazar(Bazar bazar) {
        this.bazar = bazar;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getNbAjouts() {
        return nbAjouts;
    }

    public void setNbAjouts(int nbAjouts) {
        this.nbAjouts = nbAjouts;
    }
}
