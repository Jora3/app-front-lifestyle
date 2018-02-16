<%@ page import="java.util.ArrayList" %>
<%@ page import="mapping.Domaine" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/02/2018
  Time: 06:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" >

<head>
    <meta charset="UTF-8">
    <title>Se connecter ou s'inscrire</title>
    <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


    <link rel="stylesheet" href="https://image-lifestyle.000webhostapp.com/css/style.css">


</head>

<body>

<div class="form">
    <div>

        <%
            String messageErreur = (String)session.getAttribute("messageErreur");
            if(messageErreur != null) {
        %>
        <h3 style="text-align: center;color: red;"><%= messageErreur %></h3>
        <%
                session.removeAttribute("messageErreur");
            }
        %>

    </div>

    <ul class="tab-group">
        <li class="tab active"><a href="#login">Se connecter</a></li>
        <li class="tab"><a href="#signup">S'inscrire</a></li>
    </ul>

    <div class="tab-content">

        <div id="login">
            <h1>Connectez-vous à votre compte</h1>

            <form action="${pageContext.request.contextPath}/Login" method="post">

                <div class="field-wrap">
                    <label for="email">
                        Adresse email<span class="req">*</span>
                    </label>
                    <input name="email" id="email" type="email"required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label for="password">
                        Mot de passe<span class="req">*</span>
                    </label>
                    <input name="password" id="password" type="password"required autocomplete="off"/>
                </div>

                <button type="submit" class="button button-block">Se connecter</button>

            </form>

        </div>

        <div id="signup">

            <h1>Inscrivez-vous gratuitement</h1>

            <form id="form_signin" action="${pageContext.request.contextPath}/Signin" method="post">

                <div class="field-wrap">
                    <label for="societe">
                        Société<span class="req">*</span>
                    </label>
                    <input name="societe" id="societe" type="text"required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label for="pays">
                        Pays<span class="req">*</span>
                    </label>
                    <select name="pays" id="pays" required autocomplete="off">
                        <option value=""></option>
                        <option value="H">Pays 1</option>
                        <option value="F">Pays 2</option>
                    </select>
                </div>

                <div class="field-wrap">
                    <label for="ville">
                        Ville<span class="req">*</span>
                    </label>
                    <select name="ville" id="ville" required autocomplete="off">
                        <option value=""></option>
                        <option value="H">Ville 1</option>
                        <option value="F">Ville 2</option>
                    </select>
                </div>

                <div class="field-wrap">
                    <label for="lieu">
                        Lieu
                    </label>
                    <input name="lieu" id="lieu" type="text" autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label for="email1">
                        Adresse email<span class="req">*</span>
                    </label>
                    <input name="email1" id="email1" type="email"required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label for="mobile">
                        Mobile
                    </label>
                    <input name="mobile" id="mobile" type="text" autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label for="domaine">
                        Domaine<span class="req">*</span>
                    </label>
                    <select name="domaine" id="domaine" required autocomplete="off">
                        <option value=""></option>
                        <%
                            ArrayList domaines = (ArrayList) session.getAttribute("domaines");
                            for(Object domaine : domaines) {
                        %>
                        <option value="<%= ((Domaine)domaine).getDomaineId() %>"><%= ((Domaine)domaine).getNomDomaine() %></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="field-wrap">
                    <label for="password1">
                        Mot de passe<span class="req">*</span>
                    </label>
                    <input name="password1" id="password1" type="password"required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label for="password2">
                        Confirmation du mot de passe<span class="req">*</span>
                    </label>
                    <input name="password2" id="password2" type="password"required autocomplete="off"/>
                </div>

                <button type="submit" class="button button-block">S'inscrire</button>

            </form>

        </div>

    </div><!-- tab-content -->

</div> <!-- /form -->
<script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
<script src='https://code.jquery.com/ui/1.12.1/jquery-ui.js'></script>
<script  src="https://image-lifestyle.000webhostapp.com/js/index.js"></script>
<script>
    function compteEntreprise() {
        $.ajax({
            url: "https://app-front-lifestyles.herokuapp.com/views/ajax-pages/signin-entreprise.jsp",
            type: "GET",
            dataType: "html",
            success: function (result) {
                $('#form_signin').empty();
                $('#form_signin').append(result);
                load_js();
            }
        });
    }

    function compteClient() {
        $.ajax({
            url: "https://app-front-lifestyles.herokuapp.com/views/ajax-pages/signin-client.jsp",
            type: "GET",
            dataType: "html",
            success: function (result) {
                $('#form_signin').empty();
                $('#form_signin').append(result);
                load_js();
            }
        });
    }

    function load_js() {
        var head= document.getElementsByTagName('head')[0];
        var script= document.createElement('script');
        script.type= 'text/javascript';
        script.src= 'https://image-lifestyle.000webhostapp.com/js/index.js?timestamp=' + new Date().getTime();
        head.appendChild(script);
    }
</script>
</body>
</html>
