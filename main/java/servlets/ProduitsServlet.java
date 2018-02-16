package servlets;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import mapping.*;
import utils.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProduitsServlet")
@MultipartConfig
public class ProduitsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Object compte = session.getAttribute("compte");
            if(compte != null && compte.getClass().getSimpleName().equals("Entreprise")) {
                String nom = request.getParameter("nom"),
                        categorie = request.getParameter("categorie"),
                        sousCategorie = request.getParameter("sousCategorie"),
                        type = request.getParameter("type"),
                        couleur = request.getParameter("couleur"),
                        taille = request.getParameter("taille"),
                        prix = request.getParameter("prix");
                String[] keys = {"nom", "categorieId", "sousCategorieId", "typeId", "couleur", "tailleId", "prix", "entrepriseId"};
                String[] values = {nom, categorie, sousCategorie, type, couleur, taille, prix, ((Entreprise)compte).getEntrepriseId()};
                ServiceRequest serviceRequest = new ServiceRequest();
                serviceRequest.setUrl("ProduitSClient", "inserer");
                String reponse = serviceRequest.post(keys, values);
                if(serviceRequest.natureReponse(reponse)) {
                    DataResponse dataResponse = new DataResponse(reponse);
                    String produitId = new Gson().fromJson(dataResponse.get(), String.class);
                    Part image = request.getPart("image");
                    Upload upload = new Upload(new FileInputStream(Utilitaire.getFile(request.getServletContext().getRealPath("/"), image)), produitId);
                    upload.run();
                }
                else {
                    ReponseException exception = new ReponseException(reponse);
                    session.setAttribute("messageErreur", exception.getObject());
                }
                response.sendRedirect("/Produits");
            }
            else {
                response.sendRedirect("");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Object compte = session.getAttribute("compte");
            if(compte != null && compte.getClass().getSimpleName().equals("Entreprise")) {
                ServiceRequest serviceRequest = new ServiceRequest();
                serviceRequest.setUrl("CategorieSClient", "categories");
                String reponse = serviceRequest.get();
                if(serviceRequest.natureReponse(reponse)) {
                    DataResponse dataResponse = new DataResponse(reponse);
                    ArrayList<Categorie> categories = new Gson().fromJson(dataResponse.get(), new TypeToken<ArrayList<Categorie>>(){}.getType());
                    session.setAttribute("categories", categories);
                }
                else
                    session.setAttribute("categories", new ArrayList<Categorie>());
                serviceRequest.setUrl("TypeSClient", "types");
                reponse = serviceRequest.get();
                if(serviceRequest.natureReponse(reponse)) {
                    DataResponse dataResponse = new DataResponse(reponse);
                    ArrayList<Type> types = new Gson().fromJson(dataResponse.get(), new TypeToken<ArrayList<Type>>(){}.getType());
                    session.setAttribute("types", types);
                }
                else
                    session.setAttribute("types", new ArrayList<Type>());
                serviceRequest.setUrl("TailleSClient", "tailles");
                reponse = serviceRequest.get();
                if(serviceRequest.natureReponse(reponse)) {
                    DataResponse dataResponse = new DataResponse(reponse);
                    ArrayList<Taille> tailles = new Gson().fromJson(dataResponse.get(), new TypeToken<ArrayList<Taille>>(){}.getType());
                    session.setAttribute("tailles", tailles);
                }
                else
                    session.setAttribute("tailles", new ArrayList<Taille>());
                String[] args = {((Entreprise)compte).getEntrepriseId()};
                serviceRequest.setUrl("ProduitSClient", "byEntreprise", args);
                reponse = serviceRequest.get();
                if(serviceRequest.natureReponse(reponse)) {
                    DataResponse dataResponse = new DataResponse(reponse);
                    ArrayList<Produit> produits = new Gson().fromJson(dataResponse.get(), new TypeToken<ArrayList<Produit>>(){}.getType());
                    session.setAttribute("produits", produits);
                }
                else
                    session.setAttribute("produits", new ArrayList<Produit>());
                response.sendRedirect("/views/templates/template.jsp?contenu=produits");
            }
            else
                response.sendRedirect("/Login");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
