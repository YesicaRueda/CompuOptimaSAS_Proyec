<%@page import="com.example.Aplicacion"%>
<%@page import="com.example.Portatil"%>
<%@page import="com.example.ListaPortatiles"%>
<%

ListaPortatiles lista = (ListaPortatiles) session.getAttribute("portatiles");

String serial = request.getParameter("serial");
String id = request.getParameter("id");

Portatil p = lista.getPortatil(Long.parseLong(serial));

for (int i=0; i<p.getAplicaciones().size(); i++) {
    Aplicacion app = p.getAplicaciones().get(i);
    if (app.getId()==Integer.parseInt(id)) {
        p.getAplicaciones().remove(app);
        break;
    }
}
response.sendRedirect("show.jsp?serial="+serial);

%>
