<%@page import="com.example.ListaPortatiles"%>
<%@page import="com.example.Portatil"%>
<%

ListaPortatiles lista = (ListaPortatiles) session.getAttribute("portatiles");
    
String serial = request.getParameter("serial");
String marca = request.getParameter("marca");
String ram = request.getParameter("ram");
String tipo = request.getParameter("tipo");
String windows = request.getParameter("windows");

String action = request.getParameter("action");

if (serial!=null && serial.length()>0 &&
    marca!=null && marca.length()>0 &&
        ram!=null && ram.length()>0) {
    
    
    if (action.equals("create")) {
        long valorSerial = Long.parseLong(serial);
        int valorRam = Integer.parseInt(ram);
        Portatil portatil = new Portatil(valorSerial, marca, valorRam, tipo, Boolean.parseBoolean(windows));
        portatil.setTipoDD(tipo);
        portatil.setEsWindows(Boolean.parseBoolean(windows));
        lista.addPortatil(portatil);
        response.sendRedirect("index.jsp");
    } else if (action.equals("edit")) {
        long valorSerial = Long.parseLong(serial);
        int valorRam = Integer.parseInt(ram);
        Portatil portatil=lista.getPortatil(valorSerial);
        portatil.setMarca(marca);
        portatil.setRam(valorRam);
        portatil.setTipoDD(tipo);
        portatil.setEsWindows(Boolean.parseBoolean(windows));
        lista.updatePortatil(valorSerial, portatil);
        response.sendRedirect("index.jsp");
    }
} else {
    out.print("<script>alert('Datos no validos');");
    out.print("history.back();</script>");
}


%>