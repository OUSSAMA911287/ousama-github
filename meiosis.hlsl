<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Animation Meiosis - SVT</title>
<style>
body{
    background: linear-gradient(135deg,#000000 0%,#1a1a1a 100%);
    color:#f5f5f5;
    font-family: 'Georgia', serif;
    text-align:center;
    padding:20px;
}
h1{color:#ffd700;}
#cell{
  width:240px; height:240px; border:3px dashed #ffd700; border-radius:50%;
  margin:20px auto; position:relative; background:rgba(255,255,255,0.03); transition:0.6s;
}
.chr{
  width:14px; height:65px; border-radius:7px; position:absolute; transition:0.7s;
  cursor:pointer;
}
#a1{ left:60px; top:90px; background:#ff4d4d;}
#a2{ left:90px; top:90px; background:#4da6ff;}
#b1{ right:60px; top:90px; background:#ff4d4d;}
#b2{ right:90px; top:90px; background:#4da6ff;}
button{
  background:#ffd700; border:none; color:black; padding:10px 18px;
  font-weight:bold; border-radius:8px; cursor:pointer; margin:5px;
}
button:hover{transform:scale(1.1);}
.buttons{text-align:center;}
.popup{
  position:fixed; top:15px; right:15px; background:black; color:#ffd700;
  padding:15px 20px; border:2px solid #ffd700; border-radius:12px;
  font-size:1rem; max-width:260px; animation:fade 0.4s ease;
}
@keyframes fade{from{opacity:0;transform:translateY(10px);}to{opacity:1;transform:translateY(0);}}
</style>
</head>
<body>

<h1>La Méiose - Animation Interactive</h1>

<p id="step-title">Appuyez sur "Suivant"</p>

<div id="cell">
  <div class="chr" id="a1"></div>
  <div class="chr" id="a2"></div>
  <div class="chr" id="b1"></div>
  <div class="chr" id="b2"></div>
</div>

<div class="buttons">
  <button id="next">Suivant</button>
  <button id="reset">Recommencer</button>
</div>

<script>
let step = 0;
const titles = [
  "Interphase : duplication des chromosomes",
  "Prophase I : crossing-over génétique",
  "Métaphase I : alignement des homologues",
  "Anaphase I : séparation des chromosomes homologues",
  "Télophase II : 4 cellules haploïdes"
];
const chr = document.querySelectorAll('.chr');
const cell = document.getElementById('cell');
const next = document.getElementById('next');
const reset = document.getElementById('reset');
const title = document.getElementById('step-title');

chr.forEach(c => c.addEventListener("click", showInfo));

function showInfo(e){
  const info = document.createElement("div");
  info.className="popup";
  info.textContent = {
    a1:"Chromosome 1 (Rouge)",
    a2:"Chromosome 2 (Bleu)",
    b1:"Homologue (Rouge)",
    b2:"Homologue (Bleu)"
  }[e.target.id];
  document.body.appendChild(info);
  setTimeout(()=>info.remove(),2000);
}

next.addEventListener("click",()=>{ step++; runStep(); });
reset.addEventListener("click",()=>{ location.reload(); });

function runStep(){
  if(step>titles.length) return;
  title.textContent = titles[step-1];
  if(step===1){ chr.forEach(c=>{c.style.height="85px"; c.style.opacity="0.7";}); }
  if(step===2){ document.getElementById("a1").style.background="#4da6ff"; document.getElementById("b2").style.background="#ff4d4d"; chr.forEach(c=>{c.style.transform="rotate(30deg)"; c.style.opacity="1";}); }
  if(step===3){ document.getElementById("a1").style.top="40px"; document.getElementById("a2").style.top="40px"; document.getElementById("b1").style.top="40px"; document.getElementById("b2").style.top="40px"; }
  if(step===4){ cell.style.width="480px"; cell.style.height="160px"; cell.style.borderRadius="15px"; cell.style.borderStyle="solid"; document.getElementById("a1").style.left="100px"; document.getElementById("a2").style.left="130px"; document.getElementById("b1").style.left="300px"; document.getElementById("b2").style.left="330px";}
  if(step===5){
    cell.style.width="520px"; cell.style.height="260px"; cell.style.border="none"; cell.style.background="none";
    cell.innerHTML=`
      <div id="cellA" style="position:absolute;left:0;width:120px;height:120px;border:2px dashed #ffd700;border-radius:50%;"></div>
      <div id="cellB" style="position:absolute;right:0;width:120px;height:120px;border:2px dashed #ffd700;border-radius:50%;"></div>
      <div id="cellC" style="position:absolute;bottom:0;left:25%;width:120px;height:120px;border:2px dashed #ffd700;border-radius:50%;"></div>
      <div id="cellD" style="position:absolute;bottom:0;right:25%;width:120px;height:120px;border:2px dashed #ffd700;border-radius:50%;"></div>
      <div class='chr' style='--c:#4da6ff;left:20px;top:25px;height:50px;' ></div>
      <div class='chr' style='--c:#4da6ff;left:50px;top:25px;height:50px;' ></div>
      <div class='chr' style='--c:#ff4d4d;right:50px;top:25px;height:50px;' ></div>
      <div class='chr' style='--c:#ff4d4d;right:20px;top:25px;height:50px;' ></div>
      <div class='chr' style='--c:#4da6ff;left:28%;bottom:25px;height:50px;'></div>
      <div class='chr' style='--c:#ff4d4d;right:28%;bottom:25px;height:50px;'></div>`;
  }
}
</script>

</body>
</html>
