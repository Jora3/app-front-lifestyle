<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05/02/2018
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object compte = session.getAttribute("compte");
    if(compte == null)
        response.sendRedirect("/Login");
    else
        response.sendRedirect("/Produits");
%>
