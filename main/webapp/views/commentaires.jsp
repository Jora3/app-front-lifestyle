<%@ page import="java.util.ArrayList" %>
<%@ page import="mapping.Commentaire" %>
<%@ page import="mapping.Publication" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15/02/2018
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Publication publication = (Publication) session.getAttribute("publication");
    ArrayList<Commentaire> commentaires = (ArrayList<Commentaire>)session.getAttribute("commentaires");
%>
<!-- Blog Content
================================================== -->
<div class="row"><!--Container row-->

    <!-- Blog Full Post
    ================================================== -->
    <div class="span8 blog">

        <!-- Blog Post 1 -->
        <article>
            <h3 class="title-bg"><a href="#"><%= publication.getBazar().getProduit().getNomProduit()%></a></h3>
            <div class="post-content">
                <a href="#"><img src="https://image-lifestyle.000webhostapp.com/images/<%=publication.getBazar().getPhoto()%>.jpg" alt="Post Thumb"></a>

                <div class="post-body">
                    <p class="well"><a href="#" rel="tooltip" title="<%=publication.getBazar().getProduit().getNomProduit()%>">Ce produit :</a> <%=publication.getBazar().getDescription()%> </p>
                </div>

                <div class="post-summary-footer">
                    <ul class="post-data">
                        <li><i class="icon-calendar"></i> <%=publication.getDate()%></li>
                        <li><i class="icon-comment"></i> <a href="#"><%=publication.getNbCommentaire()%> commentaires</a></li>
                    </ul>
                </div>
            </div>
        </article>

        <!-- Post Comments
        ================================================== -->
        <section class="comments">
            <h4 class="title-bg"><a name="comments"></a><%=publication.getNbCommentaire()%> commentaires</h4>
            <ul>
                <%
                    for (Commentaire commentaire : commentaires) {
                %>
                <li>
                    <span class="comment-name"><%=commentaire.getPersonneNom()%></span>
                    <span class="comment-date"><%=commentaire.getCommentaireDate()%></span>
                    <div class="comment-content"><<%=commentaire.getCommentaire()%>/div>
                </li>
                <%
                    }
                %>
            </ul>
        </section><!-- Close comments section-->

    </div><!--Close container row-->

</div>
