<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/02/2018
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("compte") == null)
        response.sendRedirect("/Login");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- head -->
<jsp:include page="head.jsp"></jsp:include>
<!-- head -->

<body class="home">
    <!-- Color Bars (above header)-->
    <div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>

    <!-- Container -->
    <div class="container">
        <!-- header -->
        <jsp:include page="header.jsp"></jsp:include>
        <!-- header -->

        <!-- contenu -->
        <%
            String contenu = request.getParameter("contenu");
            if(contenu != null) {
                contenu = "../" + contenu + ".jsp";
        %>
        <jsp:include page="<%= contenu %>"></jsp:include>
        <%
            }
        %>
        <!-- contenu -->

    </div>
    <!-- End Container -->

    <!-- footer -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- footer -->
</body>
</html>
