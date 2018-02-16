package utils;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ServiceRequest {
    private String url;

    //private final String host = "http://localhost:8080";
    private final String host = "https://app-server-lifestyles.herokuapp.com";

    public boolean natureReponse(String reponse) {
        String[] tabObj = reponse.split(",");
        String[] nature = tabObj[0].split(":");
        return !nature[1].equals("true");
    }

    public String post(String[] keys, String[] values) throws Exception {
        URL url = new URL(getUrl());
        HttpURLConnection httpURLConnection = (HttpURLConnection)url.openConnection();
        httpURLConnection.setRequestMethod("POST");
        String params = getParams(keys, values);
        httpURLConnection.setDoOutput(true);
        DataOutputStream out = new DataOutputStream(httpURLConnection.getOutputStream());
        out.writeBytes(params);
        out.flush();
        out.close();
        BufferedReader in = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
        String line;
        StringBuilder resultat = new StringBuilder();
        while ((line = in.readLine()) != null)
            resultat.append(line);
        return resultat.toString();
    }

    private String getParams(String[] keys, String[] values) throws Exception {
        if(keys.length != values.length)
            throw new Exception("Valeurs incomplètes");
        StringBuilder params = new StringBuilder();
        int fin = keys.length;
        for(int i = 0; i < fin; i++)
            params.append(keys[i]).append("=").append(values[i]).append("&");
        return params.substring(0, params.length()-1);
    }

    public String get() throws Exception {
        URL url = new URL(getUrl());
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setRequestMethod("GET");
        BufferedReader in = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
        String ligne;
        StringBuilder resultat = new StringBuilder();
        while ((ligne = in.readLine()) != null)
            resultat.append(ligne);
        return resultat.toString();
    }

    public void setUrl(String service, String fonction) {
        String url = host + "/" + service + "?" + fonction;
        setUrl(url);
    }

    public void setUrl(String service, String fonction, String[] args) {
        String url = host + "/" + service + "?" + fonction + toParams(args);
        String[] tab = url.split(" ");
        StringBuilder result = new StringBuilder();
        for(int i = 0; i < tab.length-1; i++)
            result.append(tab[i]).append("%20");
        result.append(tab[tab.length - 1]);
        setUrl(result.toString());
    }

    private String toParams(String[] args) {
        String reponse = "";
        for (String arg : args)
            reponse += "/" + arg;
        return reponse;
    }

    public ServiceRequest() {}

    public String getUrl() {
        return url;
    }

    private void setUrl(String url) {
        this.url = url;
    }
}
