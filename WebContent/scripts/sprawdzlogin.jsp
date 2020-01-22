<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dataSource" class="javastart.SklepZG.model.DataSource" scope="request">
</jsp:useBean>
<jsp:setProperty name="dataSource" property="*" />
<%
    if (dataSource.userExists(request.getParameter("login"), "Login") == true){
        out.print("Podany login jest już zajęty!");
    }
    else if (dataSource.userExists(request.getParameter("email"), "Adres_email") == true){
        out.print("Podany adres e-mail jest już zajęty!");
    }
    else if (dataSource.userExists(request.getParameter("phone"), "Numer_telefonu") == true){
        out.print("Podany numer telefonu jest już zajęty!");
    }
    else
        out.print("");
%>