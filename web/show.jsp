<%@page import="com.example.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
ListaPortatiles lista = (ListaPortatiles) session.getAttribute("portatiles");
String serial = request.getParameter("serial");

if (serial==null || serial.length()==0) {
    out.print("<script>alert('El serial no existe');");
    out.print("window.location.href='index.jsp';</script>");
} else {
    long valorSerial = Long.parseLong(serial);
    Portatil p = lista.getPortatil(valorSerial);
    if (p==null) {
        out.print("<script>alert('El Portatil no existe');");
        out.print("window.location.href='index.jsp';</script>");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Portatil</title>
        <%@include file="scripts.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <form method="post" action="save.jsp?action=edit">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td>Serial</td>
                                <td>
                                    <%=p.getSerial()%>
                                </td>
                            </tr>
                            <tr>
                                <td>Marca</td>
                                <td>
                                    <%=p.getMarca()%>
                                </td>
                            </tr>
                            <tr>
                                <td>Memoria RAM</td>
                                <td>
                                    <%=p.getRam()%>
                                </td>
                            </tr>
                            <tr>
                                <td>Tipo de Disco Duro</td>
                                <td>
                                    <%=p.getTipoDD()%>
                                </td>
                            </tr>
                            <tr>
                                <td>Tiene Windows?</td>
                                <td>
                                   <%=p.isEsWindows()%>
                                </td>
                            </tr>
                            <td colspan="2">
                                    <a href="addApp.jsp?serial=<%=p.getSerial()%>" class="btn btn-primary mb1 bg-blue">Agregar Aplicacion</a>
                                    <a href="index.jsp" class="btn btn-primary mb1 bg-blue">Volver</a>
                                </td>
                        </tbody>
                    </table>

                </form>
            </div>
            <div class="row">
                <%
                    if (p.getAplicaciones().size()>0) {
                    %>
                    <table border="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Versión</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                              for (int i=0; i<p.getAplicaciones().size(); i++) {
                                  Aplicacion app = p.getAplicaciones().get(i);
                              %>
                            <tr>
                                <td><%=app.getId()%></td>
                                <td><%=app.getNombre()%></td>
                                <td><%=app.getVersion()%></td>
                                <td>
                                    <a class="btn btn-primary mb1 bg-blue"
                                     href="deleteApp.jsp?serial=<%=p.getSerial()%>&id=<%=app.getId()%>">Eliminar</a>
                                </td>
                            </tr>
                              <%
                              }  
                            %>
                        </tbody>
                    </table>

                    <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
<%
    }
%>