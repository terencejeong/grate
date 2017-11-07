var img = document.getElementById("img");
var wrap = document.getElementById("wrap");
var overlay = document.getElementById("overlay");

function come(){
 wrap.className = "wrap";
   overlay.className = "overlay";
 overlay.className += " fadeIn";
 wrap.className += " transistion-come";
 document.body.style.overflowX = "hidden";
 img.style.zIndex="0";
 img.style.zIndex="-1";
}

function go(){
  wrap.className = "wrap";
  wrap.className += " transistion-go";
  overlay.className += " fadeOut";
  document.body.style.overflowX = "auto";
  img.style.zIndex="0";
}

img.addEventListener("click", come, false);
wrap.addEventListener("click", go, false);
