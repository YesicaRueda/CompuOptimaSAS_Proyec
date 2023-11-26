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
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>Serial</td>
                                <td>
                                    <input class="form-control" type="number" name="serial"
                                           value="<%=p.getSerial()%>" 
                                           readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td>Marca</td>
                                <td>
                                    <input class="form-control" type="text" name="marca"
                                           value="<%=p.getMarca()%>" />
                                </td>
                            </tr>
                            <tr>
                                <td>Memoria RAM</td>
                                <td>
                                    <input class="form-control" type="number" name="ram"
                                           value="<%=p.getRam()%>" />
                                </td>
                            </tr>
                            <tr>
                                <td>Tipo de Disco Duro</td>
                                <td>
                                    <select class="form-control" name="tipo">
                                        <option><%=p.getTipoDD()%></option>
                                        <option>Estado Solido SSD</option>
                                        <option>Mecanico DD</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Tiene Windows?</td>
                                <td>
                                    Si <input type="radio" name="windows" value="true"
                                      <%=((p.isEsWindows())?"checked":"")%>        /><br/>
                                    No <input type="radio" name="windows" value="false"
                                      <%=((!p.isEsWindows())?"checked":"")%>        />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <button class="btn btn-primary mb1 bg-blue">Modificar</button>
                                    <a href="index.jsp" class="btn btn-primary mb1 bg-blue">Volver</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </form>
            </div>
        </div>
    </body>
</html>
<%
    }
%>