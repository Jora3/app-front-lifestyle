<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/02/2018
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row header"><!-- Begin Header -->

    <!-- Logo
    ================================================== -->
    <div class="span5 logo">
        <a href="#"><img src="https://image-lifestyle.000webhostapp.com/images/lifestyle-logo.png" alt="" /></a>
        <h5>Votre style de vie</h5>
    </div>

    <!-- Main Navigation
    ================================================== -->
    <div class="span7 navigation">
        <div class="navbar hidden-phone">

            <ul class="nav">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/Publications">Produits <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/Produits">Nos produits</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/Publications">Publications <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/Publications">Mes publications</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Mon compte <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/Logout">Déconnexion</a></li>
                    </ul>
                </li>
            </ul>

        </div>

    </div>

</div><!-- End Header -->
