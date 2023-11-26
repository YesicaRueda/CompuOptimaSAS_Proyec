<%@page import="com.example.Portatil"%>
<%@page import="com.example.ListaPortatiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ListaPortatiles lista = (ListaPortatiles) session.getAttribute("portatiles");
    if (lista == null) {
        lista = new ListaPortatiles();
        session.setAttribute("portatiles", lista);
    }
%>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de portátiles CompuOptima SAS</title>
    <%@include file="scripts.jsp" %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Add the Bootstrap stylesheet link above -->
</head>

<body>
    <div class="container mt-5">
        <!-- Increased top margin for more space -->
        <div class="row">
            <h1 class="text-center">Lista de portátiles CompuOptima S.A.S</h1>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <!-- Added 'table-bordered' class for borders -->
                        <thead class="thead-dark">
                            <!-- Added 'thead-dark' class for a dark header background -->
                            <tr>
                                <th class="text-center">Serial</th>
                                <th class="text-center">Marca</th>
                                <th class="text-center">Memoria RAM</th>
                                <th class="text-center">Tipo de disco duro</th>
                                <th class="text-center">¿Tiene Windows?</th>
                                <th class="text-center">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Portatil p : lista.getPortatiles()) {
                            %>
                            <tr>
                                <td><%=p.getSerial()%></td>
                                <td><%=p.getMarca()%></td>
                                <td><%=p.getRam()%></td>
                                <td><%=p.getTipoDD()%></td>
                                <td><%=p.isEsWindows()%></td>
                                <td>
                                    <a href="delete.jsp?serial=<%=p.getSerial()%>"
                                        class="btn btn-primary mb-3 bg-blue">Eliminar</a>
                                    <!-- Updated 'mb-2' to 'mb-3' for larger margin -->
                                    <a href="edit.jsp?serial=<%=p.getSerial()%>"
                                        class="btn btn-primary mb-3 bg-blue">Editar</a>
                                    <!-- Updated 'mb-2' to 'mb-3' for larger margin -->
                                    <a href="show.jsp?serial=<%=p.getSerial()%>"
                                        class="btn btn-primary mb-3 bg-blue">Ver Aplicación</a>
                                    <!-- Updated 'mb-2' to 'mb-3' for larger margin -->
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <a class="btn btn-primary mb-3 bg-blue" href="create.jsp">Agregar Portátil</a>
            <!-- Updated 'mb-2' to 'mb-3' for larger margin -->
        </div>
    </div>
</body>

</html>
