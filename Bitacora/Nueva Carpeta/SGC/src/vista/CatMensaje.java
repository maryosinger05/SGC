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
public class CatMensaje extends javax.swing.JPanel {

    /**
     * Creates new form CatMensaje
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
    public CatMensaje() {
        initComponents();
        jScrollPane1.getVerticalScrollBar().setUI(new MyScrollBarUI());
        jScrollPane2.getVerticalScrollBar().setUI(new MyScrollBarUI());
        tablaRecibidos.getTableHeader().setDefaultRenderer(new VisMensaje.Headercolor());
        tablaEnviados.getTableHeader().setDefaultRenderer(new VisMensaje.Headercolor());
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        txtBuscar = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        btnMensaje = new javax.swing.JButton();
        panelBandejas = new javax.swing.JTabbedPane();
        jScrollPane2 = new javax.swing.JScrollPane();
        tablaEnviados = new javax.swing.JTable();
        jScrollPane1 = new javax.swing.JScrollPane();
        tablaRecibidos = new javax.swing.JTable();
        btnEliminar = new javax.swing.JButton();
        jSeparator6 = new javax.swing.JSeparator();

        setBackground(new java.awt.Color(255, 255, 255));
        setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 94, 159), 5, true));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        txtBuscar.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtBuscar.setBorder(null);
        add(txtBuscar, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 100, 340, 20));

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel2.setText("Mensaje");
        add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 10, 310, 60));

        btnMensaje.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        btnMensaje.setForeground(new java.awt.Color(0, 94, 159));
        btnMensaje.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/email.png"))); // NOI18N
        btnMensaje.setText("Nuevo Mensaje");
        btnMensaje.setToolTipText("Crear un nuevo mensaje");
        btnMensaje.setBorder(null);
        btnMensaje.setBorderPainted(false);
        btnMensaje.setContentAreaFilled(false);
        btnMensaje.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnMensaje.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/email.png"))); // NOI18N
        btnMensaje.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/email (1).png"))); // NOI18N
        btnMensaje.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/email (1).png"))); // NOI18N
        btnMensaje.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/email (1).png"))); // NOI18N
        add(btnMensaje, new org.netbeans.lib.awtextra.AbsoluteConstraints(610, 70, 160, -1));

        panelBandejas.setTabPlacement(javax.swing.JTabbedPane.LEFT);
        panelBandejas.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        panelBandejas.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N

        jScrollPane2.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));

        tablaEnviados.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        tablaEnviados.setRowHeight(35);
        jScrollPane2.setViewportView(tablaEnviados);

        panelBandejas.addTab("Enviados", jScrollPane2);

        jScrollPane1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));

        tablaRecibidos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        tablaRecibidos.setRowHeight(35);
        jScrollPane1.setViewportView(tablaRecibidos);

        panelBandejas.addTab("Recibidos", jScrollPane1);

        add(panelBandejas, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 189, 780, 370));

        btnEliminar.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        btnEliminar.setForeground(new java.awt.Color(0, 94, 159));
        btnEliminar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eemail.png"))); // NOI18N
        btnEliminar.setText(" Eliminar");
        btnEliminar.setBorder(null);
        btnEliminar.setBorderPainted(false);
        btnEliminar.setContentAreaFilled(false);
        btnEliminar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnEliminar.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eemail.png"))); // NOI18N
        btnEliminar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eemail (1).png"))); // NOI18N
        btnEliminar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eemail (1).png"))); // NOI18N
        btnEliminar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/eemail (1).png"))); // NOI18N
        add(btnEliminar, new org.netbeans.lib.awtextra.AbsoluteConstraints(610, 120, 110, -1));

        jSeparator6.setBackground(new java.awt.Color(0, 94, 159));
        jSeparator6.setForeground(new java.awt.Color(0, 94, 159));
        add(jSeparator6, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 120, 340, 10));
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton btnEliminar;
    public javax.swing.JButton btnMensaje;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JSeparator jSeparator6;
    public javax.swing.JTabbedPane panelBandejas;
    public javax.swing.JTable tablaEnviados;
    public javax.swing.JTable tablaRecibidos;
    public javax.swing.JTextField txtBuscar;
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
