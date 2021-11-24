const el0 = document.querySelector("#div_no0");
const el1 = document.querySelector("#div_no1");
const el2 = document.querySelector("#div_no2");
const el3 = document.querySelector("#div_no3");
const el4 = document.querySelector("#div_no4");
const el5 = document.querySelector("#div_no5");

let isResizing = false;

el.addEventListener('mousedown', mousedown);

const resizers1 = document.querySelectorAll(".resizer");
let currentResizer;


let isResizing2 = false

el2.addEventListener('mousedown', mousedown);

const resizers2 = document.querySelectorAll(".resizer");
let currentResizer2;

const div = document.querySelectorAll("div");
let e0=document.getElementById("div_no0");
let e1=document.getElementById("div_no1");
let e2=document.getElementById("div_no2");
let e3=document.getElementById("div_no3");
let e4=document.getElementById("div_no4");
let e5=document.getElementById("div_no5");

for(let resizer of resizers1){
    resizer.addEventListener('mousedown', mousedown);
    console.log("1번"); 
    function mousedown(e){
        currentResizer1 = e.target;
        isResizing = true;

        let prevY = e.clientY;

        window.addEventListener('mousemove', mousemove);
        window.addEventListener('mouseup', mouseup);

        function mousemove(e){
            const rect0 = el0.getBoundingClientRect();
            const rect1 = el1.getBoundingClientRect();
           
        
        if(currentResizer2.classList.contains('nw2')) {
                el0.style.height = rect1.height - (prevY - e.clientY) + "px";
                el1.style.height = rect2.height + (prevY - e.clientY) + "px";
                el1.style.top = rect2.top + (prevY - e.clientY) + "px";

            }
            
            prevY = e.clientY;
        }
        function mouseup(){
            window.removeEventListener('mousemove', mousemove);
            window.removeEventListener('mouseup', mouseup);
            
            e0.clientHeight;
            e1.clientHeight;
            isResizing = false;
        }
    }
}

for(let resizer of resizers2){
    resizer.addEventListener('mousedown', mousedown);
    console.log("2번"); 
    function mousedown(e){
        currentResizer2 = e.target;
        isResizing = true;

        let prevY = e.clientY;

        window.addEventListener('mousemove', mousemove);
        window.addEventListener('mouseup', mouseup);

        function mousemove(e){
            const rect1 = el1.getBoundingClientRect();
            const rect2 = el2.getBoundingClientRect();
           
        
        if(currentResizer2.classList.contains('nw2')) {
                el.style.height = rect1.height - (prevY - e.clientY) + "px";
                el2.style.height = rect2.height + (prevY - e.clientY) + "px";
                el2.style.top = rect2.top + (prevY - e.clientY) + "px";

            }
            
            prevY = e.clientY;
        }
        function mouseup(){
            window.removeEventListener('mousemove', mousemove);
            window.removeEventListener('mouseup', mouseup);
            
            e1.clientHeight;
            e2.clientHeight;
            isResizing = false;
        }
    }
}

let isResizing3 = false

el3.addEventListener('mousedown', mousedown);

const resizers3 = document.querySelectorAll(".resizer");
let currentResizer3;

for(let resizer of resizers3){
    resizer.addEventListener('mousedown', mousedown);
    console.log("3번");

    function mousedown(e){
        currentResizer3 = e.target;
        isResizing = true;

        let prevY = e.clientY;

        window.addEventListener('mousemove', mousemove);
        window.addEventListener('mouseup', mouseup);

        function mousemove(e){
            const rect2 = el2.getBoundingClientRect();
            const rect3 = el3.getBoundingClientRect();

            if(currentResizer3.classList.contains('nw3')) {
                el2.style.height = rect2.height - (prevY - e.clientY) + "px";
                el3.style.height = rect3.height + (prevY - e.clientY) + "px";
                el3.style.top = rect3.top + (prevY - e.clientY) + "px";
            }
            
            prevY = e.clientY;
        }
        function mouseup(){
            window.removeEventListener('mousemove', mousemove);
            window.removeEventListener('mouseup', mouseup);
            
            e2.clientHeight;
            e3.clientHeight;
            isResizing = false;
        }
    }
}

let isResizing4 = false

el4.addEventListener('mousedown', mousedown);

const resizers4 = document.querySelectorAll(".resizer");
let currentResizer4;

for(let resizer of resizers4){
    resizer.addEventListener('mousedown', mousedown);
    console.log("4번");

    function mousedown(e){
        currentResizer4 = e.target;
        isResizing = true;

        let prevY = e.clientY;

        window.addEventListener('mousemove', mousemove);
        window.addEventListener('mouseup', mouseup);

        function mousemove(e){
            const rect3 = el3.getBoundingClientRect();
            const rect4 = el4.getBoundingClientRect();

            if(currentResizer4.classList.contains('nw4')) {
                el3.style.height = rect3.height - (prevY - e.clientY) + "px";
                el4.style.height = rect4.height + (prevY - e.clientY) + "px";
                el4.style.top = rect4.top + (prevY - e.clientY) + "px";
            }
            
            prevY = e.clientY;
        }
        function mouseup(){
            window.removeEventListener('mousemove', mousemove);
            window.removeEventListener('mouseup', mouseup);
            e3.clientHeight;
            e4.clientHeight;
            isResizing = false;
        }
    }
}

let isResizing5 = false

el5.addEventListener('mousedown', mousedown);

const resizers5 = document.querySelectorAll(".resizer");
let currentResizer5;

for(let resizer of resizers5){
    resizer.addEventListener('mousedown', mousedown);
    console.log("5번");

    function mousedown(e){
        currentResizer5 = e.target;
        isResizing = true;

        let prevY = e.clientY;

        window.addEventListener('mousemove', mousemove);
        window.addEventListener('mouseup', mouseup);
        
        function mousemove(e){
            const rect4 = el4.getBoundingClientRect();
            const rect5 = el5.getBoundingClientRect();
            
            if(currentResizer5.classList.contains('nw5')) {
                el4.style.height = rect4.height - (prevY - e.clientY) + "px";
                el5.style.height = rect5.height + (prevY - e.clientY) + "px";
                el5.style.top = rect5.top + (prevY - e.clientY) + "px";
            }
            
            prevY = e.clientY;
        }
        function mouseup(){
            window.removeEventListener('mousemove', mousemove);
            window.removeEventListener('mouseup', mouseup);
            e4.clientHeight;
            e5.clientHeight;
            isResizing = false;
        }
    }
}