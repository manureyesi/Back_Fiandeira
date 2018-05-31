<%-- 
    Document   : cerrar_sesion
    Created on : 30-may-2018, 15:45:23
    Author     : manureyesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    if(session.getAttribute("usuario") == null){
        response.sendRedirect("index.jsp");
    }
    else{
        
        session.removeValue("usuario");
        response.sendRedirect("index.jsp");
    }

%>

