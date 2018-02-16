<%@ page import="java.util.ArrayList" %>
<%@ page import="mapping.Publication" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/02/2018
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Publication> publications = (ArrayList<Publication>) session.getAttribute("publications");
%>
<!-- Blog Content
================================================== -->
<div class="row">
    <!-- Blog Posts
    ================================================== -->
    <div class="span8 blog">

        <%
            for(Publication publication : publications) {
        %>
        <!-- Blog Post 1 -->
        <article class="clearfix">
            <a href="#"><img style="width: 300px; height: 300px;" src="https://image-lifestyle.000webhostapp.com/images/<%=publication.getBazar().getPhoto()%>.jpg" alt="Post Thumb" class="align-left"></a>
            <h4 class="title-bg"><a href="#"><%=publication.getBazar().getDescription()%></a></h4>
            <div class="post-summary-footer">
                <ul class="post-data-3">
                    <li><i class="icon-calendar"></i> <%=publication.getDate()%></li>
                    <li><i class="icon-comment"></i> <%=publication.getAdorer()%> adorent</li>
                    <li><i class="icon-comment"></i> <%=publication.getAimer()%> aiment</li>
                    <li><i class="icon-comment"></i> <%=publication.getDetester()%> détestent</li>
                    <li><i class="icon-comment"></i>  <%=publication.getPartager()%> ont partagé</li>
                    <li><i class="icon-comment"></i>  <%=publication.getSuggerer()%> ont suggéré</li>
                    <li><i class="icon-comment"></i> <a href="${pageContext.request.contextPath}/Commentaires?publicationId=<%=publication.getPublicationId()%>"> <%=publication.getNbCommentaire()%> commentaires</a></li>
                </ul>
            </div>
        </article>
        <%
            }
        %>
    </div>

</div>
