package vista;

import controlador.CtrlUsuario;
import controlador.controladorBanco;
import controlador.controladorCategoriaGastos;
import controlador.controladorConceptoGasto;
import controlador.controladorCondominio;
import controlador.controladorCuenta;
import controlador.controladorProveedores;
import controlador.controladorTipoUsuario;
import java.awt.Color;
import static java.awt.Color.black;
import static java.awt.Color.gray;
import static java.awt.Color.white;
import java.awt.Image;
import java.awt.Toolkit;
import javax.swing.JOptionPane;
import modelo.CrudUsuario;
import modelo.Usuario;

/**
 *
 * @author Anthony
 */
public class PantallaPrincipal extends javax.swing.JFrame {

    /**
     * Creates new form PantallaPrincipal
     */
    public PantallaPrincipal() {
        initComponents();

        this.setLocationRelativeTo(null);
        this.setTitle("Vista");
        this.setVisible(false);
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
        btnSalir = new javax.swing.JButton();
        btnMinimizar = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu2 = new javax.swing.JMenu();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenuItem9 = new javax.swing.JMenuItem();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuItem4 = new javax.swing.JMenuItem();
        jMenuItem5 = new javax.swing.JMenuItem();
        jMenuItem3 = new javax.swing.JMenuItem();
        jMenuItem6 = new javax.swing.JMenuItem();
        jMenuItem7 = new javax.swing.JMenuItem();
        jMenuItem10 = new javax.swing.JMenuItem();
        jMenu3 = new javax.swing.JMenu();
        jMenu4 = new javax.swing.JMenu();
        jMenu5 = new javax.swing.JMenu();
        jMenu6 = new javax.swing.JMenu();

        jMenu1.setText("jMenu1");

        jMenuItem8.setText("jMenuItem8");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setIconImage(getIconImage());
        setUndecorated(true);
        setResizable(false);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (1).png"))); // NOI18N
        btnSalir.setBorder(null);
        btnSalir.setBorderPainted(false);
        btnSalir.setContentAreaFilled(false);
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
        btnMinimizar.setBorder(null);
        btnMinimizar.setBorderPainted(false);
        btnMinimizar.setContentAreaFilled(false);
        btnMinimizar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMinimizarActionPerformed(evt);
            }
        });
        getContentPane().add(btnMinimizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(810, 0, 40, 30));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/FPM.png"))); // NOI18N
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, -1, -1));

        jMenuBar1.setBackground(new java.awt.Color(255, 255, 255));
        jMenuBar1.setBorder(null);
        jMenuBar1.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        jMenu2.setBackground(new java.awt.Color(255, 255, 255));
        jMenu2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file (1).png"))); // NOI18N
        jMenu2.setText("Archivos");
        jMenu2.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu2.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N

        jMenuItem2.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/condominio.png"))); // NOI18N
        jMenuItem2.setText("Condominio");
        jMenuItem2.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem2);

        jMenuItem9.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem9.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/usuario.png"))); // NOI18N
        jMenuItem9.setText("Tipos de Usuarios");
        jMenuItem9.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenuItem9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem9ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem9);

        jMenuItem1.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/administracion.png"))); // NOI18N
        jMenuItem1.setText("Gestionar Usuario");
        jMenuItem1.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem1);

        jMenuItem4.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/gastos.png"))); // NOI18N
        jMenuItem4.setText("Categoría Gastos");
        jMenuItem4.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenuItem4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem4ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem4);

        jMenuItem5.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/analisis.png"))); // NOI18N
        jMenuItem5.setText("Concepto Gastos");
        jMenuItem5.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenuItem5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem5ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem5);

        jMenuItem3.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/banco.png"))); // NOI18N
        jMenuItem3.setText("Bancos");
        jMenuItem3.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenuItem3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem3ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem3);

        jMenuItem6.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cuota.png"))); // NOI18N
        jMenuItem6.setText("Cuentas Bancarias");
        jMenuItem6.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenuItem6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem6ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem6);

        jMenuItem7.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/proveedor.png"))); // NOI18N
        jMenuItem7.setText("Proveedores");
        jMenuItem7.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jMenuItem7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem7ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem7);

        jMenuItem10.setText("Usuarios");
        jMenuItem10.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem10ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem10);

        jMenuBar1.add(jMenu2);

        jMenu3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N
        jMenu3.setText("Procesos");
        jMenu3.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu3.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenuBar1.add(jMenu3);

        jMenu4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics.png"))); // NOI18N
        jMenu4.setText("Reportes");
        jMenu4.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu4.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenuBar1.add(jMenu4);

        jMenu5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/educacion.png"))); // NOI18N
        jMenu5.setText("Ayudas");
        jMenu5.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu5.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenuBar1.add(jMenu5);

        jMenu6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user.png"))); // NOI18N
        jMenu6.setText("Perfil");
        jMenu6.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu6.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenuBar1.add(jMenu6);

        setJMenuBar(jMenuBar1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
        try {

            int botonDialogo = JOptionPane.YES_NO_OPTION;
            int result = JOptionPane.showConfirmDialog(null, "DESEA CERRAR LA VENTANA?", "SALIR", botonDialogo);
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

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed

    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        catalogoCondominio cataCon = new catalogoCondominio();
        condominio condo = new condominio();
        PantallaPrincipal1 panta1 = new PantallaPrincipal1();
        
        controladorCondominio controcon = new controladorCondominio(cataCon, condo, panta1,this);

        cataCon.setVisible(true);
        cataCon.jButton2.setEnabled(false);
        cataCon.jButton2.setForeground(gray);
        cataCon.jButton4.setEnabled(false);
        cataCon.jButton4.setForeground(gray);
        cataCon.jButton5.setEnabled(false);
        cataCon.jButton5.setForeground(gray);
        cataCon.jButton7.setEnabled(false);
        cataCon.jButton7.setForeground(gray);


    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void jMenuItem3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem3ActionPerformed
        catalogoBanco cataBan = new catalogoBanco();
        banco ban = new banco();
        controladorBanco controb = new controladorBanco(ban, cataBan);
        cataBan.jButton2.setEnabled(false);
        cataBan.jButton2.setForeground(gray);
        cataBan.jButton4.setEnabled(false);
        cataBan.jButton4.setForeground(gray);
        cataBan.jButton5.setEnabled(false);
        cataBan.jButton5.setForeground(gray);
        cataBan.setVisible(true);

    }//GEN-LAST:event_jMenuItem3ActionPerformed

    private void jMenuItem4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem4ActionPerformed
        catalogoCategoriaGastos catacg = new catalogoCategoriaGastos();
        categoriaGastos gas = new categoriaGastos();
        controladorCategoriaGastos controcg = new controladorCategoriaGastos(catacg, gas);
        catacg.jButton2.setEnabled(false);
        catacg.jButton2.setForeground(gray);
        catacg.jButton4.setEnabled(false);
        catacg.jButton4.setForeground(gray);
        catacg.jButton5.setEnabled(false);
        catacg.jButton5.setForeground(gray);
        catacg.setVisible(true);

    }//GEN-LAST:event_jMenuItem4ActionPerformed

    private void jMenuItem5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem5ActionPerformed
        catalogoConceptoGasto catacog = new catalogoConceptoGasto();
        conceptoGasto cga = new conceptoGasto();
        controladorConceptoGasto controcga = new controladorConceptoGasto(catacog, cga);
        catacog.jButton2.setForeground(gray);
        catacog.jButton2.setEnabled(false);

        catacog.jButton4.setEnabled(false);
        catacog.jButton4.setForeground(gray);
        catacog.jButton5.setEnabled(false);
        catacog.jButton5.setForeground(gray);

        catacog.setVisible(true);
    }//GEN-LAST:event_jMenuItem5ActionPerformed

    private void jMenuItem6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem6ActionPerformed
        catalogoCuenta catacu = new catalogoCuenta();
        cuenta cu = new cuenta();
        controladorCuenta controcu = new controladorCuenta(catacu, cu);
        catacu.jButton2.setEnabled(false);

        catacu.jButton2.setForeground(gray);
        catacu.jButton4.setEnabled(false);
        catacu.jButton4.setForeground(gray);
        catacu.jButton5.setEnabled(false);
        catacu.jButton5.setForeground(gray);

        catacu.setVisible(true);
    }//GEN-LAST:event_jMenuItem6ActionPerformed

    private void jMenuItem7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem7ActionPerformed
        catalogoProveedores cataprov = new catalogoProveedores();
        proveedores prov = new proveedores();
        controladorProveedores controProv = new controladorProveedores(cataprov, prov);
        cataprov.jButton2.setForeground(gray);
        cataprov.jButton2.setEnabled(false);

        cataprov.jButton8.setEnabled(false);
        cataprov.jButton8.setForeground(gray);
        cataprov.jButton5.setEnabled(false);
        cataprov.jButton5.setForeground(gray);

        cataprov.setVisible(true);
    }//GEN-LAST:event_jMenuItem7ActionPerformed

    private void jMenuItem9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem9ActionPerformed
        catalogoTipoUsuario catati = new catalogoTipoUsuario();
        tipoUsuario tipou = new tipoUsuario();
        controladorTipoUsuario controti = new controladorTipoUsuario(catati, tipou);
        catati.jButton2.setForeground(gray);
        catati.jButton2.setEnabled(false);

        catati.jButton4.setEnabled(false);
        catati.jButton4.setForeground(gray);
        catati.jButton5.setEnabled(false);
        catati.jButton5.setForeground(gray);
        catati.setVisible(true);

    }//GEN-LAST:event_jMenuItem9ActionPerformed

    private void jMenuItem10ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem10ActionPerformed
        catalogoUsuario catausu = new catalogoUsuario();
        GestionarUsuario gestusu = new GestionarUsuario();
        Usuario mod = new Usuario();
        CrudUsuario modc = new CrudUsuario();

        CtrlUsuario ctrl = new CtrlUsuario(mod, modc, gestusu, catausu);
        catausu.setVisible(true);

        catausu.jButton2.setForeground(gray);
        catausu.jButton2.setEnabled(false);

        catausu.jButton4.setEnabled(false);
        catausu.jButton4.setForeground(gray);
        catausu.jButton5.setEnabled(false);
        catausu.jButton5.setForeground(gray);

    }//GEN-LAST:event_jMenuItem10ActionPerformed

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
                new PantallaPrincipal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnMinimizar;
    private javax.swing.JButton btnSalir;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenu jMenu5;
    private javax.swing.JMenu jMenu6;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem10;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JMenuItem jMenuItem5;
    private javax.swing.JMenuItem jMenuItem6;
    private javax.swing.JMenuItem jMenuItem7;
    private javax.swing.JMenuItem jMenuItem8;
    private javax.swing.JMenuItem jMenuItem9;
    // End of variables declaration//GEN-END:variables
}
