<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Portatil</title>
    <%@include file="scripts.jsp" %>
    <style>
        .container {
            border: 2px solid #3368FF;
            padding: 20px;
            border-radius: 10px;
            margin-top: 50px;
        }

        .btn-success {
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
    <h2>Información del equipo</h2>
    <form method="post" action="save.jsp?action=create">
        <table class="table">
            <tbody>
            <tr>
                <td>Serial o modelo</td>
                <td>
                    <input class="form-control" type="number" name="serial" />
                </td>
            </tr>
            <tr>
                <td>Marca</td>
                <td>
                    <input class="form-control" type="text" name="marca" />
                </td>
            </tr>
            <tr>
                <td>Memoria RAM</td>
                <td>
                    <input class="form-control" type="number" name="ram" />
                </td>
            </tr>
            <tr>
                <td>Tipo de Disco Duro</td>
                <td>
                    <select class="form-control" name="tipo">
                        <option>Disco Solido SSD</option>
                        <option>Disco mecanico HDD </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>¿Tiene Windows?</td>
                <td>
                    Si <input type="radio" name="windows" value="true" /><br/>
                    No <input type="radio" name="windows" value="false" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button class="btn btn-success">Agregar</button>
                    <a href="index.jsp" class="btn btn-warning">Volver</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>
