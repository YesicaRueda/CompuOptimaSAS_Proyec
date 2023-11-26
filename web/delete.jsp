<%@page import="com.example.ListaPortatiles"%>
<%
ListaPortatiles lista = (ListaPortatiles) session.getAttribute("portatiles");
String serial = request.getParameter("serial");

if (serial==null || serial.length()==0) {
    out.print("<script>alert('El serial no existe');");
    out.print("window.location.href='index.jsp';</script>");
} else {
    long valorSerial = Long.parseLong(serial);
    if (lista.deletePortatil(valorSerial)) {
        out.print("<script>alert('Portatil Eliminado');");
    } else {
        out.print("<script>alert('Portatil NO Eliminado');");
    }
    out.print("window.location.href='index.jsp';</script>");
}
%>
