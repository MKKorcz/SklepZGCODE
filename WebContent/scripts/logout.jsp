<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    if(session.getAttribute("loggedUser") != null)
        session.invalidate();
    response.sendRedirect("../index.jsp");
%>