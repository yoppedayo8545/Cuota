window.addEventListener('load', function(){

const pullDownButton = document.getElementById("textforscb1")
console.log(pullDownButton)

function connect_text( text_id, ischecked ) {
  if( ischecked == true ) {
     document.getElementById(text_id).disabled = false;
  }
  else {
     document.getElementById(text_id).disabled = true;
  }
}

})