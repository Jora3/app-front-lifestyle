package servlets;

import com.google.gson.Gson;
import mapping.Produit;
import utils.DataResponse;
import utils.ServiceRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ProduitServlet")
public class ProduitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Object compte = session.getAttribute("compte");
            if(compte != null && compte.getClass().getSimpleName().equals("Entreprise")) {
                String idProduit = request.getParameter("idProduit");
                String[] args = {idProduit};
                ServiceRequest serviceRequest = new ServiceRequest();
                serviceRequest.setUrl("ProduitSClient", "byId", args);
                String reponse = serviceRequest.get();
                if(serviceRequest.natureReponse(reponse)) {
                    DataResponse dataResponse = new DataResponse(reponse);
                    Produit produit = new Gson().fromJson(dataResponse.get(), Produit.class);
                    session.setAttribute("produit", produit);
                    response.sendRedirect("/views/templates/template.jsp?contenu=produit");
                }
                else
                    response.sendRedirect("/Produits");
            }
            else
                response.sendRedirect("/Login");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
