/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;
import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JScrollBar;
import javax.swing.JTable;
import javax.swing.plaf.basic.BasicScrollBarUI;
import sun.swing.table.DefaultTableCellHeaderRenderer;
/**
 *
 * @author rma
 */
public class asambleas extends javax.swing.JFrame {

    /**
     * Creates new form Asambleas
     */
        //Aquí cambias la trasparencia de la barra mientras el cursor está encima. Mientras mál alto el valor, menos transparente
    private static final int SCROLL_BAR_ALPHA_ROLLOVER = 150;
    //Aquí cambias la trasparencia de la barra. Mientras mál alto el valor, menos transparente
    private static final int SCROLL_BAR_ALPHA = 100;
    private static final int THUMB_BORDER_SIZE = 5;
    //Aquí cambias el grosor de la barra
    private static final int THUMB_SIZE = 8;
    //Aquí cambias el color de la barra
    private static final Color THUMB_COLOR = Color.BLUE;
    
    public asambleas() {
        initComponents();
        jTable1.getTableHeader().setDefaultRenderer(new catalogoUsuario.Headercolor());
        jScrollPane1.getVerticalScrollBar().setUI(new MyScrollBarUI());
        setLocationRelativeTo(null);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel4 = new javax.swing.JLabel();
        jTextField4 = new javax.swing.JTextField();
        jCalendar1 = new com.toedter.calendar.JCalendar();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jPanel3 = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        txtNombreAsamblea = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jScrollPane4 = new javax.swing.JScrollPane();
        txaDescripcion = new javax.swing.JTextArea();
        jSeparator5 = new javax.swing.JSeparator();
        jLabel13 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        jSeparator6 = new javax.swing.JSeparator();
        btnModificar = new javax.swing.JButton();
        txtBuscarPropietarios = new javax.swing.JTextField();
        jSeparator8 = new javax.swing.JSeparator();
        btnGuardar = new javax.swing.JButton();
        jDateChooser2 = new com.toedter.calendar.JDateChooser();
        jLabel15 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel16 = new javax.swing.JLabel();
        jLabel18 = new javax.swing.JLabel();
        btnSalir = new javax.swing.JButton();
        btnMinimizar = new javax.swing.JButton();
        txtid = new javax.swing.JTextField();

        jLabel4.setText("jLabel4");

        jTextField4.setText("jTextField4");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setUndecorated(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel3.setBackground(new java.awt.Color(255, 255, 255));
        jPanel3.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 94, 159), 5, true));
        jPanel3.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel4.setBackground(new java.awt.Color(0, 94, 159));
        jPanel4.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        txtNombreAsamblea.setBackground(new java.awt.Color(0, 94, 159));
        txtNombreAsamblea.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtNombreAsamblea.setForeground(new java.awt.Color(255, 255, 255));
        txtNombreAsamblea.setBorder(null);
        txtNombreAsamblea.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtNombreAsambleaActionPerformed(evt);
            }
        });
        jPanel4.add(txtNombreAsamblea, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 30, 150, 20));

        jLabel8.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("<html>\nNombre de <br> la Asamblea:\n</html>");
        jPanel4.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, -1, 40));

        jLabel10.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(255, 255, 255));
        jLabel10.setText("Descripción:");
        jPanel4.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 70, 90, -1));

        jLabel11.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(255, 255, 255));
        jLabel11.setText("Fecha:");
        jPanel4.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 30, 50, 20));

        jScrollPane4.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));

        txaDescripcion.setBackground(new java.awt.Color(0, 94, 159));
        txaDescripcion.setColumns(20);
        txaDescripcion.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txaDescripcion.setForeground(new java.awt.Color(255, 255, 255));
        txaDescripcion.setRows(5);
        jScrollPane4.setViewportView(txaDescripcion);

        jPanel4.add(jScrollPane4, new org.netbeans.lib.awtextra.AbsoluteConstraints(110, 65, 350, 110));

        jSeparator5.setForeground(new java.awt.Color(255, 255, 255));
        jSeparator5.setOpaque(true);
        jPanel4.add(jSeparator5, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 180, 460, -1));

        jLabel13.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        jLabel13.setForeground(new java.awt.Color(255, 255, 255));
        jLabel13.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel13.setText("Selecciona los Asistentes a la Asamblea.\n");
        jPanel4.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 190, 360, -1));

        jLabel14.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel14.setForeground(new java.awt.Color(255, 255, 255));
        jLabel14.setText("Buscar:");
        jPanel4.add(jLabel14, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 240, -1, 20));

        jSeparator6.setForeground(new java.awt.Color(255, 255, 255));
        jPanel4.add(jSeparator6, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 50, 150, 10));

        btnModificar.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        btnModificar.setForeground(new java.awt.Color(255, 255, 255));
        btnModificar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/editar (3).png"))); // NOI18N
        btnModificar.setText("Editar Asamblea");
        btnModificar.setBorder(null);
        btnModificar.setBorderPainted(false);
        btnModificar.setContentAreaFilled(false);
        btnModificar.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        btnModificar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/editar (2).png"))); // NOI18N
        btnModificar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/editar (2).png"))); // NOI18N
        btnModificar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/editar (2).png"))); // NOI18N
        btnModificar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnModificarActionPerformed(evt);
            }
        });
        jPanel4.add(btnModificar, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 250, 160, 30));

        txtBuscarPropietarios.setBackground(new java.awt.Color(0, 94, 159));
        txtBuscarPropietarios.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtBuscarPropietarios.setForeground(new java.awt.Color(255, 255, 255));
        txtBuscarPropietarios.setBorder(null);
        jPanel4.add(txtBuscarPropietarios, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 240, 190, 20));

        jSeparator8.setForeground(new java.awt.Color(255, 255, 255));
        jPanel4.add(jSeparator8, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 260, 190, 10));

        btnGuardar.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        btnGuardar.setForeground(new java.awt.Color(255, 255, 255));
        btnGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/disco-flexible.png"))); // NOI18N
        btnGuardar.setText("Guardar Asamblea");
        btnGuardar.setBorder(null);
        btnGuardar.setBorderPainted(false);
        btnGuardar.setContentAreaFilled(false);
        btnGuardar.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        btnGuardar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/disco-flexible1.png"))); // NOI18N
        btnGuardar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/disco-flexible1.png"))); // NOI18N
        btnGuardar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/disco-flexible1.png"))); // NOI18N
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });
        jPanel4.add(btnGuardar, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 220, 170, 30));
        jPanel4.add(jDateChooser2, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 30, 150, 20));

        jPanel3.add(jPanel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 80, 480, 280));

        jLabel15.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        jPanel3.add(jLabel15, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 60, -1, 320));

        jLabel17.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        jLabel17.setText("Registro de Asambleas");
        jPanel3.add(jLabel17, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 20, -1, -1));

        jScrollPane1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Seleccione", "C.I. / RIF.", "Nombre", "Teléfono ", "Correo Electrónico"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Boolean.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jTable1.setRowHeight(20);
        jScrollPane1.setViewportView(jTable1);

        jPanel3.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 410, 690, 210));

        jLabel16.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        jPanel3.add(jLabel16, new org.netbeans.lib.awtextra.AbsoluteConstraints(240, 400, 510, 300));

        jLabel18.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        jPanel3.add(jLabel18, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 400, 510, 300));

        btnSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (1).png"))); // NOI18N
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
        jPanel3.add(btnSalir, new org.netbeans.lib.awtextra.AbsoluteConstraints(710, 10, -1, 30));

        btnMinimizar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (1).png"))); // NOI18N
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
        jPanel3.add(btnMinimizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(670, 10, 40, 30));

        txtid.setEditable(false);
        txtid.setEnabled(false);
        jPanel3.add(txtid, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 300, 20, -1));

        getContentPane().add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 760, 630));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnModificarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnModificarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnModificarActionPerformed

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
        try {

            int botonDialogo = JOptionPane.YES_NO_OPTION;
            int result = JOptionPane.showConfirmDialog(null, "DESEA CERRAR LA VENTANA?", "SALIR", botonDialogo);
            if (result == 0) {

                this.dispose();

            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, e);
        }
    }//GEN-LAST:event_btnSalirActionPerformed

    private void btnMinimizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMinimizarActionPerformed
        this.setState(vista.InicioUsuario.ICONIFIED);
    }//GEN-LAST:event_btnMinimizarActionPerformed

    private void txtNombreAsambleaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtNombreAsambleaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtNombreAsambleaActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnGuardarActionPerformed

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
            java.util.logging.Logger.getLogger(asambleas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(asambleas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(asambleas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(asambleas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new asambleas().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton btnGuardar;
    public javax.swing.JButton btnMinimizar;
    public javax.swing.JButton btnModificar;
    public javax.swing.JButton btnSalir;
    private com.toedter.calendar.JCalendar jCalendar1;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    public com.toedter.calendar.JDateChooser jDateChooser2;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JSeparator jSeparator5;
    private javax.swing.JSeparator jSeparator6;
    private javax.swing.JSeparator jSeparator8;
    public javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField4;
    public javax.swing.JTextArea txaDescripcion;
    public javax.swing.JTextField txtBuscarPropietarios;
    public javax.swing.JTextField txtNombreAsamblea;
    public javax.swing.JTextField txtid;
    // End of variables declaration//GEN-END:variables
    static public class Headercolor extends DefaultTableCellHeaderRenderer {
    public Headercolor () {
        setOpaque(true);
    }
    public Component getTableCellRendererComponent(JTable jTable1, Object value, boolean selected, boolean focused,int row,int column) {
        super.getTableCellRendererComponent(jTable1, value, selected, focused, row, column);
        setBackground(new java.awt.Color(0,94,159));
        setForeground(Color.white);
        setFont(new Font("Tahoma", Font.BOLD, 14));
        return this;
    }
}
    public class MyScrollBarUI extends BasicScrollBarUI {

        @Override
        public void paintTrack(Graphics g, JComponent c, Rectangle trackBounds) {
            trackBounds.contains(thumbRect);
            g.setColor(new java.awt.Color(255,255,255));
            g.drawRect(0, 0, 500, 500);
            g.fillRect(0, 0, 500, 500);

        }

        @Override
        public void paintThumb(Graphics g, JComponent c, Rectangle thumbBounds) {
            int alpha = isThumbRollover() ? SCROLL_BAR_ALPHA_ROLLOVER : SCROLL_BAR_ALPHA;
            int orientation = scrollbar.getOrientation();
            int arc = THUMB_SIZE;
            int x = thumbBounds.x + THUMB_BORDER_SIZE;
            int y = thumbBounds.y + THUMB_BORDER_SIZE;

            int width = orientation == JScrollBar.VERTICAL
                    ? THUMB_SIZE : thumbBounds.width - (THUMB_BORDER_SIZE * 2);
            width = Math.max(width, THUMB_SIZE);

            int height = orientation == JScrollBar.VERTICAL
                    ? thumbBounds.height - (THUMB_BORDER_SIZE * 2) : THUMB_SIZE;
            height = Math.max(height, THUMB_SIZE);

            Graphics2D graphics2D = (Graphics2D) g.create();
            graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON);
            graphics2D.setColor(new Color(THUMB_COLOR.getRed(),
                    THUMB_COLOR.getGreen(), THUMB_COLOR.getBlue(), alpha));
            graphics2D.fillRoundRect(x, y, width, height, arc, arc);
            graphics2D.dispose();
        }

    }
}
