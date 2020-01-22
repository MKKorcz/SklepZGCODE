<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Wishlist" class="javastart.SklepZG.model.Wishlist" scope="request"></jsp:useBean>
<%
    String klient = session.getAttribute("loggedUser").toString();
    int productID = Integer.parseInt(request.getParameter("productID"));
    if(request.getParameter("action").equals("add"))
        Wishlist.add(klient, productID);
    else if(request.getParameter("action").equals("remove"))
        Wishlist.remove(klient, productID);
%>