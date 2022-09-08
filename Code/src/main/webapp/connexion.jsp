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

                 <form  action="SignIn" method="post">

                   <div id="titrecon">CONNEXION </div>

                   <div class="elmtform">
                     <label class="titres">Email:</label><input  class="zones" type="email" name="email" value="" placeholder="Entrez votre email..." required>
                   </div>
                   <div class="elmtform">
                     <label class="titres">Password:</label><input class="zones"  type="password" name="password" value="" placeholder="Entrez votre mdp..." required>
                   </div>
                   
                   
                   <div  class="elmtform" id="submit">

                     <button id="annuler" class="voulezvousvraiment" type="button" name="button"><a href="/Book_WebApp/BooksRecommender">ANNULER</a></button>

                     <button type="submit" id="envoyer" name="button">ENVOYER</button>
                   </div>

                   <div class="elmtform" id="messagesubmit">
                     <p id="error" hidden>Please fill out all fields.</p>
                     <p id="thanks" hidden>Your data has been received. Thanks!</p>
                   </div>
                   <a href="/Book_WebApp/SignUp" class="elmtform" id="switchform">
                     Vous n'avez pas de compte?
                   </a>
                 </form>
               </section>
             </div>
          </div>

     <script type="text/javascript" src="js/Js_Connect.js"></script>
  </body>
</html>
    