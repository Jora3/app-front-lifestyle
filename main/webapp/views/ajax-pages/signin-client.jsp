<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/02/2018
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top-row">
    <div class="field-wrap">
        <label for="nom">
            Nom<span class="req">*</span>
        </label>
        <input name="nom" id="nom" type="text" required autocomplete="off" />
    </div>

    <div class="field-wrap">
        <label for="prenom">
            Prénom<span class="req">*</span>
        </label>
        <input name="prenom" id="prenom" type="text"required autocomplete="off"/>
    </div>
</div>

<div class="field-wrap">
    <label for="dateDeNaissance">
        Date de naissance<span class="req">*</span>
    </label>
    <input name="dateDeNaissance" id="dateDeNaissance" type="text"required autocomplete="off"/>
</div>

<div class="field-wrap">
    <label for="sexe">
        Sexe<span class="req">*</span>
    </label>
    <select name="sexe" id="sexe" required autocomplete="off">
        <option value=""></option>
        <option value="H">Homme</option>
        <option value="F">Femme</option>
    </select>
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
        <option value="H">Pays 1</option>
        <option value="F">Pays 2</option>
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
