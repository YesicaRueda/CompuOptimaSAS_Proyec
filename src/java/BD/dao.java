
package BD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class dao {
    
     private Conexion db;
     
     public dao (){
         this.db = Conexion.getInstance();
     }
    
}
