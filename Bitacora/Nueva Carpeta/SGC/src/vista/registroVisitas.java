/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import sun.swing.table.DefaultTableCellHeaderRenderer;

/**
 *
 * @author rma
 */
public class registroVisitas extends javax.swing.JFrame {

    /**
     * Creates new form registroVisitas
     */
    public registroVisitas() {
        initComponents();
        jTable1.getTableHeader().setDefaultRenderer(new catalogoUsuario.Headercolor());
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

        jLabel5 = new javax.swing.JLabel();
        jComboBox2 = new javax.swing.JComboBox<>();
        jTextField5 = new javax.swing.JTextField();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jTextField4 = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jTextField2 = new javax.swing.JTextField();
        jTextField7 = new javax.swing.JTextField();
        jSeparator1 = new javax.swing.JSeparator();
        jSeparator4 = new javax.swing.JSeparator();
        jSeparator5 = new javax.swing.JSeparator();
        jButton1 = new javax.swing.JButton();
        jSeparator6 = new javax.swing.JSeparator();
        jSeparator7 = new javax.swing.JSeparator();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jTextField8 = new javax.swing.JTextField();
        jSeparator8 = new javax.swing.JSeparator();
        jLabel10 = new javax.swing.JLabel();
        btnMinimizar = new javax.swing.JButton();
        btnSalir = new javax.swing.JButton();
        jLabel8 = new javax.swing.JLabel();

        jLabel5.setText("jLabel5");

        jComboBox2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        jTextField5.setText("jTextField5");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setUndecorated(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 94, 159), 5, true));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jScrollPane1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String [] {
                "Cédula", "Nombre", "Apellido", "Fecha Entrada", "Hora Entrada", "Unidad"
            }
        ));
        jTable1.setRowHeight(20);
        jScrollPane1.setViewportView(jTable1);

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(62, 440, 710, 170));

        jLabel12.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        jPanel1.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 430, 510, 300));

        jLabel13.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        jPanel1.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 430, 510, 300));

        jPanel2.setBackground(new java.awt.Color(0, 94, 159));
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Fecha de Entrada:");
        jPanel2.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 90, 130, -1));

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Nombre:");
        jPanel2.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 90, 70, -1));

        jTextField1.setBackground(new java.awt.Color(0, 94, 159));
        jTextField1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTextField1.setForeground(new java.awt.Color(255, 255, 255));
        jTextField1.setBorder(null);
        jPanel2.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 160, 240, 20));

        jTextField4.setBackground(new java.awt.Color(0, 94, 159));
        jTextField4.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTextField4.setForeground(new java.awt.Color(255, 255, 255));
        jTextField4.setBorder(null);
        jPanel2.add(jTextField4, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 160, 240, 20));

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("Hora de Entrada:");
        jPanel2.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 160, 120, -1));

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Cédula:");
        jPanel2.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 10, 60, 20));

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Apellido:");
        jPanel2.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 162, -1, 20));

        jTextField2.setBackground(new java.awt.Color(0, 94, 159));
        jTextField2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTextField2.setForeground(new java.awt.Color(255, 255, 255));
        jTextField2.setBorder(null);
        jPanel2.add(jTextField2, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 90, 240, 20));

        jTextField7.setBackground(new java.awt.Color(0, 94, 159));
        jTextField7.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTextField7.setForeground(new java.awt.Color(255, 255, 255));
        jTextField7.setBorder(null);
        jPanel2.add(jTextField7, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 90, 240, 20));

        jSeparator1.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator1, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 180, 230, 10));

        jSeparator4.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator4, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 180, 240, 10));

        jSeparator5.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator5, new org.netbeans.lib.awtextra.AbsoluteConstraints(490, 110, 240, 10));

        jButton1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jButton1.setForeground(new java.awt.Color(255, 255, 255));
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional.png"))); // NOI18N
        jButton1.setText("Agregar al Registro de Visita");
        jButton1.setBorderPainted(false);
        jButton1.setContentAreaFilled(false);
        jButton1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton1.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional (1).png"))); // NOI18N
        jButton1.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional (1).png"))); // NOI18N
        jButton1.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional (1).png"))); // NOI18N
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel2.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 220, -1, -1));

        jSeparator6.setForeground(new java.awt.Color(255, 255, 255));
        jSeparator6.setOpaque(true);
        jPanel2.add(jSeparator6, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 198, 740, -1));

        jSeparator7.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator7, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 110, 240, 10));

        jButton2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jButton2.setForeground(new java.awt.Color(255, 255, 255));
        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/busqueda.png"))); // NOI18N
        jButton2.setText("Buscar");
        jButton2.setBorder(null);
        jButton2.setBorderPainted(false);
        jButton2.setContentAreaFilled(false);
        jButton2.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton2.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/busqueda (1).png"))); // NOI18N
        jButton2.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/busqueda (1).png"))); // NOI18N
        jButton2.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/busqueda (1).png"))); // NOI18N
        jPanel2.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(400, 0, 90, 40));

        jButton3.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jButton3.setForeground(new java.awt.Color(255, 255, 255));
        jButton3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional.png"))); // NOI18N
        jButton3.setText("Añadir Nuevo Visitante");
        jButton3.setBorder(null);
        jButton3.setBorderPainted(false);
        jButton3.setContentAreaFilled(false);
        jButton3.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton3.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional (1).png"))); // NOI18N
        jButton3.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional (1).png"))); // NOI18N
        jButton3.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional (1).png"))); // NOI18N
        jPanel2.add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(510, 0, 200, 40));

        jTextField8.setBackground(new java.awt.Color(0, 94, 159));
        jTextField8.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTextField8.setForeground(new java.awt.Color(255, 255, 255));
        jTextField8.setBorder(null);
        jPanel2.add(jTextField8, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 10, 250, 20));

        jSeparator8.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator8, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 30, 250, 10));

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 70, 740, 280));

        jLabel10.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu700-350 (2).png"))); // NOI18N
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 60, 800, 300));

        btnMinimizar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (1).png"))); // NOI18N
        btnMinimizar.setBorder(null);
        btnMinimizar.setBorderPainted(false);
        btnMinimizar.setContentAreaFilled(false);
        btnMinimizar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnMinimizar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMinimizarActionPerformed(evt);
            }
        });
        jPanel1.add(btnMinimizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(750, 10, 40, 30));

        btnSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (1).png"))); // NOI18N
        btnSalir.setBorder(null);
        btnSalir.setBorderPainted(false);
        btnSalir.setContentAreaFilled(false);
        btnSalir.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnSalir.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalirActionPerformed(evt);
            }
        });
        jPanel1.add(btnSalir, new org.netbeans.lib.awtextra.AbsoluteConstraints(790, 10, -1, 30));

        jLabel8.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        jLabel8.setText("Registro de Visitas");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(370, 20, -1, -1));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 840, 620));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnMinimizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMinimizarActionPerformed
        this.setState(vista.InicioUsuario.ICONIFIED);
    }//GEN-LAST:event_btnMinimizarActionPerformed

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

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
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
            java.util.logging.Logger.getLogger(registroVisitas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(registroVisitas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(registroVisitas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(registroVisitas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new registroVisitas().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton btnMinimizar;
    public javax.swing.JButton btnSalir;
    public javax.swing.JButton jButton1;
    public javax.swing.JButton jButton2;
    public javax.swing.JButton jButton3;
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JSeparator jSeparator4;
    private javax.swing.JSeparator jSeparator5;
    private javax.swing.JSeparator jSeparator6;
    private javax.swing.JSeparator jSeparator7;
    private javax.swing.JSeparator jSeparator8;
    private javax.swing.JTable jTable1;
    public javax.swing.JTextField jTextField1;
    public javax.swing.JTextField jTextField2;
    public javax.swing.JTextField jTextField4;
    private javax.swing.JTextField jTextField5;
    public javax.swing.JTextField jTextField7;
    public javax.swing.JTextField jTextField8;
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
}
