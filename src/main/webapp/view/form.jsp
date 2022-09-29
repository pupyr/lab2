<%@ page import="model.infoBean" %>
<%@ page import="model.Beans" %>
<%@ page %><%--
  Created by IntelliJ IDEA.
  User: Олег
  Date: 27.09.2022
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>lab1</title>
    <link rel="stylesheet" type="text/css" href="stylec.css">
</head>
<header>
    Болдов Олег Евгеньевич p32301 var330300
</header>
<body onload="f()">
<img id="myImgId" src="view/graph.png" onmouseenter="
    onclick=(e)=>{
    clickLoader((e.x-101)/65,(-e.y+115)/64)
    }" >

<div class="mid" id="xPanel">
    <label style="margin-right: 10px" id="x">X</label>
    <label>
        -3
        <input class="button checkbox" type="checkbox" name="-3">
    </label>
    <label>
        -2
        <input class="button checkbox" type="checkbox" name="-2">
    </label>
    <label>
        -1
        <input class="button checkbox" type="checkbox" name="-1">
    </label>
    <label>
        0
        <input class="button checkbox" type="checkbox" name="0">
    </label>
    <label>
        1
        <input class="button checkbox" type="checkbox" name="1">
    </label>
    <label>
        2
        <input class="button checkbox" type="checkbox" name="2">
    </label>
    <label>
        3
        <input class="button checkbox" type="checkbox" name="3">
    </label>
    <label>
        4
        <input class="button checkbox" type="checkbox" name="4">
    </label>
    <label>
        5
        <input class="button checkbox" type="checkbox" name="5">
    </label>
</div>
<div class="mid" id="yPanel">
    <label id="yT">Y</label>
    <label>
        <input type="text" id="y" placeholder="(-5,...,3)">
    </label>
</div>
<div class="mid" id="rPanel">
    <label style="margin-right: 10px" id="R">R</label>
    <label>
        1
        <input class="button radio" type="radio" name="R" value="1">
    </label>
    <label>
        2
        <input class="button radio" type="radio" name="R" value="2">
    </label>
    <label>
        3
        <input class="button radio" type="radio" name="R" value="3">
    </label>
    <label>
        4
        <input class="button radio" type="radio" name="R" value="4">
    </label>
    <label>
        5
        <input class="button radio" type="radio" name="R" value="5">
    </label>
</div>
<script src="view/check.js"></script>
<p class="text333">
    <input class="button" onclick="handleClick()" id="button" type="submit" value="Отправить">
</p>

<%Beans beans=Beans.getInstance();%>
<%="<table border='1'>"%>
<%="    <tr>\n" +
        "        <td> x </td>\n" +
        "        <td> y </td>\n" +
        "        <td> R </td>\n" +
        "        <td> successful </td>\n" +
        "    </tr>"%>
<%for (infoBean infoBean: beans.getBeans()) {%>
<%="<tr>"%>
<% int x= infoBean.getX();
    float y= infoBean.getY();
    int R= infoBean.getR();
    boolean successful=((0<=x&&x<=R && 0>=y&&y>=-R)||(2*(-x-y)<=R&&x<=0&&y<=0)||(x*x+y*y<=R*R&&x<=0&&y>=0));%>
<%="<td>" +x+ "</td>"%>
<%="<td>"+y+"</td>"%>
<%="<td>"+R+"</td>"%>
<%String result= String.valueOf(successful); %>
<% if(!(x==-3||x==-2||x==-1||x==0||x==1||x==2||x==3||x==4||x==5)
        ||(y<=-5||y>=3)
        ||!(R==1||R==2||R==3||R==4||R==5))result="err";%>
<%="<td>"+result+"</td>"%>
<%="</tr>"%>
<%}%>
<%="</table>"%>
<br/>
<input onclick="
function f(){
    if(!points){
    let selector = document.querySelectorAll('td')
    for (let i = 4; i < selector.length; i += 4) {
        let x=selector.item(i).textContent;
        let y=selector.item(i+1).textContent;
        let R=selector.item(i+2).textContent;
        paintCirc((x/R*65),(y/R*65))
        }
    }else{
        let selector = document.querySelectorAll('canvas')
        selector.forEach(s=>s.remove())
    }
    points= !points
    }
" type="submit" value="точки">
</body>
</html>