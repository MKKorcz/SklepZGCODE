<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dataSource" class="javastart.SklepZG.model.DataSource" scope="request">
</jsp:useBean>
<jsp:setProperty name="dataSource" property="*" />
<%
    if(request.getParameter("register") != null) {
        dataSource.register();
        int x = dataSource.getResult();
        if(x == 1)
            response.sendRedirect("../login.jsp?registered");
        else if(x == 0)
            response.sendRedirect("../login.jsp?registerError");
    }
    else if(request.getParameter("log").equals("")) {
        dataSource.log();
        int x = dataSource.getResult();
        if(x == 1) {
            session.setAttribute("loggedUser", request.getParameter("login"));
            response.sendRedirect("../index.jsp?logged");
        }
        else if(x == 0)
            response.sendRedirect("../login.jsp?loginError");
    }
%>