package servlets;

import com.google.gson.Gson;
import mapping.Entreprise;
import utils.DataResponse;
import utils.ReponseException;
import utils.ServiceRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "SigninServlet")
public class SigninServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String dateNaissance = request.getParameter("dateDeNaissance");
            String[] keys = {"nom", "prenom", "dateNaissance", "sexe", "societe", "pays", "ville", "lieu", "mail", "mobile", "domaineId", "pass1", "pass2"};
            String pays = request.getParameter("pays"),
                    ville = request.getParameter("ville"),
                    lieu = request.getParameter("lieu"),
                    mail = request.getParameter("email1"),
                    mobile = request.getParameter("mobile");
            HttpSession session = request.getSession();
            if(dateNaissance == null) {
                String societe = request.getParameter("societe"),
                        domaineId = request.getParameter("domaine"),
                        pass1 = request.getParameter("password1"),
                        pass2 = request.getParameter("password2");
                String[] values = {"nulle", "nulle", "nulle", "nulle", societe, pays, ville, lieu, mail, mobile, domaineId, pass1, pass2};;
                initNull(values);
                ServiceRequest serviceRequest = new ServiceRequest();
                serviceRequest.setUrl("InscriptionSClient", "inscription");
                String reponse = serviceRequest.post(keys, values);
                if(serviceRequest.natureReponse(reponse)) {
                    DataResponse dataResponse = new DataResponse(reponse);
                    Entreprise entreprise = new Gson().fromJson(dataResponse.get(), Entreprise.class);
                    session.setAttribute("compte", entreprise);
                    response.sendRedirect("/Produits");
                }
                else {
                    ReponseException exception = new ReponseException(reponse);
                    session.setAttribute("messageErreur", exception.getObject());
                    response.sendRedirect("/views/login-signin.jsp?#signup");
                }
            }
            else {
                String nom = request.getParameter("nom"),
                        prenom = request.getParameter("prenom"),
                        sexe = request.getParameter("sexe"),
                        domaineId = request.getParameter("domaine"),
                        pass1 = request.getParameter("password1"),
                        pass2 = request.getParameter("password2");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void initNull(String[] values) {
        int fin = values.length;
        for(int i = 0; i < fin; i++) {
            if(values[i] == null)
                values[i] = "";
        }
    }
}
