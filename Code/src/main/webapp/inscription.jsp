<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="fr" dir="ltr">
  <head>
    <link rel="stylesheet" href="css/stylelogin.css">
    <link rel="stylesheet" href="css/styleauth.css">
    <meta charset="utf-8">
    <title>MX MIXMATCH</title>
  </head>
  <body>

          <div class="sidenav">
             <div class="login-main-text">
                <h2>MX MIXMATCH</h2>
                <p>Connectez-vous depuis cette page.</p>
             </div>
          </div>

          <div class="main">
             <div class="col-md-6 col-sm-12">
               <section id="sectionAuth">

                 <form  action="SignUp" method="post">

                   <div id="titrecon">INSCRIPTION </div>

                   <div class="elmtform">
                     <label class="titres">Nom:</label><input class="zones" type="text" name="nom" id="nom" value="" placeholder="Entrez votre nom..." required>
                   </div>
                   <div class="elmtform">
                     <label class="titres">Prenom:</label><input id="prenom" class="zones" type="text" name="prenom" value="" placeholder="Entrez votre prénom..." required>
                   </div>
                   <div class="elmtform">
                     <label class="titres">Sexe:</label>
                     <div class="zones" id="zoneradio">
                       <div class="intradio">
                         <input checked type="radio" name="sexe" value="M" ><label for="Male">Male</label>
                       </div>
                       <div class="">
                         <input type="radio" name="sexe" value="F" ><label for="Female">Female</label>
                       </div>

                     </div>

                   </div>
                   <%
                   int k;
                   for(k=1;k<=3;k++){
                	%>
                	<div class="elmtform">
                     <label class="titres">Préférence<%=" "+k+":" %> </label>

                     <select class="zones" name="preferences<%=k%>" size="1" class="zoneselection" >
                     
                     <%
                     //multiple="multiple"
                     ArrayList<String> Img_Liste3=(ArrayList)request.getAttribute("Cat_List");
                     
                     int i;
                     for(i=0;i<Img_Liste3.size();i++){
                     %>      
                         <option value="<% out.print(Img_Liste3.get(i));%>"><% out.print(Img_Liste3.get(i));%></option>              
                     <%
                     }
                     %>
                     </select>
                   </div>
                	<%
                   }
                   %>
                   
                   <div class="elmtform">
                     <label class="titres">Email:</label><input  class="zones" type="email" name="email" value="" placeholder="Entrez votre email..." required>
                   </div>
                   <div class="elmtform">
                     <label class="titres">Adresse:</label><input  class="zones" type="text" name="adresse" value="" placeholder="Entrez votre ville..." required>
                   </div>
                   <div class="elmtform">
                     <label class="titres">Birthday:</label><input  class="zones" type="date" name="birthday" value="" placeholder="Entrez votre date d'anniversaire..." required>
                   </div>
                   <div class="elmtform">
                     <label class="titres">Password:</label><input class="zones"  type="password" name="password" value="" placeholder="Entrez votre mdp..." required>
                   </div>
                   <div class="elmtform2">
                     <input class="zones"  type="checkbox" id="mentions" name="mentions" value="Accepté"  required><label for="mentions" id="accepte">J'accepte les mentions légales d'utilisation</label>
                   </div>
                   <div  class="elmtform" id="submit">

                     <button id="annuler" class="voulezvousvraiment" type="button" name="button"><a href="/Book_WebApp/BooksRecommender" >ANNULER</a></button>
                     <button type="submit" id="envoyer" name="button">ENVOYER</button>
                   </div>

                   <div class="elmtform" id="messagesubmit">
                     <p id="error" hidden>Please fill out all fields.</p>
                     <p id="thanks" hidden>Your data has been received. Thanks!</p>
                   </div>
                   <a href="/Book_WebApp/SignIn" class="elmtform" id="switchform">
                     Avez-vous déjà un compte?
                   </a>
                 </form>
               </section>
             </div>
          </div>

     <script type="text/javascript" src="js/Js_Connect.js"></script>
  </body>
</html>
    