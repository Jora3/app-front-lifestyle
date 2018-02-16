<%@ page import="mapping.Produit" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/02/2018
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Produit produit = (Produit)session.getAttribute("produit");
%>
<!-- Page Content
================================================== -->
<div class="row">

    <!-- Gallery Items
    ================================================== -->
    <div class="span12 gallery-single">

        <div class="row">
            <div class="span6">
                <img src="https://image-lifestyle.000webhostapp.com/images/<%=produit.getPhoto()%>.jpg" class="align-left thumbnail" alt="image">
            </div>
            <div class="span6">
                <h2><%=produit.getNomProduit()%></h2>
                <p class="lead"><%=produit.getDescription()%></p>

                <ul class="project-info">
                    <li><h6>Date d'ajout :</h6> <%=produit.getDateAjout()%></li>
                    <li><h6>Catégorie :</h6> <%=produit.getCategorie().getNomCategorie()%></li>
                    <li><h6>Sous-catégorie :</h6> <%=produit.getSousCategorie().getNomSousCategorie()%></li>
                    <li><h6>Type :</h6> <%=produit.getType().getNomType()%></li>
                    <li><h6>Couleur :</h6> <%=produit.getDetails().getCouleur()%></li>
                    <li><h6>Taille :</h6> <%=produit.getDetails().getTaille().getValeurTaille()%></li>
                    <li><h6>Taille :</h6> <%=produit.getPrix()%>euros</li>
                </ul>

                <a href="${pageContext.request.contextPath}/PublierProduit?idProduit=<%=produit.getProduitId()%>" class="btn btn-inverse pull-left" type="button">Publier</a>
                <a href="${pageContext.request.contextPath}/Produits" class="pull-right"><i class="icon-arrow-left"></i>Revenir à la liste des produits</a>
            </div>
        </div>

    </div><!-- End gallery-single-->

</div><!-- End container row -->
