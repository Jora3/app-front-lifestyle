package servlets;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import mapping.Commentaire;
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

@WebServlet(name = "CommentairesServlet")
public class CommentairesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Object compte = session.getAttribute("compte");
            if(compte != null && compte.getClass().getSimpleName().equals("Entreprise")) {
                String publicationId = request.getParameter("publicationId");
                String[] args = {publicationId};
                ServiceRequest serviceRequest = new ServiceRequest();
                serviceRequest.setUrl("PublicationSClient", "byId", args);
                String reponse = serviceRequest.get();
                if(serviceRequest.natureReponse(reponse)) {
                    DataResponse dataResponse = new DataResponse(reponse);
                    Publication publication = new Gson().fromJson(dataResponse.get(), Publication.class);
                    session.setAttribute("publication", publication);
                    serviceRequest.setUrl("PublicationSClient", "commentaires", args);
                    reponse = serviceRequest.get();
                    if(serviceRequest.natureReponse(reponse)) {
                        DataResponse dataResponse1 = new DataResponse(reponse);
                        ArrayList<Commentaire> commentaires = new Gson().fromJson(dataResponse1.get(), new TypeToken<ArrayList<Commentaire>>(){}.getType());
                        session.setAttribute("commentaires", commentaires);
                    }
                    else
                        session.setAttribute("commentaires", new ArrayList<Commentaire>());
                    response.sendRedirect("/views/templates/template.jsp?contenu=commentaires");
                }
                else
                    response.sendRedirect("/Publications");
            }
            else
                response.sendRedirect("/Login");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
