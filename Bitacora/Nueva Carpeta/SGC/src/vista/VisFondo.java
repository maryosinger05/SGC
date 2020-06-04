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
import javax.swing.JScrollBar;
import javax.swing.JTable;
import javax.swing.plaf.basic.BasicScrollBarUI;
import sun.swing.table.DefaultTableCellHeaderRenderer;

/**
 *
 * @author Jhen
 */
public class VisFondo extends javax.swing.JPanel {

    /**
     * Creates new form VisFondo
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
    public VisFondo() {
        initComponents();
        jScrollPane3.getVerticalScrollBar().setUI(new MyScrollBarUI());
        jScrollPane4.getVerticalScrollBar().setUI(new MyScrollBarUI());
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        btnGuardar = new javax.swing.JButton();
        btnModificar = new javax.swing.JButton();
        btnLimpiar = new javax.swing.JButton();
        jSeparator8 = new javax.swing.JSeparator();
        jSeparator9 = new javax.swing.JSeparator();
        jSeparator10 = new javax.swing.JSeparator();
        btnEliminar = new javax.swing.JButton();
        jLabel11 = new javax.swing.JLabel();
        txtId = new javax.swing.JTextField();
        btnSalir = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txtMontoInicial = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jSeparator3 = new javax.swing.JSeparator();
        jSeparator4 = new javax.swing.JSeparator();
        txtTipo = new javax.swing.JTextField();
        jScrollPane3 = new javax.swing.JScrollPane();
        txaObservaciones = new javax.swing.JTextArea();
        jScrollPane4 = new javax.swing.JScrollPane();
        txaDescripcion = new javax.swing.JTextArea();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jLabel9 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 94, 159), 5, true));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel3.setBackground(new java.awt.Color(0, 94, 159));
        jPanel3.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/salvar.png"))); // NOI18N
        btnGuardar.setToolTipText("Guardar");
        btnGuardar.setBorder(null);
        btnGuardar.setBorderPainted(false);
        btnGuardar.setContentAreaFilled(false);
        btnGuardar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnGuardar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/disco-flexible (2).png"))); // NOI18N
        btnGuardar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/disco-flexible (2).png"))); // NOI18N
        btnGuardar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/disco-flexible (2).png"))); // NOI18N
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });
        jPanel3.add(btnGuardar, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 0, 70, -1));
        //btnGuardar.addActionListener(ctrl);

        btnModificar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/contrato.png"))); // NOI18N
        btnModificar.setToolTipText("Modificar");
        btnModificar.setBorder(null);
        btnModificar.setBorderPainted(false);
        btnModificar.setContentAreaFilled(false);
        btnModificar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnModificar.setEnabled(false);
        btnModificar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/contrato (1).png"))); // NOI18N
        btnModificar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/contrato (1).png"))); // NOI18N
        btnModificar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/contrato (1).png"))); // NOI18N
        jPanel3.add(btnModificar, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 0, 70, 70));
        //btnMinimizar.addActionListener(ctrl);

        btnLimpiar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/barriendo.png"))); // NOI18N
        btnLimpiar.setToolTipText("Limpiar todo");
        btnLimpiar.setBorderPainted(false);
        btnLimpiar.setContentAreaFilled(false);
        btnLimpiar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnLimpiar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/barriendo (1).png"))); // NOI18N
        btnLimpiar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/barriendo (1).png"))); // NOI18N
        btnLimpiar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/barriendo (1).png"))); // NOI18N
        jPanel3.add(btnLimpiar, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 0, 70, 70));

        jSeparator8.setForeground(new java.awt.Color(255, 255, 255));
        jSeparator8.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jPanel3.add(jSeparator8, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 0, 10, 70));

        jSeparator9.setForeground(new java.awt.Color(255, 255, 255));
        jSeparator9.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jPanel3.add(jSeparator9, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 0, 10, 70));

        jSeparator10.setForeground(new java.awt.Color(255, 255, 255));
        jSeparator10.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jPanel3.add(jSeparator10, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 0, 10, 70));

        btnEliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/borrar (4).png"))); // NOI18N
        btnEliminar.setToolTipText("Eliminar");
        btnEliminar.setBorder(null);
        btnEliminar.setBorderPainted(false);
        btnEliminar.setContentAreaFilled(false);
        btnEliminar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnEliminar.setEnabled(false);
        btnEliminar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/borrar (2).png"))); // NOI18N
        btnEliminar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/borrar (2).png"))); // NOI18N
        btnEliminar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/borrar (2).png"))); // NOI18N
        jPanel3.add(btnEliminar, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 0, 70, 70));
        //btnMinimizar.addActionListener(ctrl);

        jPanel1.add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 410, 360, 90));

        jLabel11.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondobtn1chiqui.png"))); // NOI18N
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 370, -1, 120));
        jPanel1.add(txtId, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 390, -1, -1));

        btnSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/left-arrow.png"))); // NOI18N
        btnSalir.setToolTipText("Volver al catálogo");
        btnSalir.setBorder(null);
        btnSalir.setBorderPainted(false);
        btnSalir.setContentAreaFilled(false);
        btnSalir.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnSalir.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/left-arrow.png"))); // NOI18N
        btnSalir.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/left-arrow (1).png"))); // NOI18N
        btnSalir.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/left-arrow (1).png"))); // NOI18N
        btnSalir.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/left-arrow (1).png"))); // NOI18N
        jPanel1.add(btnSalir, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, -1, 30));

        jPanel2.setBackground(new java.awt.Color(0, 94, 159));
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Descripción:");
        jPanel2.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 150, 120, -1));

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Observaciones:");
        jPanel2.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 10, -1, -1));

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Fecha:");
        jPanel2.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 10, 50, -1));

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("<html>\nMonto <br> Inicial:\n</hmtl>");
        jPanel2.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 190, -1, 30));

        txtMontoInicial.setBackground(new java.awt.Color(0, 94, 159));
        txtMontoInicial.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtMontoInicial.setForeground(new java.awt.Color(255, 255, 255));
        txtMontoInicial.setToolTipText("ingrese el fondo inicial");
        txtMontoInicial.setBorder(null);
        txtMontoInicial.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtMontoInicialActionPerformed(evt);
            }
        });
        jPanel2.add(txtMontoInicial, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 200, 120, 20));

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Tipo:");
        jPanel2.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 100, 40, -1));

        jSeparator3.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator3, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 120, 130, 10));

        jSeparator4.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator4, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 220, 120, 10));

        txtTipo.setBackground(new java.awt.Color(0, 94, 159));
        txtTipo.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtTipo.setForeground(new java.awt.Color(255, 255, 255));
        txtTipo.setToolTipText("Ingrese el tipo de fondo");
        txtTipo.setBorder(null);
        jPanel2.add(txtTipo, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 100, 130, 20));

        jScrollPane3.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));
        jScrollPane3.setHorizontalScrollBarPolicy(javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        txaObservaciones.setBackground(new java.awt.Color(0, 94, 159));
        txaObservaciones.setColumns(20);
        txaObservaciones.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txaObservaciones.setForeground(new java.awt.Color(255, 255, 255));
        txaObservaciones.setLineWrap(true);
        txaObservaciones.setRows(5);
        txaObservaciones.setToolTipText("Ingrese las observaciones");
        txaObservaciones.setWrapStyleWord(true);
        txaObservaciones.setBorder(null);
        jScrollPane3.setViewportView(txaObservaciones);

        jPanel2.add(jScrollPane3, new org.netbeans.lib.awtextra.AbsoluteConstraints(198, 30, 280, 110));

        jScrollPane4.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));
        jScrollPane4.setHorizontalScrollBarPolicy(javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        txaDescripcion.setBackground(new java.awt.Color(0, 94, 159));
        txaDescripcion.setColumns(20);
        txaDescripcion.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txaDescripcion.setForeground(new java.awt.Color(255, 255, 255));
        txaDescripcion.setLineWrap(true);
        txaDescripcion.setRows(5);
        txaDescripcion.setToolTipText("Ingrese la descripción");
        txaDescripcion.setWrapStyleWord(true);
        txaDescripcion.setBorder(null);
        jScrollPane4.setViewportView(txaDescripcion);

        jPanel2.add(jScrollPane4, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 170, 280, 110));

        jDateChooser1.setToolTipText("Ingrese la fecha");
        jPanel2.add(jDateChooser1, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 10, 140, -1));
        jDateChooser1.getDateEditor().setEnabled(false);

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 70, -1, -1));

        jLabel9.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        jLabel9.setText("Fondos");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 20, -1, -1));

        jLabel8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 60, -1, -1));

        add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 80, 560, -1));
    }// </editor-fold>//GEN-END:initComponents

    private void txtMontoInicialActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtMontoInicialActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtMontoInicialActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnGuardarActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton btnEliminar;
    public javax.swing.JButton btnGuardar;
    public javax.swing.JButton btnLimpiar;
    public javax.swing.JButton btnModificar;
    public javax.swing.JButton btnSalir;
    public com.toedter.calendar.JDateChooser jDateChooser1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    public javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JSeparator jSeparator10;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JSeparator jSeparator4;
    private javax.swing.JSeparator jSeparator8;
    private javax.swing.JSeparator jSeparator9;
    public javax.swing.JTextArea txaDescripcion;
    public javax.swing.JTextArea txaObservaciones;
    public javax.swing.JTextField txtId;
    public javax.swing.JTextField txtMontoInicial;
    public javax.swing.JTextField txtTipo;
    // End of variables declaration//GEN-END:variables
static public class Headercolor extends DefaultTableCellHeaderRenderer {

        public Headercolor() {
            setOpaque(true);
        }

        public Component getTableCellRendererComponent(JTable jTable1, Object value, boolean selected, boolean focused, int row, int column) {
            super.getTableCellRendererComponent(jTable1, value, selected, focused, row, column);
            setBackground(new java.awt.Color(0, 94, 159));
            setForeground(Color.white);
            setFont(new Font("Tahoma", Font.BOLD, 14));
            return this;
        }
    }

    public class MyScrollBarUI extends BasicScrollBarUI {

        @Override
        public void paintTrack(Graphics g, JComponent c, Rectangle trackBounds) {
            trackBounds.contains(thumbRect);
            g.setColor(new java.awt.Color(255, 255, 255));
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