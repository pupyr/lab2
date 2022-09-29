let Url="http://localhost:8080/lab/table"
let warning=""
let x=document.querySelectorAll('.checkbox')
let r=document.querySelectorAll('.radio')
let y=document.querySelector('#y')
const req=new XMLHttpRequest()
let x0
let y0
let R0
let B=false
let points=false

function paintCirc(x,y){
    let img = document.getElementById('myImgId');
    let canvas = document.createElement('canvas');
    canvas.style.pointerEvents='none';
    canvas.style.position = 'absolute';
    canvas.style.left = img.offsetLeft + 'px';
    canvas.style.top = img.offsetTop + 'px';
    let ctx = canvas.getContext('2d');
    ctx.beginPath();
    ctx.lineWidth = 2;
    ctx.strokeStyle="black"
    ctx.fillStyle = 'green';
    ctx.arc(92 + x, 88 - y, 7, 0, 2 * Math.PI, false);
    ctx.stroke();
    ctx.fill();
    document.body.append(canvas);
}

function handleClick() {
    checkX(x)
    checkY(y)
    checkR(r)
    if(B){
        alert(warning)
        B=false
    }
    else {
        connect(Url,null, null)
    }
    warning=""
}
function checkX(x){
    let i=0
    for (let x1 of x) {
        if(x1.checked){
            i++
            x0=x1
        }
    }
    if(i!==1){
        warning+='Выберите один Х \n'
        B=true
    }
}
function checkY(y){
    if( y.value===''|| isNaN(Number(y.value)) || y.value>3 || y.value<-5) {
        warning+='Введите y={-5,...,3}\n'
        B=true
    } else y0=y
}

function checkR(r){
    let b=false;
    for (let r1 of r){
        if(r1.checked){
            b=true
            R0=r1
        }
    }
    if(!b){
        warning+='Выберите R\n'
        B=true
    }
}

function clickLoader(x,y){
    warning=''
    B=false
    checkR(r)
    if(!B)connect(Url, x, y)
    else alert(warning)
}

function connect(Url, x, y) {
    if (x == null) x = x0.name
    else {
        if (x >= 0) x = Math.ceil(x * R0.value)
        else x = Math.floor(x * R0.value)
    }
    if (y == null) y = y0.value
    else y *= R0.value
    let url = Url + "?x=" + x + "&y=" + y + "&r=" + R0.value
    req.open("GET", url)
    req.send()
    req.onload = () => {
        document.write(req.response)
        document.getElementById('back').onclick = () => {
            location.reload()
        };
    }
    req.onerror = () => alert("Сервер недоступен");
}
