const stages = [
    {
        name: "Prophase I",
        rotation: "rotateY(0deg) rotateX(0deg)"
    },
    {
        name: "Métaphase I",
        rotation: "rotateY(90deg) rotateX(20deg)"
    },
    {
        name: "Anaphase I",
        rotation: "rotateY(180deg) rotateX(40deg)"
    },
    {
        name: "Télophase I",
        rotation: "rotateY(270deg) rotateX(60deg)"
    }
];

let currentStage = 0;

const cell = document.getElementById("cell");
const stageLabel = document.getElementById("stage-label");
const prevBtn = document.getElementById("prev");
const nextBtn = document.getElementById("next");

function showStage(index) {
    if(index < 0 || index >= stages.length) return;
    currentStage = index;
    const stage = stages[currentStage];
    stageLabel.textContent = stage.name;
    cell.style.transform = stage.rotation;
}

// أزرار الانتقال بين المراحل
prevBtn.addEventListener("click", () => showStage(currentStage - 1));
nextBtn.addEventListener("click", () => showStage(currentStage + 1));

// عرض المرحلة الأولى عند تحميل الصفحة
showStage(0);
