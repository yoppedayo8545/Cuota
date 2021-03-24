// function dropsort() {
//   var browser = document.student[id];
//   console.log("発火")
//   location.href = browser
// }

window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("first_grade")

  pullDownButton.addEventListener('mouseover', function(){
    console.log("mouseover OK")
  })

  pullDownButton.addEventListener('mouseout', function(){
    console.log("mouseout OK")
  })

  pullDownButton.addEventListener('click', function() {
    console.log("click OK")
  })

})