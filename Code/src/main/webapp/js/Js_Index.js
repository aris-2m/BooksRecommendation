(function() {
  var d = new Date();
  var date = d.getDate()+' | '+(d.getMonth()+1)+' | '+d.getFullYear();
  var daty=document.getElementById('daty');
  daty.innerHTML=date;
})();
function redirect(){
    //alert("oui");
    document.location.href="/Book_WebApp/SignIn";
  }
 function redirect2(){
    //alert("oui");
    document.location.href="/Book_WebApp/CloseSession";
  }
 function redirect_accueil(){
    //alert("oui");
    document.location.href="/Book_WebApp/BooksRecommender";
  }
 function redirect_pvous(){
    //alert("oui");
    document.location.href="/Book_WebApp/PourVous";
  }


if(document.getElementById("log")){
  var log=document.getElementById("log");
  log.addEventListener("click",redirect);
}


if(document.getElementById("close")){
  var close=document.getElementById("close");
  close.addEventListener("click",redirect2);
  }

if(document.getElementById("accueil")){
  var close=document.getElementById("accueil");
  close.addEventListener("click",redirect_accueil);
  }
  
if(document.getElementById("pvous")){
  var close=document.getElementById("pvous");
  close.addEventListener("click",redirect_pvous);
  }
/*
try{
  var close=document.getElementById("close");
  close.addEventListener("click",redirect2);

}
finally{}
*/
function lumineux(ob, classtogglante,temps) {
  var timer=window.setInterval(function () {
    ob.classList.toggle(classtogglante);
  },temps);
  return timer;
}
var listetoggle={
  linav:"ok",
};

var as=document.getElementById("mma");
as=lumineux(as,"blanc",4000);


function afficher(e) {
  var target = e.target || e.srcElement;
  var target2=target.parentElement.lastElementChild;
  if (target2.nodeName!="LI") {
  target2.style.display = 'inline-flex';
    target2.style.animation = 'ouvert 1.5s';
  }
  while (target.nodeName!="LI") {
    target=target.parentElement;
  }
  target.style.padding="0 10px";

  asi=lumineux(target,"blanco",1000);
  listetoggle["linav"]=asi;

}
function retirer(e) {
  window.clearInterval(listetoggle["linav"]);
  var target = e.target || e.srcElement;
  var target2=target.parentElement.lastElementChild;
  if (target2.nodeName!="LI") {
    target2.style.display = 'none';
  }
  while (target.nodeName!="LI") {
    target=target.parentElement;
  }
  target.style.padding="0 5px";
  target.classList.remove("blanco");
}

var lina=document.getElementsByClassName("li-nava");
for (i = 0; i < lina.length; i++) {
  lina[i].addEventListener('mouseover', afficher);
  lina[i].addEventListener('mouseout', retirer);
}


var loca='http://localhost/Repository/BX/';
var liactive=document.querySelectorAll("#section2 ul li a");

for (var i = 0; i < liactive.length; i++) {
  liactive[i].addEventListener("click",active);
}
function active(e) {
  target=this;
  while (target.nodeName!="LI") {
    target=target.parentElement;
  }
  
  var autre=document.querySelectorAll('section ul li');
  for (var i = 0; i < autre.length; i++) {
    if (autre[i].id!=target.id && autre[i].classList.contains("active-li")) {
      autre[i].classList.remove("active-li");
    }
  }
  target.classList.add("active-li");


  var lien=this.hash;
  // lien=lien.replace(loca, '');
  var act=document.querySelector(lien);
  var autres=document.getElementsByClassName('didi');

  for (var i = 0; i < autres.length; i++) {
    if (autres[i].id!=act.id) {
      autres[i].classList.add("inactive-content");
    }
  }
  act.classList.remove("inactive-content");

  e.preventDefault();


}
