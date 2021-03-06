package vista;

import java.awt.Color;
import static java.awt.Color.white;
import java.awt.Component;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import javax.swing.BorderFactory;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JList;
import javax.swing.JScrollBar;
import javax.swing.JTable;
import javax.swing.ListCellRenderer;
import javax.swing.plaf.ComboBoxUI;
import javax.swing.plaf.basic.BasicArrowButton;
import javax.swing.plaf.basic.BasicComboBoxUI;
import javax.swing.plaf.basic.BasicScrollBarUI;
import sun.swing.table.DefaultTableCellHeaderRenderer;


public class VisCuentaPorPagar extends javax.swing.JPanel {

    //Aquí cambias la trasparencia de la barra mientras el cursor está encima. Mientras mál alto el valor, menos transparente
    private static final int SCROLL_BAR_ALPHA_ROLLOVER = 150;
    //Aquí cambias la trasparencia de la barra. Mientras mál alto el valor, menos transparente
    private static final int SCROLL_BAR_ALPHA = 100;
    private static final int THUMB_BORDER_SIZE = 5;
    //Aquí cambias el grosor de la barra
    private static final int THUMB_SIZE = 8;
    //Aquí cambias el color de la barra
    private static final Color THUMB_COLOR = Color.BLUE;

    public VisCuentaPorPagar() {
        initComponents();
        jScrollPane1.getVerticalScrollBar().setUI(new MyScrollBarUI());
        jScrollPane3.getVerticalScrollBar().setUI(new MyScrollBarUI());
        tablaGastos.getTableHeader().setDefaultRenderer(new Headercolor());
        cbxCuenta.setUI(new CustomUI());
        cbxFondo.setUI(new CustomUI());
        cbxFormaPago.setUI(new CustomUI());
        cbxMoneda.setUI(new CustomUI());
        
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        tablaGastos = new javax.swing.JTable();
        jPanel = new javax.swing.JPanel();
        jLabel15 = new javax.swing.JLabel();
        txtGasto = new javax.swing.JTextField();
        jSeparator2 = new javax.swing.JSeparator();
        jLabel2 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        cbxFormaPago = new javax.swing.JComboBox<>();
        jLabel9 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        cbxMoneda = new javax.swing.JComboBox<>();
        jLabel8 = new javax.swing.JLabel();
        cbxFondo = new javax.swing.JComboBox<>();
        jLabel6 = new javax.swing.JLabel();
        txtMonto = new javax.swing.JTextField();
        jSeparator4 = new javax.swing.JSeparator();
        panelReferencia = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        txtReferencia = new javax.swing.JTextField();
        jSeparator6 = new javax.swing.JSeparator();
        jLabel7 = new javax.swing.JLabel();
        cbxCuenta = new javax.swing.JComboBox<>();
        panelPariedad = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        txtPariedad = new javax.swing.JTextField();
        jSeparator3 = new javax.swing.JSeparator();
        txtFecha = new rojeru_san.componentes.RSDateChooser();
        jScrollPane3 = new javax.swing.JScrollPane();
        txtDescripcion = new javax.swing.JTextArea();
        jLabel10 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jSeparator5 = new javax.swing.JSeparator();
        btnProcesar = new javax.swing.JButton();
        jLabel14 = new javax.swing.JLabel();
        btnMostrarProcesados = new javax.swing.JButton();
        btnPagos = new javax.swing.JButton();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jScrollPane1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));

        tablaGastos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        tablaGastos.setRowHeight(35);
        jScrollPane1.setViewportView(tablaGastos);

        add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 500, 890, 170));

        jPanel.setBackground(new java.awt.Color(0, 94, 159));
        jPanel.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel15.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel15.setForeground(new java.awt.Color(255, 255, 255));
        jLabel15.setText("Gasto:");
        jPanel.add(jLabel15, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, -1, 20));

        txtGasto.setBackground(new java.awt.Color(0, 94, 159));
        txtGasto.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtGasto.setForeground(new java.awt.Color(255, 255, 255));
        txtGasto.setBorder(null);
        txtGasto.setEnabled(false);
        txtGasto.setNextFocusableComponent(txtDescripcion);
        jPanel.add(txtGasto, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 10, 240, 20));

        jSeparator2.setForeground(new java.awt.Color(255, 255, 255));
        jPanel.add(jSeparator2, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 30, 240, 10));

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Descripción:");
        jPanel.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 70, 90, 20));

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("<html>\nForma <br> de Pago:\n</html>");
        jPanel.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 136, -1, -1));

        cbxFormaPago.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        cbxFormaPago.setNextFocusableComponent(txtFecha);
        jPanel.add(cbxFormaPago, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 140, 240, 30));

        jLabel9.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText("<html>\nFecha <br> de Pago:\n</html>");
        jPanel.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 190, -1, 40));

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("<HTML>Moneda<BR>a pagar:</HTML>");
        jPanel.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 250, 60, 40));

        cbxMoneda.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        cbxMoneda.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione...", "BOLÍVAR", "DÓLAR" }));
        cbxMoneda.setNextFocusableComponent(cbxFondo);
        jPanel.add(cbxMoneda, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 250, 240, 30));

        jLabel8.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("<html>\nFondo <br> Retirado:\n</html>");
        jPanel.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 20, -1, -1));

        cbxFondo.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        cbxFondo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione una moneda" }));
        cbxFondo.setEnabled(false);
        cbxFondo.setNextFocusableComponent(txtMonto);
        jPanel.add(cbxFondo, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 20, 260, 30));

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("Monto:");
        jPanel.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 80, 70, 20));

        txtMonto.setBackground(new java.awt.Color(0, 94, 159));
        txtMonto.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtMonto.setForeground(new java.awt.Color(255, 255, 255));
        txtMonto.setText("Seleccione un Fondo");
        txtMonto.setBorder(null);
        txtMonto.setEnabled(false);
        txtMonto.setNextFocusableComponent(txtReferencia);
        jPanel.add(txtMonto, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 80, 260, 20));

        jSeparator4.setForeground(new java.awt.Color(255, 255, 255));
        jPanel.add(jSeparator4, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 100, 260, 10));

        panelReferencia.setBackground(new java.awt.Color(0, 94, 159));
        panelReferencia.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("<html>\nNúmero de <br> Referencia:\n</html>");
        panelReferencia.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 10, -1, 40));

        txtReferencia.setBackground(new java.awt.Color(0, 94, 159));
        txtReferencia.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtReferencia.setForeground(new java.awt.Color(255, 255, 255));
        txtReferencia.setBorder(null);
        txtReferencia.setNextFocusableComponent(cbxCuenta);
        panelReferencia.add(txtReferencia, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 20, 260, 20));

        jSeparator6.setForeground(new java.awt.Color(255, 255, 255));
        panelReferencia.add(jSeparator6, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 40, 260, 10));

        jLabel7.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("<html> Cuenta a<br>Transferir: </html>");
        panelReferencia.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 70, -1, -1));

        cbxCuenta.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        cbxCuenta.setNextFocusableComponent(txtPariedad);
        panelReferencia.add(cbxCuenta, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 70, 260, 30));

        jPanel.add(panelReferencia, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 120, 360, 120));

        panelPariedad.setBackground(new java.awt.Color(0, 94, 159));
        panelPariedad.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("<HTML>Tasa de<BR>cambio:</HTML>");
        panelPariedad.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 10, -1, 40));

        txtPariedad.setBackground(new java.awt.Color(0, 94, 159));
        txtPariedad.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtPariedad.setForeground(new java.awt.Color(255, 255, 255));
        txtPariedad.setBorder(null);
        txtPariedad.setNextFocusableComponent(btnProcesar);
        panelPariedad.add(txtPariedad, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 20, 260, 20));

        jSeparator3.setForeground(new java.awt.Color(255, 255, 255));
        panelPariedad.add(jSeparator3, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 40, 260, 10));

        jPanel.add(panelPariedad, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 230, 360, 60));

        txtFecha.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 2, true));
        txtFecha.setForeground(new java.awt.Color(0, 151, 255));
        txtFecha.setColorBackground(new java.awt.Color(0, 94, 159));
        txtFecha.setColorButtonHover(new java.awt.Color(0, 151, 255));
        txtFecha.setColorDiaActual(new java.awt.Color(0, 151, 255));
        txtFecha.setColorForeground(new java.awt.Color(0, 94, 159));
        txtFecha.setFgText(new java.awt.Color(0, 151, 255));
        txtFecha.setFormatoFecha("dd/MM/yyyy");
        txtFecha.setFuente(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jPanel.add(txtFecha, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 190, -1, 40));

        jScrollPane3.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));
        jScrollPane3.setHorizontalScrollBarPolicy(javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        txtDescripcion.setBackground(new java.awt.Color(0, 94, 159));
        txtDescripcion.setColumns(20);
        txtDescripcion.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtDescripcion.setForeground(new java.awt.Color(255, 255, 255));
        txtDescripcion.setLineWrap(true);
        txtDescripcion.setRows(5);
        txtDescripcion.setToolTipText("Ingrese una descripción");
        txtDescripcion.setWrapStyleWord(true);
        jScrollPane3.setViewportView(txtDescripcion);

        jPanel.add(jScrollPane3, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 50, 240, 70));

        add(jPanel, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 60, 760, 290));

        jLabel10.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu700-350 (2).png"))); // NOI18N
        add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 50, 810, 310));

        jLabel12.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 480, 510, 300));

        jLabel13.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(630, 480, -1, 300));

        jLabel11.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(0, 94, 159));
        jLabel11.setText("<html>\nSeleccione en la tabla las <br> facturas a procesar pago.\n</html>");
        add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 400, 210, -1));

        jSeparator5.setBackground(new java.awt.Color(0, 94, 159));
        jSeparator5.setForeground(new java.awt.Color(0, 94, 159));
        jSeparator5.setOrientation(javax.swing.SwingConstants.VERTICAL);
        add(jSeparator5, new org.netbeans.lib.awtextra.AbsoluteConstraints(690, 390, 20, 60));

        btnProcesar.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnProcesar.setForeground(new java.awt.Color(0, 94, 159));
        btnProcesar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/1imageonline-co-merged-image.png"))); // NOI18N
        btnProcesar.setText("<html>\n<br><br><br>Procesar el Pago y Descargar el Recibo\n</html>");
        btnProcesar.setBorder(null);
        btnProcesar.setContentAreaFilled(false);
        btnProcesar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnProcesar.setHideActionText(true);
        btnProcesar.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        btnProcesar.setIconTextGap(10);
        btnProcesar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/2imageonline-co-merged-image.png"))); // NOI18N
        btnProcesar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/2imageonline-co-merged-image.png"))); // NOI18N
        btnProcesar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/2imageonline-co-merged-image.png"))); // NOI18N
        add(btnProcesar, new org.netbeans.lib.awtextra.AbsoluteConstraints(750, 380, 260, 70));

        jLabel14.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        jLabel14.setText("Cuentas por Pagar");
        add(jLabel14, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 10, -1, -1));

        btnMostrarProcesados.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnMostrarProcesados.setForeground(new java.awt.Color(0, 94, 159));
        btnMostrarProcesados.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/management.png"))); // NOI18N
        btnMostrarProcesados.setText("Mostrar Procesado");
        btnMostrarProcesados.setBorder(null);
        btnMostrarProcesados.setBorderPainted(false);
        btnMostrarProcesados.setContentAreaFilled(false);
        btnMostrarProcesados.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnMostrarProcesados.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/management (1).png"))); // NOI18N
        btnMostrarProcesados.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/management.png"))); // NOI18N
        btnMostrarProcesados.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/management.png"))); // NOI18N
        btnMostrarProcesados.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMostrarProcesadosActionPerformed(evt);
            }
        });
        add(btnMostrarProcesados, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 420, -1, -1));

        btnPagos.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        btnPagos.setForeground(new java.awt.Color(0, 94, 159));
        btnPagos.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/invoice.png"))); // NOI18N
        btnPagos.setText("Mostrar Pagos");
        btnPagos.setBorder(null);
        btnPagos.setBorderPainted(false);
        btnPagos.setContentAreaFilled(false);
        btnPagos.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnPagos.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/invoice (1).png"))); // NOI18N
        btnPagos.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/invoice.png"))); // NOI18N
        btnPagos.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/invoice.png"))); // NOI18N
        btnPagos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnPagosActionPerformed(evt);
            }
        });
        add(btnPagos, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 370, 150, 40));
    }// </editor-fold>//GEN-END:initComponents

    private void btnMostrarProcesadosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMostrarProcesadosActionPerformed


    }//GEN-LAST:event_btnMostrarProcesadosActionPerformed

    private void btnPagosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPagosActionPerformed

    }//GEN-LAST:event_btnPagosActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton btnMostrarProcesados;
    public javax.swing.JButton btnPagos;
    public javax.swing.JButton btnProcesar;
    public javax.swing.JComboBox<String> cbxCuenta;
    public javax.swing.JComboBox<String> cbxFondo;
    public javax.swing.JComboBox<String> cbxFormaPago;
    public javax.swing.JComboBox<String> cbxMoneda;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    public javax.swing.JPanel jPanel;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JSeparator jSeparator4;
    private javax.swing.JSeparator jSeparator5;
    private javax.swing.JSeparator jSeparator6;
    public javax.swing.JPanel panelPariedad;
    public javax.swing.JPanel panelReferencia;
    public javax.swing.JTable tablaGastos;
    public javax.swing.JTextArea txtDescripcion;
    public rojeru_san.componentes.RSDateChooser txtFecha;
    public javax.swing.JTextField txtGasto;
    public javax.swing.JTextField txtMonto;
    public javax.swing.JTextField txtPariedad;
    public javax.swing.JTextField txtReferencia;
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
    
    static public class CustomUI extends BasicComboBoxUI{
        
    
    
    public Color blue = new Color(0,94,159);
    
    public static ComboBoxUI createUI(JComponent cbxMoneda) {
        
         return new CustomUI();
     }
 
    @Override 
    public JButton createArrowButton() {        
        BasicArrowButton basicArrowButton = new BasicArrowButton(BasicArrowButton.SOUTH, //Direccion de la flecha
                Color.WHITE, //Color de fondo
                new Color(0,94,159),//sombra
                new Color(0,94,159),//darkShadow
                Color.WHITE //highlight
                );         
        //se quita el efecto 3d del boton, sombra y darkShadow no se aplican 
        basicArrowButton.setBorder(BorderFactory.createLineBorder(blue,2));
        basicArrowButton.setContentAreaFilled(false);        
        return basicArrowButton;
    }        
 
     //Se puede usar un JButton para usar un icono personalizado en lugar del arrow
     /* 
45  @Override 
46  protected JButton createArrowButton() { 
47  JButton button = new JButton(); 
48  //se quita el efecto 3d del boton, sombra y darkShadow no se aplican 
49  button.setText("");
50  button.setBorder(BorderFactory.createLineBorder(red,2));
51  button.setContentAreaFilled(false);
52  button.setIcon( new ImageIcon(getClass().getResource("/org/bolivia/res/estrella.png")) );
53  return button;
54  } 
55  */
     
    
    public void paintCurrentValueBackground(Graphics g, Rectangle bounds, boolean hasFocus)
    {
        
        g.setColor( blue );
        g.setFont(new Font("Tahoma", Font.BOLD, 14));
        g.fillRect(bounds.x, bounds.y, bounds.width, bounds.height);
    }
    
    
     //Pinta los items
    @Override
    public ListCellRenderer createRenderer()
    {
        return new DefaultListCellRenderer() {      
             
        @Override
        public Component getListCellRendererComponent(JList list,Object value,int index,
           boolean isSelected,boolean cellHasFocus) {
       
        super.getListCellRendererComponent(list,value,index,isSelected,cellHasFocus);
        list.setSelectionBackground(blue);
        list.setForeground(white);
        
        if (isSelected)
        {
             setBackground( blue );
             setForeground(new Color(255,255,255));
        }
        else
        {
             setBackground( Color.WHITE );            
             setForeground( new Color(0,94,159));
        }
            
            return this;
            }
        };
        }
    }
    
}
