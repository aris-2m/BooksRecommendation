
var bouttons=document.getElementsByClassName('voirplus');
for (var i = 0; i < bouttons.length; i++) {
  bouttons[i].addEventListener('click',voirplus);
}

function voirplus(e) {
  event.preventDefault();
  var id=this.id;
  var xhr=new XMLHttpRequest();


  xhr.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      if (this.response) {
        //alert(this.response)
        document.write(this.response);
      }
      else {
        alert("Erreur!");
      }
      console.log(this.response);
    }

  }



  xhr.open("POST","VoirPlus.jsp",true);

  xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhr.send("nom=voirplus&id_boutton="+id);
  // xhr.send();

  return false;
}
