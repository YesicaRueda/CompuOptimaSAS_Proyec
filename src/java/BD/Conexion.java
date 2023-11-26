package BD;

import com.example.Portatil;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {

    private String host = "dbproyecto.cxlicm7glcln.us-east-1.rds.amazonaws.com";
    private int port = 3306;
    private String db = "bd_compuoptima";
    private String user = "admin";
    private String password = "1022922471";
    private String url = "jdbc:mysql://" + host + ":" + port + "/" + db + "?useSSL=false&serverTimezone=UTC";

    private Connection conexion;

    private static Conexion dbInstance;

    private Conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.conexion = DriverManager.getConnection(url, user, password);
            System.out.println("LA CONEXION A LA BD FUE EXITOSA");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("LA CONEXION A LA BD NO SE CONCRETÓ");
        }
    }

    public static Conexion getInstance() {
        if (dbInstance == null) {
            dbInstance = new Conexion();
        }
        return dbInstance;
    }

    public Connection getConexion() {
        return conexion;
    }

    public void closed() {
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void insertarPortatil(Portatil portatil) {
        try {
            String sql = "INSERT INTO Portatil (serial, marca, ram, tipoDD, esWindows) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement statement = conexion.prepareStatement(sql)) {
                statement.setLong(1, portatil.getSerial());
                statement.setString(2, portatil.getMarca());
                statement.setInt(3, portatil.getRam());
                statement.setString(4, portatil.getTipoDD());
                statement.setBoolean(5, portatil.isEsWindows());

                statement.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void actualizarPortatil(Portatil portatil) {
        try {
            String sql = "UPDATE Portatil SET marca=?, ram=?, tipoDD=?, esWindows=? WHERE serial=?";
            try (PreparedStatement statement = conexion.prepareStatement(sql)) {
                statement.setString(1, portatil.getMarca());
                statement.setInt(2, portatil.getRam());
                statement.setString(3, portatil.getTipoDD());
                statement.setBoolean(4, portatil.isEsWindows());
                statement.setLong(5, portatil.getSerial());

                statement.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarPortatil(long serial) {
        try {
            String sql = "DELETE FROM Portatil WHERE serial=?";
            try (PreparedStatement statement = conexion.prepareStatement(sql)) {
                statement.setLong(1, serial);
                statement.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Portatil> obtenerTodosLosPortatiles() {
    ArrayList<Portatil> portatiles = new ArrayList<>();
    try {
        String sql = "SELECT * FROM Portatil";
        try (Statement statement = conexion.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery(sql)) {
                while (resultSet.next()) {
                    Portatil portatil = new Portatil(
                            resultSet.getLong("serial"),
                            resultSet.getString("marca"),
                            resultSet.getInt("ram"),
                            resultSet.getString("tipoDD"),  // Agregar otros campos según sea necesario
                            resultSet.getBoolean("esWindows")
                    );
                    portatiles.add(portatil);
                }
            }
        }
    } catch (SQLException ex) {
        Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        System.out.println("Error al obtener portátiles desde la base de datos: " + ex.getMessage());
    }
    return portatiles;
}


    public Portatil obtenerPortatil(long serial) {
        Portatil portatil = null;
        try {
            String sql = "SELECT * FROM Portatil WHERE serial=?";
            try (PreparedStatement statement = conexion.prepareStatement(sql)) {
                statement.setLong(1, serial);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        portatil = new Portatil(
                                resultSet.getLong("serial"),
                                resultSet.getString("marca"),
                                resultSet.getInt("ram"), resultSet.getString("tipoDD"), resultSet.getBoolean("esWindows")
                        );
                        // Obtener y establecer otros atributos según sea necesario
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return portatil;
    }
}
