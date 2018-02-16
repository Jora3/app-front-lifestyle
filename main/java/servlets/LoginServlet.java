package servlets;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import mapping.Domaine;
import mapping.Entreprise;
import mapping.Personne;
import utils.DataResponse;
import utils.ReponseException;
import utils.ServiceRequest;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email"),
                    password = request.getParameter("password");
            String[] keys = {"email", "password"};
            String[] values = {email, password};
            ServiceRequest serviceRequest = new ServiceRequest();
            serviceRequest.setUrl("LoginSClient", "login");
            String reponse = serviceRequest.post(keys, values);
            HttpSession session = request.getSession();
            if(serviceRequest.natureReponse(reponse)) {
                DataResponse dataResponse = new DataResponse(reponse);
                Object compte = new Object();
                if(dataResponse.getType().equals(Entreprise.class.getSimpleName()))
                    compte = new Gson().fromJson(dataResponse.get(), Entreprise.class);
                else if(dataResponse.getType().equals(Personne.class.getSimpleName()))
                    compte = new Gson().fromJson(dataResponse.get(), Personne.class);
                session.setAttribute("compte", compte);
                response.sendRedirect("/Produits");
            }
            else {
                ReponseException exception = new ReponseException(reponse);
                session.setAttribute("messageErreur", exception.getObject());
                response.sendRedirect("/Login");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ServiceRequest serviceRequest = new ServiceRequest();
            serviceRequest.setUrl("DomaineSClient", "domaines");
            String reponse = serviceRequest.get();
            HttpSession session = request.getSession();
            if(serviceRequest.natureReponse(reponse)) {
                DataResponse dataResponse = new DataResponse(reponse);
                ArrayList<Domaine> domaines = new Gson().fromJson(dataResponse.get(), new TypeToken<ArrayList<Domaine>>(){}.getType());
                session.setAttribute("domaines", domaines);
            }
            else
                session.setAttribute("domaines", new ArrayList<Domaine>());
            response.sendRedirect("/views/login-signin.jsp");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
