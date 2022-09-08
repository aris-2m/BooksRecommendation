<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList"
    import="org.bson.Document" %>


<!DOCTYPE html>
<html lang="fr" dir="ltr">
  <head>
    <meta charset="utf-8" http-equiv="refresh" content="120">
    <meta http-equiv="refresh" content="200">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>MX MIXMATCH</title>
    <link rel="stylesheet" href="css/stylepage.css">
    <link rel="stylesheet" href="css/styleheader.css">
    <link rel="stylesheet" href="css/stylemainindex.css">
    
    
  </head>
  <body>
    <header>
      <div class="fine_entete">
        <span id="powered"><img src="icon/MX.png" alt=""> </span>

        <span id="daty"></span>
      </div>

      <dl id="navbar">

        <li class="li-nav" id="titre"> MX <span id="mma">MIXMATCH</span></li>
        <li class="li-nava"><img src="icon/Pages-icon.png" alt="" width="30px" height="30px"><span class="text-li" id="accueil">ACCUEIL</span></li>
        <%
        Document doc=null;
        try{
        	doc=(Document)session.getAttribute("Utilisateur");
        }
        finally{
        	
        }
        if(doc!=null){
        %>
        <li class="li-nava"><img src="icon/Apps-preferences-desktop-wallpaper-icon.png" alt="" width="30px" height="30px"><span class="text-li" id="pvous">POUR VOUS</span></li>
         <li class="li-nava"><img src="icon/user-icon2.png" alt="" width="30px" height="30px"><span class="text-li" id="close"><%="CLOSE "+doc.getString("prenom") %> </span></li>
        <%}else{%>
        <li class="li-nava"><img src="icon/user-icon2.png" alt="" width="30px" height="30px"><span class="text-li" id="log">CONNECT</span></li>
        <%
        }
        %>
      </dl>



    </header>
    <main>

      <section id="section2">
        <ul id="list-ul">
          <li id="li1"class="active-li"><a href="#vif1">TOUT</a></li>
          <li id="li2"><a href="#vif2">JAVA</a></li>
          <li id="li3"><a href="#vif3">BUSINESS</a></li>
          <li id="li4"><a href="#vif4">MICROSOFT</a></li>
          <li id="li5"><a href="#vif5">MOBILE</a></li>
          <li id="li6"><a href="#vif6">PYTHON</a></li>
          <li id="li7"><a href="#vif7">PERL</a></li>
          
        </ul>

        <div class="content">
          <div id="vif1"  class="didi">
          <%
          ArrayList<String> Img_Liste=(ArrayList)request.getAttribute("Img_List");
          ArrayList<String> Id_Liste=(ArrayList)request.getAttribute("Img_Id");

          int i;
          for(i=0;i<=20;i++){
        	  String im="images/0black.jpg";
        	  String nw=Img_Liste.get(i);
        	  
        	  if(nw!=null){
        		  im=nw;
        	  }
        	 %>
        	 <div class="cover">
              <center><img src="<%=im%>" style="width:150px;height:188px;"alt=""></center><br>
              <center class="voirplus" id="<% out.print(Id_Liste.get(i));%>">VOIR PLUS</center>
             </div>
        	 <%
          }
          %>

          </div>

          <div id="vif2"  class="didi inactive-content">
          <%
		  ArrayList<Document> actuel;
          Document actu_doc;
          int actu_id;
          String actu_img;
          
          actuel=(ArrayList)request.getAttribute("Java");

          for(i=0;i<actuel.size();i++){
        	  actu_doc=actuel.get(i);
        	  actu_id=(int) actu_doc.get("_id");
        	  actu_img=(String) actu_doc.get("thumbnailUrl");
        	 %>
        	 <div class="cover">
              <center><img  src="<%=actu_img%>" style="width:150px;height:188px;"alt=""></center><br>
              <center class="voirplus" id="<%=actu_id%>">VOIR PLUS</center>
             </div>
        	 <%
          }
          %>
          </div>
          
          <div id="vif3"  class="didi inactive-content">
          <%
         
          actuel=(ArrayList)request.getAttribute("Business");

          for(i=0;i<actuel.size();i++){
        	  actu_doc=actuel.get(i);
        	  actu_id=(int) actu_doc.get("_id");
        	  actu_img=(String) actu_doc.get("thumbnailUrl");
        	 %>
        	 <div class="cover">
              <center><img  src="<%=actu_img%>" style="width:150px;height:188px;"alt=""></center><br>
              <center class="voirplus" id="<%=actu_id%>">VOIR PLUS</center>
             </div>
        	 <%
          }
          %>
          </div>
          
          <div id="vif4"  class="didi inactive-content">
          <%
         
          actuel=(ArrayList)request.getAttribute("Microsoft");

          for(i=0;i<actuel.size();i++){
        	  actu_doc=actuel.get(i);
        	  actu_id=(int) actu_doc.get("_id");
        	  actu_img=(String) actu_doc.get("thumbnailUrl");
        	 %>
        	 <div class="cover">
              <center><img  src="<%=actu_img%>" style="width:150px;height:188px;"alt=""></center><br>
              <center class="voirplus" id="<%=actu_id%>">VOIR PLUS</center>
             </div>
        	 <%
          }
          %>
          </div>
          
          <div id="vif5"  class="didi inactive-content">
          <%
          
          actuel=(ArrayList)request.getAttribute("Mobile");

          for(i=0;i<actuel.size();i++){
        	  actu_doc=actuel.get(i);
        	  actu_id=(int) actu_doc.get("_id");
        	  actu_img=(String) actu_doc.get("thumbnailUrl");
        	 %>
        	 <div class="cover">
              <center><img  src="<%=actu_img%>" style="width:150px;height:188px;"alt=""></center><br>
              <center class="voirplus" id="<%=actu_id%>">VOIR PLUS</center>
             </div>
        	 <%
          }
          %>
          </div>
          
          <div id="vif6"  class="didi inactive-content">
          <%
          
          actuel=(ArrayList)request.getAttribute("Python");

          for(i=0;i<actuel.size();i++){
        	  actu_doc=actuel.get(i);
        	  actu_id=(int) actu_doc.get("_id");
        	  actu_img=(String) actu_doc.get("thumbnailUrl");
        	 %>
        	 <div class="cover">
              <center><img  src="<%=actu_img%>" style="width:150px;height:188px;"alt=""></center><br>
              <center class="voirplus" id="<%=actu_id%>">VOIR PLUS</center>
             </div>
        	 <%
          }
          %>
          </div>
          
          <div id="vif7"  class="didi inactive-content">
          <%
          
          actuel=(ArrayList)request.getAttribute("Perl");

          for(i=0;i<actuel.size();i++){
        	  actu_doc=actuel.get(i);
        	  actu_id=(int) actu_doc.get("_id");
        	  actu_img=(String) actu_doc.get("thumbnailUrl");
        	 %>
        	 <div class="cover">
              <center><img  src="<%=actu_img%>" style="width:150px;height:188px;"alt=""></center><br>
              <center class="voirplus" id="<%=actu_id%>">VOIR PLUS</center>
             </div>
        	 <%
          }
          %>
          </div>
          
          
        </div>
      </section>
      <section id="section3">
        <span>MX </span>
        <span>MIXMATCH</span>
      </section>
    </main>

    <script type="text/javascript" src="js/Js_Index.js"></script>
    <script type="text/javascript" src="js/JsVoirPlus.js"></script>
  </body>
</html>
