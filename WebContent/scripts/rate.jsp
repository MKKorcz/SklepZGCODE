<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Rate" class="javastart.SklepZG.model.Rate" scope="request"></jsp:useBean>
<%
    String client = session.getAttribute("loggedUser").toString();
    int product = Integer.parseInt(request.getParameter("id"));
    int rate = Integer.parseInt(request.getParameter("rate"));
    out.print(Rate.rating(product, client, rate));
%>