<%@page import="com.example.Aplicacion"%>
<%@page import="com.example.ListaPortatiles"%>
<%@page import="com.example.Portatil"%>
<%

ListaPortatiles lista = (ListaPortatiles) session.getAttribute("portatiles");
    
String serial = request.getParameter("serial");


String nombre = request.getParameter("nombre");
String version = request.getParameter("version");


if (serial!=null && serial.length()>0 &&
    nombre!=null && nombre.length()>0 &&
        version!=null && version.length()>0) {
    
        Portatil portatil = lista.getPortatil(Long.parseLong(serial));

        Aplicacion app = new Aplicacion(nombre, version);
        
        portatil.addAplicacion(app);
        
        response.sendRedirect("show.jsp?serial="+serial);
} else {
    out.print("<script>alert('Datos no validos');");
    out.print("history.back();</script>");
}
%>