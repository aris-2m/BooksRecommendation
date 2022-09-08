<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.util.ArrayList" import="pack_sevlet.MongoDBApp" 
    import="org.bson.Document" pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/stylelogin.css">
    <link rel="stylesheet" href="css/styleauth.css">
    <meta charset="utf-8">
    <title>MX MIXMATCH</title>
</head>
<body>
<%

String id=(String) request.getParameter("id_boutton");

MongoDBApp M2=new MongoDBApp("TP1");
String query;
query="{_id:"+id+""+"}" ;

ArrayList<Document> doc=M2.FindWithFilter("books200", query);

Document actu_doc=doc.get(0);

int actu_id=(int) actu_doc.get("_id");
String actu_title=(String) actu_doc.get("title");
String actu_IMG=(String) actu_doc.get("thumbnailUrl");
String actu_description=(String) actu_doc.get("shortDescription");
ArrayList<String> actu_authors=(ArrayList<String>) actu_doc.get("authors");
ArrayList<String> actu_categories=(ArrayList<String>) actu_doc.get("categories");

Document actu_date=(Document) actu_doc.get("publishedDate");
String actu_date_=(String) actu_date.get("date");

%>
<div class="sidenav">
             <div class="login-main-text">
                <!-- <h2>MX MIXMATCH</h2> -->
                <center><img src="<%=actu_IMG%>" style="width:150px;height:188px;"alt=""></center><br>
                <center>TITRE: <%=actu_title %> </center><br>
                <center>DATE: <%=actu_date_ %> </center><br>
                <center>AUTEURS: <%=actu_authors %> </center><br><br>
                <% if(actu_description!=null){ %>
                <center class="resume"><%=actu_description %> </center>
                <%}%>
             </div>
             
          </div>

          <div class="main">
          <% 
          Document docu=null;
          try{
          	docu=(Document)session.getAttribute("Utilisateur");
          }
          finally{
          }
          
          if(docu==null){%>
          <div class="col-md-6 col-sm-12">
               <section id="sectionAuth">

                 <form  action="SignIn" method="post">

                   <div id="titrecon">CONNEXION </div>

                   <div class="elmtform test">

                   </div>
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
          <%
          }else{
        	  Document user=(Document)session.getAttribute("Utilisateur");
        	  %>
        	  <div class="col-md-6 col-sm-12">
               <section id="sectionAuth">

                 <form  action="Avis" method="post">

                   <div id="titrecon">AVIS </div>                  
                   
                   <div class="elmtform">
                     <label class="titres">Note:</label><input  class="zones" type="number" name="note" value="" size="1" min="1" max="5" placeholder="Donner une note de 1 à 5..." required>
                   </div>
                   
                   <input class="zones" type="text" name="Id_User" value="<%=user.get("_id") %>" hidden>
                   <input class="zones" type="text" name="Id_Product" value="<%=actu_id%>" hidden>
                   
                   <div  class="elmtform" id="submit">

                     <button id="annuler" class="voulezvousvraiment" type="button" name="button"><a href="/Book_WebApp/BooksRecommender">ANNULER</a></button>

                     <button type="submit" id="envoyer_avis" name="button">ENVOYER</button>
                   </div>

                   <div class="elmtform" id="messagesubmit">
                     <p id="error" hidden>Please fill out all fields.</p>
                     <p id="thanks" hidden>Your data has been received. Thanks!</p>
                   </div>
                   
                 </form>
               </section>
             </div>
        	  <%
          }
          %>
             
             
          </div>
          
     <script type="text/javascript" src="js/Js_Connect.js"></script>
  </body>
</html>
