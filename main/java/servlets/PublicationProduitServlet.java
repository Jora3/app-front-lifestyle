package servlets;

import mapping.Entreprise;
import utils.DataResponse;
import utils.ServiceRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "PublicationProduitServlet")
public class PublicationProduitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Object compte = session.getAttribute("compte");
            if(compte != null && compte.getClass().getSimpleName().equals("Entreprise")) {
                String idProduit = request.getParameter("idProduit");
                String[] args = {idProduit, ((Entreprise)compte).getEntrepriseId()};
                ServiceRequest serviceRequest = new ServiceRequest();
                serviceRequest.setUrl("EntrepriseSClient", "publierProduit", args);
                String reponse = serviceRequest.get();
                if(serviceRequest.natureReponse(reponse))
                    response.sendRedirect("/Publications");
                else
                    response.sendRedirect("/Produit?idProduit="+idProduit);
            }
            else
                response.sendRedirect("/Login");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
