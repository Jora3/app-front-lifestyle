package servlets;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import mapping.Entreprise;
import mapping.Publication;
import utils.DataResponse;
import utils.ServiceRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PublicationsServlet")
public class PublicationsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Object compte = session.getAttribute("compte");
            if(compte != null && compte.getClass().getSimpleName().equals("Entreprise")) {
                String[] args = {((Entreprise)compte).getEntrepriseId()};
                ServiceRequest serviceRequest = new ServiceRequest();
                serviceRequest.setUrl("EntrepriseSClient", "publications", args);
                String reponse = serviceRequest.get();
                if(serviceRequest.natureReponse(reponse)) {
                    DataResponse dataResponse = new DataResponse(reponse);
                    ArrayList<Publication> publications = new Gson().fromJson(dataResponse.get(), new TypeToken<ArrayList<Publication>>(){}.getType());
                    session.setAttribute("publications", publications);
                }
                else
                    session.setAttribute("publications", new ArrayList<Publication>());
                response.sendRedirect("/views/templates/template.jsp?contenu=publications");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
