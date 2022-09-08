
function redirect3(){
    
    //document.location.href="http://localhost:8080/Book_WebApp/BooksRecommender";
    window.location.replace("/Book_WebApp/BooksRecommender");
    
  }
 function redirect4(){
    //alert("oui");
    document.location.href="/Book_WebApp/BooksRecommender";
  }
 function redirect5(){
    //alert("oui");
    document.location.href="/Book_WebApp/Avis";
  }

if(document.getElementById("annuler")){
  var annuler=document.getElementById("annuler");
  annuler.addEventListener("click",redirect3);
}

 if(document.getElementById("envoyer_avis")){
  var close=document.getElementById("envoyer_avis");
  close.addEventListener("click",redirect5);
  }

  if(document.getElementById("switchform")){
  var switchform=document.getElementById("switchform");
  switchform.addEventListener("click",redirect4);
  }