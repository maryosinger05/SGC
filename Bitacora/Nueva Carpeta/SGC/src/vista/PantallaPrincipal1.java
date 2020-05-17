package vista;

import controlador.ControladorPagarCuotasEsp;
import controlador.controladorRegistroVisita;
import controlador.controladorAsambleas;
import controlador.controladorCerrarMes;
import controlador.controladorComunicados;
import controlador.controladorCuenta_Pagar;
import controlador.controladorCuentasPorCobrar;
import controlador.controladorCuotasEspeciales;
import controlador.controladorFondo;
import controlador.controladorGastoComun;
import controlador.controladorMenu;
import controlador.controladorSancion;
import controlador.controladorUnidades;
import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;
import static javax.swing.BorderFactory.createLineBorder;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.UIManager;
import javax.swing.plaf.ColorUIResource;
import modelo.Asambleas;
import modelo.CerrarMes;
import modelo.Comunicados;
import modelo.CrudUsuario;
import modelo.Cuenta;
import modelo.Cuenta_Pagar;
import modelo.CuentasPorCobrar;
import modelo.CuotasEspeciales;
import modelo.Fondo;
import modelo.GastoComun;
import modelo.Interes;
import modelo.ModeloConceptoGastos;
import modelo.PagarCuotaEspecial;
import modelo.Propietarios;
import modelo.Proveedores;
import modelo.Registro_visitas;
import modelo.Sancion;
import modelo.Unidades;
import sgc.SGC;

/**
 *
 * @author Anthony
 */
public class PantallaPrincipal1 extends javax.swing.JFrame {

    /**
     * Creates new form PantallaPrincipal
     */
    public PantallaPrincipal1() {
        initComponents();

        this.setLocationRelativeTo(null);
        this.setTitle("Vista");
        this.setVisible(false);
        
        SGC.panta.dispose();
    }

    public Image getIconImagine() {

        Image retValue = Toolkit.getDefaultToolkit().getImage(ClassLoader.getSystemResource("img/LogoSistema.png"));

        return retValue;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jMenu1 = new javax.swing.JMenu();
        jMenuItem8 = new javax.swing.JMenuItem();
        jTextField1 = new javax.swing.JTextField();
        btnSalir = new javax.swing.JButton();
        btnMinimizar = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu2 = new javax.swing.JMenu();
        jAsamblea = new javax.swing.JMenuItem();
        jCuotas = new javax.swing.JMenuItem();
        jGastos = new javax.swing.JMenuItem();
        jSancion = new javax.swing.JMenuItem();
        jUnidades = new javax.swing.JMenuItem();
        jFondo = new javax.swing.JMenuItem();
        jComunicados = new javax.swing.JMenuItem();
        jMenu3 = new javax.swing.JMenu();
        pCuentasporCobrar = new javax.swing.JMenuItem();
        pCuentapagar = new javax.swing.JMenuItem();
        pVisitas = new javax.swing.JMenuItem();
        pCuotas = new javax.swing.JMenuItem();
        pCerrarMes = new javax.swing.JMenuItem();
        jMenu4 = new javax.swing.JMenu();
        jMenu5 = new javax.swing.JMenu();
        jMenu6 = new javax.swing.JMenu();

        jMenu1.setText("jMenu1");

        jMenuItem8.setText("jMenuItem8");

        jTextField1.setText("jTextField1");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setIconImage(getIconImage());
        setUndecorated(true);
        setResizable(false);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (1).png"))); // NOI18N
        btnSalir.setToolTipText("Cerrar");
        btnSalir.setBorder(null);
        btnSalir.setBorderPainted(false);
        btnSalir.setContentAreaFilled(false);
        btnSalir.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        btnSalir.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalirActionPerformed(evt);
            }
        });
        getContentPane().add(btnSalir, new org.netbeans.lib.awtextra.AbsoluteConstraints(850, 0, 40, -1));

        btnMinimizar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (1).png"))); // NOI18N
        btnMinimizar.setToolTipText("Minimizar");
        btnMinimizar.setBorder(null);
        btnMinimizar.setBorderPainted(false);
        btnMinimizar.setContentAreaFilled(false);
        btnMinimizar.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        btnMinimizar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMinimizarActionPerformed(evt);
            }
        });
        getContentPane().add(btnMinimizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(810, 0, 40, 30));

        jButton1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jButton1.setForeground(new java.awt.Color(0, 94, 159));
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/puerta.png"))); // NOI18N
        jButton1.setText("Volver al Menú Anterior");
        jButton1.setToolTipText("Regresar al menú de datos compartidos");
        jButton1.setBorder(null);
        jButton1.setBorderPainted(false);
        jButton1.setContentAreaFilled(false);
        jButton1.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jButton1.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/logout (1).png"))); // NOI18N
        jButton1.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/logout.png"))); // NOI18N
        jButton1.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/logout (1).png"))); // NOI18N
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(630, 0, -1, 30));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/FPM.png"))); // NOI18N
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, -1, -1));

        jMenuBar1.setBackground(new java.awt.Color(255, 255, 255));
        jMenuBar1.setBorder(null);
        jMenuBar1.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        jMenu2.setBackground(new java.awt.Color(255, 255, 255));
        jMenu2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file (1).png"))); // NOI18N
        jMenu2.setText("Archivos");
        jMenu2.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenu2.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenu2.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file.png"))); // NOI18N
        jMenu2.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file (1).png"))); // NOI18N
        jMenu2.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file (1).png"))); // NOI18N
        jMenu2.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file (1).png"))); // NOI18N

        jAsamblea.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jAsamblea.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/mesa-redonda.png"))); // NOI18N
        jAsamblea.setText("Asambleas");
        jAsamblea.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jAsamblea.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jAsambleaActionPerformed(evt);
            }
        });
        jMenu2.add(jAsamblea);

        jCuotas.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jCuotas.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/presupuesto.png"))); // NOI18N
        jCuotas.setText("Cuotas Especiales");
        jCuotas.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jCuotas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCuotasActionPerformed(evt);
            }
        });
        jMenu2.add(jCuotas);

        jGastos.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jGastos.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/alquiler-de-casa.png"))); // NOI18N
        jGastos.setText("Gastos Comunes");
        jGastos.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jGastos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jGastosActionPerformed(evt);
            }
        });
        jMenu2.add(jGastos);

        jSancion.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jSancion.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/no-stopping.png"))); // NOI18N
        jSancion.setText("Sanciones");
        jSancion.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jSancion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jSancionActionPerformed(evt);
            }
        });
        jMenu2.add(jSancion);

        jUnidades.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jUnidades.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/casa.png"))); // NOI18N
        jUnidades.setText("Unidades");
        jUnidades.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jUnidades.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jUnidadesActionPerformed(evt);
            }
        });
        jMenu2.add(jUnidades);

        jFondo.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jFondo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/hucha.png"))); // NOI18N
        jFondo.setText("Fondo");
        jFondo.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jFondo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jFondoActionPerformed(evt);
            }
        });
        jMenu2.add(jFondo);

        jComunicados.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jComunicados.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/mensaje.png"))); // NOI18N
        jComunicados.setText("Comunicados");
        jComunicados.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jComunicados.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComunicadosActionPerformed(evt);
            }
        });
        jMenu2.add(jComunicados);

        jMenuBar1.add(jMenu2);

        jMenu3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N
        jMenu3.setText("Procesos");
        jMenu3.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenu3.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenu3.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel.png"))); // NOI18N
        jMenu3.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N
        jMenu3.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N
        jMenu3.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N

        pCuentasporCobrar.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        pCuentasporCobrar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/dar-dinero.png"))); // NOI18N
        pCuentasporCobrar.setText("Cuentas por Cobrar");
        pCuentasporCobrar.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        pCuentasporCobrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pCuentasporCobrarActionPerformed(evt);
            }
        });
        jMenu3.add(pCuentasporCobrar);

        pCuentapagar.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        pCuentapagar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/metodo-de-pago.png"))); // NOI18N
        pCuentapagar.setText("Cuentas por Pagar");
        pCuentapagar.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        pCuentapagar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pCuentapagarActionPerformed(evt);
            }
        });
        jMenu3.add(pCuentapagar);

        pVisitas.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        pVisitas.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/autorizacion.png"))); // NOI18N
        pVisitas.setText("Visitas Autorizadas");
        pVisitas.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        pVisitas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pVisitasActionPerformed(evt);
            }
        });
        jMenu3.add(pVisitas);

        pCuotas.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        pCuotas.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cuota.png"))); // NOI18N
        pCuotas.setText("Pago de Cuotas Especiales");
        pCuotas.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        pCuotas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pCuotasActionPerformed(evt);
            }
        });
        jMenu3.add(pCuotas);

        pCerrarMes.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        pCerrarMes.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/factura.png"))); // NOI18N
        pCerrarMes.setText("Generar Recibo");
        pCerrarMes.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        pCerrarMes.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pCerrarMesActionPerformed(evt);
            }
        });
        jMenu3.add(pCerrarMes);

        jMenuBar1.add(jMenu3);

        jMenu4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics.png"))); // NOI18N
        jMenu4.setText("Reportes");
        jMenu4.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenu4.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenu4.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics (1).png"))); // NOI18N
        jMenu4.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics.png"))); // NOI18N
        jMenu4.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics.png"))); // NOI18N
        jMenu4.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics.png"))); // NOI18N
        jMenuBar1.add(jMenu4);

        jMenu5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/educacion.png"))); // NOI18N
        jMenu5.setText("Ayudas");
        jMenu5.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenu5.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenuBar1.add(jMenu5);

        jMenu6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user (1).png"))); // NOI18N
        jMenu6.setText("Perfil");
        jMenu6.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenu6.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenu6.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user.png"))); // NOI18N
        jMenu6.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user (1).png"))); // NOI18N
        jMenu6.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user (1).png"))); // NOI18N
        jMenu6.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user (1).png"))); // NOI18N
        jMenuBar1.add(jMenu6);

        setJMenuBar(jMenuBar1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jCuotasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCuotasActionPerformed
      
    }//GEN-LAST:event_jCuotasActionPerformed

    private void jAsambleaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jAsambleaActionPerformed
       

      
    }//GEN-LAST:event_jAsambleaActionPerformed

    private void jGastosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jGastosActionPerformed
     
    }//GEN-LAST:event_jGastosActionPerformed

    private void jSancionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jSancionActionPerformed
    
    }//GEN-LAST:event_jSancionActionPerformed

    private void jUnidadesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jUnidadesActionPerformed
       
        

      
    }//GEN-LAST:event_jUnidadesActionPerformed

    private void jFondoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jFondoActionPerformed
       

         

       
    }//GEN-LAST:event_jFondoActionPerformed

    private void jComunicadosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComunicadosActionPerformed
        
         

       
    }//GEN-LAST:event_jComunicadosActionPerformed

    private void pCuentasporCobrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pCuentasporCobrarActionPerformed
      
         

     
    }//GEN-LAST:event_pCuentasporCobrarActionPerformed

    private void pCuentapagarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pCuentapagarActionPerformed
     
       
    

    }//GEN-LAST:event_pCuentapagarActionPerformed

    private void pVisitasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pVisitasActionPerformed
       
         

        
    }//GEN-LAST:event_pVisitasActionPerformed

    private void pCuotasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pCuotasActionPerformed
       
       
        
    }//GEN-LAST:event_pCuotasActionPerformed

    private void pCerrarMesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pCerrarMesActionPerformed
    

        

    }//GEN-LAST:event_pCerrarMesActionPerformed

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
        try {
            UIManager UI=new UIManager();
            
            UI.put("OptionPane.border",createLineBorder(new Color(0,94,159), 5));
            UI.put("Panel.background",new ColorUIResource(255,255,255));

            int botonDialogo = JOptionPane.YES_NO_OPTION;
            
            Icon p = new ImageIcon(getClass().getResource("/img/pregunta.png"));
            UIManager.put("Button.background", Color.white);
            UIManager.put("Button.font", Color.blue);
            UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
            UIManager.put("Label.background", Color.blue);
            UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));
            
            int result = JOptionPane.showConfirmDialog(null, "¿Desea salir del sistema?", "Salir", botonDialogo, JOptionPane.INFORMATION_MESSAGE,p);
            if (result == 0) {

                System.exit(0);

            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, e);
        }
    }//GEN-LAST:event_btnSalirActionPerformed

    private void btnMinimizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMinimizarActionPerformed
        this.setState(vista.InicioUsuario.ICONIFIED);
    }//GEN-LAST:event_btnMinimizarActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        controladorMenu ctrl = new controladorMenu();
        //PantallaPrincipal panta = new PantallaPrincipal();
        //panta.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jButton1ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(PantallaPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(PantallaPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(PantallaPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(PantallaPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new PantallaPrincipal1().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnMinimizar;
    private javax.swing.JButton btnSalir;
    public javax.swing.JMenuItem jAsamblea;
    public javax.swing.JButton jButton1;
    public javax.swing.JMenuItem jComunicados;
    public javax.swing.JMenuItem jCuotas;
    public javax.swing.JMenuItem jFondo;
    public javax.swing.JMenuItem jGastos;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenu jMenu5;
    private javax.swing.JMenu jMenu6;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem8;
    public javax.swing.JMenuItem jSancion;
    private javax.swing.JTextField jTextField1;
    public javax.swing.JMenuItem jUnidades;
    public javax.swing.JMenuItem pCerrarMes;
    public javax.swing.JMenuItem pCuentapagar;
    public javax.swing.JMenuItem pCuentasporCobrar;
    public javax.swing.JMenuItem pCuotas;
    public javax.swing.JMenuItem pVisitas;
    // End of variables declaration//GEN-END:variables
}
