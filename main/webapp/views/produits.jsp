<%@ page import="java.util.ArrayList" %>
<%@ page import="mapping.Categorie" %>
<%@ page import="mapping.Type" %>
<%@ page import="mapping.Taille" %>
<%@ page import="mapping.Produit" %>
<%@ page import="utils.Utilitaire" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/02/2018
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Page Content
================================================== -->
<div class="row">

    <!-- Gallery Items
    ================================================== -->
    <div class="span12 gallery">

        <div class="row">
            <h4 class="title-bg"><a data-toggle="modal" href="#modalProduit">Ajouter un produit</a></h4>
        </div>

        <ul id="filterOptions" class="gallery-cats clearfix">
            <li class="active"><a href="#" class="all">Tous</a></li>
            <li><a href="#" class="illustration">Publiés</a></li>
            <li><a href="#" class="design">Ajoutés</a></li>
        </ul>

        <%
            if(session.getAttribute("messageErreur") != null) {
        %>
        <div class="row">
            <h4 style="text-align: center; color: red;"><%= ((String)session.getAttribute("messageErreur")) %></h4>
        </div>
        <%
                session.removeAttribute("messageErreur");
            }
        %>

        <div class="row clearfix">
            <ul class="gallery-post-grid holder">

                <%
                    ArrayList<Produit> produits = (ArrayList<Produit>)session.getAttribute("produits");
                    int fin = Utilitaire.getNbBoucles(produits, 3), tailleProduits = produits.size();
                    for(int i = 0, j = 0; i < fin; i++, j+=3) {
                %>

                    <%
                        if(j < tailleProduits) {
                    %>
                        <!-- Gallery Item 1 -->
                        <li  class="span4 gallery-item" data-id="id-1" data-type="illustration">
                                <span class="gallery-hover-3col hidden-phone hidden-tablet">
                                    <span class="gallery-icons">
                                        <a href="https://image-lifestyle.000webhostapp.com/images/<%=produits.get(j).getPhoto()%>.jpg" class="item-zoom-link lightbox" title="<%=produits.get(j).getNomProduit()%>" data-rel="prettyPhoto"></a>
                                        <a href="${pageContext.request.contextPath}/Produit?idProduit=<%=produits.get(j).getProduitId()%>" class="item-details-link"></a>
                                    </span>
                                </span>
                            <a href="#"><img style="width: 370px; height: 243px;" src="https://image-lifestyle.000webhostapp.com/images/<%=produits.get(j).getPhoto()%>.jpg" alt="Gallery"></a>
                            <span class="project-details"><a href="#"><%=produits.get(j).getNomProduit()%></a><%= produits.get(j).getDescription()%>.</span>
                        </li>
                    <%
                        }
                    %>

                    <%
                        if(j+1 < tailleProduits) {
                    %>
                        <!-- Gallery Item 1 -->
                        <li  class="span4 gallery-item" data-id="id-1" data-type="illustration">
                                <span class="gallery-hover-3col hidden-phone hidden-tablet">
                                    <span class="gallery-icons">
                                        <a href="https://image-lifestyle.000webhostapp.com/images/<%=produits.get(j+1).getPhoto()%>.jpg" class="item-zoom-link lightbox" title="<%=produits.get(j+1).getNomProduit()%>" data-rel="prettyPhoto"></a>
                                        <a href="${pageContext.request.contextPath}/Produit?idProduit=<%=produits.get(j+1).getProduitId()%>" class="item-details-link"></a>
                                    </span>
                                </span>
                            <a href="#"><img style="width: 370px; height: 243px;" src="https://image-lifestyle.000webhostapp.com/images/<%=produits.get(j+1).getPhoto()%>.jpg" alt="Gallery"></a>
                            <span class="project-details"><a href="#"><%=produits.get(j+1).getNomProduit()%></a><%= produits.get(j+1).getDescription()%>.</span>
                        </li>
                    <%
                        }
                    %>

                    <%
                        if(j+2 < tailleProduits) {
                    %>
                        <!-- Gallery Item 1 -->
                        <li  class="span4 gallery-item" data-id="id-1" data-type="illustration">
                                <span class="gallery-hover-3col hidden-phone hidden-tablet">
                                    <span class="gallery-icons">
                                        <a href="https://image-lifestyle.000webhostapp.com/images/<%=produits.get(j+2).getPhoto()%>.jpg" class="item-zoom-link lightbox" title="<%=produits.get(j+2).getNomProduit()%>" data-rel="prettyPhoto"></a>
                                        <a href="${pageContext.request.contextPath}/Produit?idProduit=<%=produits.get(j+2).getProduitId()%>" class="item-details-link"></a>
                                    </span>
                                </span>
                            <a href="#"><img style="width: 370px; height: 243px;" src="https://image-lifestyle.000webhostapp.com/images/<%=produits.get(j+2).getPhoto()%>.jpg" alt="Gallery"></a>
                            <span class="project-details"><a href="#"><%=produits.get(j+2).getNomProduit()%></a><%= produits.get(j+2).getDescription()%>.</span>
                        </li>
                    <%
                        }
                    %>

                <%
                    }
                %>

            </ul>
        </div>

    </div><!-- End gallery list-->

</div><!-- End container row -->

<div class="modal fade" id="modalProduit" role="dialog">
    <div class="modal-dialog">
        <style>
            input, select {
                width: 500px;
            }
        </style>

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> Ajouter un nouveau produit</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/Produits" method="post" enctype="multipart/form-data" role="form">
                    <div class="form-group">
                        <label for="nom"><span class="glyphicon glyphicon-user"></span> Nom</label>
                        <input name="nom" type="text" class="form-control" id="nom" placeholder="Enter le nom du produit">
                    </div>
                    <div class="form-group">
                        <label for="image"><span class="glyphicon glyphicon-eye-open"></span> Image</label>
                        <input name="image" type="file" id="image">
                    </div>
                    <div class="form-group">
                        <label for="categorie"><span class="glyphicon glyphicon-eye-open"></span> Catégorie</label>
                        <select name="categorie" id="categorie" class="form-control">
                            <option value="categorie">Choisissez une catégorie de produit</option>
                            <%
                                ArrayList<Categorie> categories = (ArrayList<Categorie>)session.getAttribute("categories");
                                for(Categorie categorie : categories) {
                            %>
                            <option value="<%=categorie.getCategorieId()%>"><%=categorie.getNomCategorie()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="sousCategorie"><span class="glyphicon glyphicon-eye-open"></span> Sous-catégorie</label>
                        <select disabled="disabled" name="sousCategorie" id="sousCategorie" class="form-control">
                            <option value="sousCategorie">Choisissez une sous-catégorie de produit</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="type"><span class="glyphicon glyphicon-eye-open"></span> Type</label>
                        <select name="type" id="type" class="form-control">
                            <option value="sousCategorie">Choisissez un type de produit</option>
                            <%
                                ArrayList<Type> types = (ArrayList<Type>)session.getAttribute("types");
                                for(Type type : types) {
                            %>
                            <option value="<%=type.getTypeId()%>"><%=type.getNomType()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="couleur"><span class="glyphicon glyphicon-eye-open"></span> Couleur</label>
                        <select name="couleur" id="couleur" class="form-control">
                            <option value="sousCategorie">Choisissez une couleur</option>
                            <option value="Noir">Noir</option>
                            <option value="Blanc">Blanc</option>
                            <option value="Rouge">Rouge</option>
                            <option value="Bleu">Bleu</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="taille"><span class="glyphicon glyphicon-eye-open"></span> Taille</label>
                        <select name="taille" id="taille" class="form-control">
                            <option value="sousCategorie">Choisissez une taille</option>
                            <%
                                ArrayList<Taille> tailles = (ArrayList<Taille>)session.getAttribute("tailles");
                                for(Taille taille : tailles) {
                            %>
                            <option value="<%=taille.getTailleId()%>"><%=taille.getValeurTaille()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="prix"><span class="glyphicon glyphicon-eye-open"></span> Prix</label>
                        <input name="prix" class="form-control" id="prix" type="number">
                    </div>

                    <button type="submit" class="btn btn-default btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Ajouter</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#categorie').change(function () {
        var categorieId = $('#categorie').find('option:selected').val();
        console.log(categorieId);
        $.ajax({
            url: "https://app-front-lifestyles.herokuapp.com/Ajax/SousCategories",
            //url: "http://localhost:8081/Ajax/SousCategories",
            type: "POST",
            data: "categorieId=" + categorieId,
            dataType: "json",
            success: function (result) {
                $('#sousCategorie').empty();
                var option = "<option value=\"sousCategorie\">Choisissez une sous-catégorie de produit</option>"
                $('#sousCategorie').append(option);
                for(i = 0; i < result.length; i++) {
                    option = "<option value='"+result[i].sousCategorieId+"'>"+result[i].nomSousCategorie+"</option>"
                    $('#sousCategorie').append(option);
                }
                $('#sousCategorie').removeAttr("disabled");
            }
        });
    });
</script>
