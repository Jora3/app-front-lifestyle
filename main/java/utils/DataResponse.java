package utils;

public class DataResponse {
    private String reponse;

    public String getType() {
        String[] data = get().split(":");
        if(data.length > 0) {
            String classe = data[0].substring(2, data[0].length()-3);
            classe = classe.substring(0, 1).toUpperCase() + classe.substring(1);
            return classe;
        }
        return null;
    }

    public String get() {
        String[] tab1 = reponse.split(",");
        String reponse = concatener(tab1, ",");
        reponse = reponse.substring(0, reponse.length()-1);
        String[] tab2 = reponse.split(":");
        return concatener(tab2, ":");
    }

    private String concatener(String[] tab, String separateur) {
        int taille = tab.length;
        String result = "";
        for(int i = 1; i < taille; i++)
            result += tab[i] + separateur;
        return result.substring(0, result.length()-1);
    }

    public DataResponse(String reponse) {
        this.setReponse(reponse);
    }

    public String getReponse() {
        return reponse;
    }

    public void setReponse(String reponse) {
        this.reponse = reponse;
    }
}
