<%@page import="com.example.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
ListaPortatiles lista = (ListaPortatiles) session.getAttribute("portatiles");
String serial = request.getParameter("serial");

if (serial == null || serial.length() == 0) {
    out.print("<script>alert('El serial no existe');");
    out.print("window.location.href='index.jsp';</script>");
} else {
    long valorSerial = Long.parseLong(serial);
    Portatil p = lista.getPortatil(valorSerial);
    if (p == null) {
        out.print("<script>alert('El Portatil no existe');");
        out.print("window.location.href='show.jsp?serial=" + serial + "';</script>");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar aplicación al portatil</title>
    <%@include file="scripts.jsp" %>
    <style>
        .container {
            border: 2px solid #3368FF;
            padding: 20px;
            border-radius: 10px;
            margin-top: 50px;
        }

        .btn-primary {
            background-color: #3368FF;
            border-color: #3368FF;
        }

        .btn-warning {
            background-color: #3368FF;
            border-color: #3368FF;
        }
    </style>
</head>
<body>
<div class="container text-center">
    <h2>Agregar aplicación al portatil</h2>
    <form method="post" action="saveApp.jsp?serial=<%=serial%>">
        <table class="table">
            <tbody>
            <tr>
                <td>Nombre de la Aplicación</td>
                <td>
                    <input class="form-control" type="text" name="nombre" />
                </td>
            </tr>
            <tr>
                <td>Version de la Aplicación</td>
                <td>
                    <input class="form-control" type="number" name="version" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button class="btn btn-primary mb1 bg-blue">Agregar</button>
                    <a href="show.jsp?serial=<%=serial%>" class="btn btn-primary mb1 bg-blue">Volver</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>
<%
    }
%>
