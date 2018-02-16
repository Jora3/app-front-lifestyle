package servlets.ajax;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import mapping.SousCategorie;
import utils.DataResponse;
import utils.ServiceRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "SCByCategorieServlet")
public class SCByCategorieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String categorieId = request.getParameter("categorieId");
            String[] args = {categorieId};
            ServiceRequest serviceRequest = new ServiceRequest();
            serviceRequest.setUrl("SousCategorieSClient", "byCategorie", args);
            String reponse = serviceRequest.get();
            if(serviceRequest.natureReponse(reponse)) {
                DataResponse dataResponse = new DataResponse(reponse);
                ArrayList<SousCategorie> sousCategories = new Gson().fromJson(dataResponse.get(), new TypeToken<ArrayList<SousCategorie>>(){}.getType());
                response.setHeader("Access-Control-Allow-Origin", "*");
                response.setHeader("Access-Control-Allow-Methods", "GET, POST, PATCH, PUT, DELETE, OPTIONS");
                response.setHeader("Access-Control-Allow-Headers", "Origin, Content-Type, X-Auth-Token");
                response.setContentType("application/json");
                PrintWriter writer = response.getWriter();
                writer.write(new Gson().toJson(sousCategories));
                writer.flush();
                writer.close();
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
