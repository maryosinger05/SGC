package sgc;

import modelo.Condominio;
import vista.InicioUsuario;
import vista.PantallaPrincipal;
import vista.PantallaPrincipal1;


public class SGC {
    
public static Condominio condominioActual;
public static PantallaPrincipal panta;
public static PantallaPrincipal1 panta1;

    public static void main(String[] args) {


        InicioUsuario vistaU = new InicioUsuario();
        vistaU.setVisible(true);
    }
    
}
