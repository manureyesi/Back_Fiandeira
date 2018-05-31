<%-- 
    Document   : index
    Created on : 30-may-2018, 11:11:57
    Author     : ManuReyesI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Back Fiandeira - Login</title>
        
        <link rel="stylesheet" href="css/login_style.css" type="text/css"/>
        
    </head>
    <body>
        
        <%
            String errores = "";
            
            String user = request.getParameter("usuario");
            String pass = request.getParameter("pass");
            
            if(request.getParameter("usuario") == null){
            }
            else if(user.equalsIgnoreCase("")){
                errores = "El campo esta vacio.";
            }
            else{
                                
                db.consultas con = new db.consultas();
                
                ResultSet rs = con.selectDB("usuarios", "usuario = '"+user+"'");
                
                while(rs.next()){
                    
                    clases.Encriptar en = new clases.Encriptar(pass);
                    
                    if(rs.getString("usuario").equalsIgnoreCase(user) && rs.getString("contrasena").equalsIgnoreCase(en.getCifer())){
                        
                        if(rs.getBoolean("verificado") == true){
                            errores = "Entrando";
                            clases.usuario usuario = new clases.usuario(user, rs.getString("nombre"), rs.getString("apellidos"), rs.getString("mail"), rs.getBoolean("admin"));
                            
                            HttpSession sesion = request.getSession();
                            
                            sesion.setAttribute("usuario", usuario);
                            
                            response.sendRedirect("home.jsp");
                        }
                        else{
                            errores = "Verifica tu email";
                        }
                        
                    }
                    else{
                        errores = "El usuario o contraseña no son correctos";
                    }
                }
                
            }

        %>
        
        <div class="login-page">
            <div class="form">
                <form class="login-form" method="POST">
                    
                    <h2 class="admin">Admin Fiandeira</h2>
                    
                    <input name="usuario" type="text" placeholder="Usuario"/>
                    <input name="pass" type="password" placeholder="Contraseña"/>
                    
                    <span class="errores"><% out.print(errores); %></span>
                    
                    <button>Entrar</button>

              </form>
            </div>
        </div>
        
    </body>
</html>
