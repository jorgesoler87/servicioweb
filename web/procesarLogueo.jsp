<%-- 
    Document   : procesarLogueo
    Created on : Aug 23, 2015, 12:40:13 AM
    Author     : G1987
--%>

<%@page import="ws.VerificacionLogueo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            VerificacionLogueo vl = new VerificacionLogueo();
            vl.setUsuario(request.getParameter("usuario"));
            vl.setContrasena(request.getParameter("pass"));
        %>
    <%-- start web service invocation --%><hr/>
    <%
    try {
	ws.Login_Service service = new ws.Login_Service();
	ws.Login port = service.getLoginPort();
	// TODO process result here
	boolean logueo = port.verificacionLogueo(vl.getUsuario(), vl.getContrasena());
	if (logueo){
            out.println("autenticacion");
        }else{
             out.println("error");
        }
    } catch (Exception ex) {
	  out.println("mantenimiento");
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
