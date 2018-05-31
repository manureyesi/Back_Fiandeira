<%-- 
    Document   : lobby
    Created on : 30-may-2018, 13:54:02
    Author     : 6001111
--%>

<%@page import="java.sql.ResultSet"%>
<%
    
    clases.usuario user = new clases.usuario();
    
    if(session.getAttribute("usuario") == null){
        response.sendRedirect("index.jsp");
    }
    else{
        
        user = (clases.usuario)session.getAttribute("usuario");
        
    }
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Back Fiandeira - Home</title>
        
        <link rel="stylesheet" href="css/home_style.css" type="text/css"/>
        
    </head>
    <body>
        
        
        <header>
            <% 
            if(user.isAdmin()){
            %>

                <ul class="iz">
                    <li><a href="home.jsp?Productos=Productos">Productos</a></li>
                    <li><a href="#">News</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">About</a></li>
                </ul>


            <%    
            } 
            %>
            
            <ul class="de">
                <li><span class="nombre"><% out.print(user.getNombre()+" "+user.getApellidos()); %></span></li>
                <li><a href="cerrar_sesion.jsp">Cerrar Sesion</a></li>
            </ul>
            
        </header>
                
        <div>
            
            <%
                
                String get = request.getParameter("Productos");
                
                if(request.getParameter("Productos") == null){
                
                }
                else if(get.equals("Productos")){
                    
                    db.consultas con = new db.consultas();
                    
                    ResultSet rs = con.selectDB("productos", "1");

                %>
                    
                <table sumary="Productos">
                    <tr>
                        <td>Codigo</td>
                        <td>Nombre</td>
                        <td>Descripcion</td>
                        <td>Precio Sin IVA</td>
                        <td>IVA</td>
                        <td>Precio Con IVA</td>
                    </tr>
                    
                    <%while(rs.next()){
                        
                        clases.productos pro = new clases.productos(rs.getString("cod"), rs.getString("nombre"), rs.getString("descripcion"), rs.getDouble("precioSin"));
                        
                        out.print("<tr>"
                                +"<td>"+pro.getCodigo()+"</td>"
                                +"<td>"+pro.getNombre()+"</td>"
                                +"<td>"+pro.getDescripcion()+"</td>"
                                +"<td>"+pro.getPrecioSin()+"</td>"
                                +"<td>"+pro.getIVA()+"</td>"
                                +"<td>"+pro.getPrecioIVA()+"</td>"
                                + "</tr>");
                    
                    }%>
                    
                </table>
                    
                    
                <%}
                else{
                    
                    
                
                }            


            %>
            

        </div>
        
    </body>
</html>
