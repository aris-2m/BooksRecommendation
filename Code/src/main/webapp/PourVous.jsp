<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList"
    import="org.bson.Document" import="java.lang.Math" %>


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
          <li id="li1"class="active-li"><a href="#vif1">RECOMMENDATIONS</a></li>          
        </ul>

          </div>

          <div id="vif1"  class="didi">
          <%
		  ArrayList<Document> actuel;
          Document actu_doc;
          int actu_id;
          String actu_img;
          int i;
          Double r;
          
          actuel=(ArrayList)request.getAttribute("P1");

          for(i=0;i<7;i++){
        	  try{
        		  r=Math.random() * ( actuel.size() - 1 );
            	  
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
        	  catch(java.lang.IndexOutOfBoundsException a){
        		  
        	  }
        	  
          }
          
          actuel=(ArrayList)request.getAttribute("P2");
          
		  for(i=0;i<2;i++){
			  try{
				  r=Math.random() * ( actuel.size() - 1 );
	        	  
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
			  catch(java.lang.IndexOutOfBoundsException a){
        		  
        	  }
        	  
        	  
          }
		  
		  actuel=(ArrayList)request.getAttribute("P3");
          
		  for(i=0;i<1;i++){
			  
			  try{
				  r=Math.random() * ( actuel.size() - 1 );
	        	  
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
			  catch(java.lang.IndexOutOfBoundsException a){
        		  
        	  }
        	  
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
