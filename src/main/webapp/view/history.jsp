<%--
  Created by IntelliJ IDEA.
  User: Олег
  Date: 28.09.2022
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.infoBean" %>
<%@ page import="model.Beans" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="bean" class="model.infoBean"/>
<jsp:setProperty name="bean" property="*"/>
<%Beans beans=Beans.getInstance();%>
<%beans.addBean(bean);%>
<%="<table border='1'>"%>
<%="    <tr>\n" +
        "        <td> x </td>\n" +
        "        <td> y </td>\n" +
        "        <td> R </td>\n" +
        "        <td> successful </td>\n" +
        "    </tr>"%>
<%for (infoBean infoBean: beans.getBeans()) {%>
        <%="<tr>"%>
        <% int x= infoBean.getX();%>
        <% float y= infoBean.getY();%>
        <% int R= infoBean.getR();%>
        <%="<td>" +x+ "</td>"%>
        <%="<td>"+y+"</td>"%>
        <%="<td>"+R+"</td>"%>
        <% boolean successful=((0<=x&&x<=R && 0>=y&&y>=-R)||(2*(-x-y)<=R&&x<=0&&y<=0)||(x*x+y*y<=R*R&&x<=0&&y>=0));%>
        <%String result= String.valueOf(successful); %>
        <% if(!(x==-3||x==-2||x==-1||x==0||x==1||x==2||x==3||x==4||x==5)||(y<=-5||y>=3)||!(R==1||R==2||R==3||R==4||R==5))result="err";%>
        <%="<td>"+result+"</td>"%>
        <%="</tr>"%>
<%}%>
<%="</table>"%>
<br>
<a href="/lab">назад</a>
</body>
</html>