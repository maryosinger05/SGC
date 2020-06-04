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

public class VisGasto extends javax.swing.JPanel {

    /**
     * Creates new form VisGasto
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
    public VisGasto() {
        initComponents();
        jScrollPane1.getVerticalScrollBar().setUI(new MyScrollBarUI());
        jScrollPane4.getVerticalScrollBar().setUI(new MyScrollBarUI());
        jTable.getTableHeader().setDefaultRenderer(new VisComunicados.Headercolor());
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel2 = new javax.swing.JPanel();
        btnBuscarproveedor = new javax.swing.JButton();
        jLabel9 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jCalcular = new javax.swing.JComboBox<>();
        txtNmeses = new javax.swing.JTextField();
        labelmense = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        barritahorizontal = new javax.swing.JSeparator();
        barrita = new javax.swing.JSeparator();
        jSeparator3 = new javax.swing.JSeparator();
        labelAsamblea = new javax.swing.JLabel();
        jAsamblea = new javax.swing.JComboBox<>();
        jScrollPane4 = new javax.swing.JScrollPane();
        txaObservaciones = new javax.swing.JTextArea();
        no = new javax.swing.JRadioButton();
        fue_elegido = new javax.swing.JLabel();
        si = new javax.swing.JRadioButton();
        jMonthChooser1 = new com.toedter.calendar.JMonthChooser();
        jYearChooser1 = new com.toedter.calendar.JYearChooser();
        txtProveedor = new javax.swing.JTextField();
        jcombotipo = new javax.swing.JComboBox<>();
        jLabel21 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jSeparator4 = new javax.swing.JSeparator();
        jLabel3 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable = new javax.swing.JTable();
        jLabel10 = new javax.swing.JLabel();
        btnSalir = new javax.swing.JButton();
        jLabel12 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        btnGuardar = new javax.swing.JButton();
        btnModificar = new javax.swing.JButton();
        btnLimpiar = new javax.swing.JButton();
        jSeparator8 = new javax.swing.JSeparator();
        jSeparator9 = new javax.swing.JSeparator();
        btnEliminar = new javax.swing.JButton();
        jSeparator10 = new javax.swing.JSeparator();
        jLabel11 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        txtid = new javax.swing.JTextField();
        jLabel17 = new javax.swing.JLabel();
        jLabel18 = new javax.swing.JLabel();
        jLabel19 = new javax.swing.JLabel();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel2.setBackground(new java.awt.Color(0, 94, 159));
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnBuscarproveedor.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/busqueda.png"))); // NOI18N
        btnBuscarproveedor.setToolTipText("Buscar proveedor");
        btnBuscarproveedor.setBorder(null);
        btnBuscarproveedor.setBorderPainted(false);
        btnBuscarproveedor.setContentAreaFilled(false);
        btnBuscarproveedor.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        btnBuscarproveedor.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/busqueda (1).png"))); // NOI18N
        btnBuscarproveedor.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/busqueda (1).png"))); // NOI18N
        btnBuscarproveedor.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/busqueda (1).png"))); // NOI18N
        jPanel2.add(btnBuscarproveedor, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 60, 40, 40));

        jLabel9.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText("Proveedor:");
        jPanel2.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 80, -1, 20));

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Calcular Por:");
        jPanel2.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 220, 90, -1));

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("<html>\nComienzo de <br> Cobro (Mes):\n</html>");
        jPanel2.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 280, -1, -1));

        jCalcular.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jCalcular.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Alicuota", "Total de Inmuebles" }));
        jCalcular.setToolTipText("Calcular la cuota especial por...");
        jPanel2.add(jCalcular, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 220, 260, -1));

        txtNmeses.setBackground(new java.awt.Color(0, 94, 159));
        txtNmeses.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtNmeses.setForeground(new java.awt.Color(255, 255, 255));
        txtNmeses.setToolTipText("Ingrese el número de meses que aplica");
        txtNmeses.setBorder(null);
        jPanel2.add(txtNmeses, new org.netbeans.lib.awtextra.AbsoluteConstraints(550, 10, 230, 20));

        labelmense.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        labelmense.setForeground(new java.awt.Color(255, 255, 255));
        labelmense.setText("<html> Número de Meses <br> que Aplica: </html>");
        jPanel2.add(labelmense, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 0, 130, -1));

        jLabel7.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Observaciones:");
        jPanel2.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 180, 110, -1));

        barritahorizontal.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(barritahorizontal, new org.netbeans.lib.awtextra.AbsoluteConstraints(550, 30, 230, 20));

        barrita.setForeground(new java.awt.Color(255, 255, 255));
        barrita.setOrientation(javax.swing.SwingConstants.VERTICAL);
        barrita.setOpaque(true);
        jPanel2.add(barrita, new org.netbeans.lib.awtextra.AbsoluteConstraints(600, 90, -1, 20));

        jSeparator3.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator3, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 160, 240, 20));

        labelAsamblea.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        labelAsamblea.setForeground(new java.awt.Color(255, 255, 255));
        labelAsamblea.setText("Asamblea:");
        jPanel2.add(labelAsamblea, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 130, 80, 20));

        jAsamblea.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jAsamblea.setToolTipText("Seleccione una asamblea");
        jPanel2.add(jAsamblea, new org.netbeans.lib.awtextra.AbsoluteConstraints(550, 130, 230, -1));

        jScrollPane4.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));
        jScrollPane4.setHorizontalScrollBarPolicy(javax.swing.ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        txaObservaciones.setBackground(new java.awt.Color(0, 94, 159));
        txaObservaciones.setColumns(20);
        txaObservaciones.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txaObservaciones.setForeground(new java.awt.Color(255, 255, 255));
        txaObservaciones.setLineWrap(true);
        txaObservaciones.setRows(5);
        txaObservaciones.setToolTipText("Ingrese observaciones (opcional)");
        txaObservaciones.setWrapStyleWord(true);
        jScrollPane4.setViewportView(txaObservaciones);

        jPanel2.add(jScrollPane4, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 200, 360, 120));

        no.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        no.setForeground(new java.awt.Color(255, 255, 255));
        no.setText("No");
        no.setToolTipText("");
        no.setContentAreaFilled(false);
        no.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        no.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/dot.png"))); // NOI18N
        no.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/dot (1).png"))); // NOI18N
        no.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/radio-on-button (1).png"))); // NOI18N
        no.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/radio-on-button.png"))); // NOI18N
        jPanel2.add(no, new org.netbeans.lib.awtextra.AbsoluteConstraints(610, 90, -1, -1));

        fue_elegido.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        fue_elegido.setForeground(new java.awt.Color(255, 255, 255));
        fue_elegido.setText("¿Fué elegido en una asamblea?");
        jPanel2.add(fue_elegido, new org.netbeans.lib.awtextra.AbsoluteConstraints(500, 60, -1, -1));

        si.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        si.setForeground(new java.awt.Color(255, 255, 255));
        si.setText("Si");
        si.setContentAreaFilled(false);
        si.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        si.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/dot.png"))); // NOI18N
        si.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/dot (1).png"))); // NOI18N
        si.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/radio-on-button (1).png"))); // NOI18N
        si.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/radio-on-button.png"))); // NOI18N
        jPanel2.add(si, new org.netbeans.lib.awtextra.AbsoluteConstraints(550, 90, -1, -1));

        jMonthChooser1.setToolTipText("Seleccione el mes");
        jPanel2.add(jMonthChooser1, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 290, 130, 30));

        jYearChooser1.setToolTipText("Seleccione el año");
        jYearChooser1.setDayChooser(null);
        jPanel2.add(jYearChooser1, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 290, 70, 30));

        txtProveedor.setEditable(false);
        txtProveedor.setBackground(new java.awt.Color(0, 94, 159));
        txtProveedor.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtProveedor.setForeground(new java.awt.Color(255, 255, 255));
        txtProveedor.setBorder(null);
        jPanel2.add(txtProveedor, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 80, 240, 20));

        jcombotipo.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jcombotipo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Extraordinario", "Ordinario" }));
        jcombotipo.setToolTipText("Seleccione el tipo de gasto");
        jPanel2.add(jcombotipo, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 20, 260, -1));

        jLabel21.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel21.setForeground(new java.awt.Color(255, 255, 255));
        jLabel21.setText("<html>\nTipo de <br> Gasto:\n</html>");
        jPanel2.add(jLabel21, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 10, 60, -1));

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 140, 240, 20));

        jSeparator4.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator4, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 100, 240, 20));

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("<html> Nombre del <br> proveedor:</html>");
        jPanel2.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 124, -1, 40));

        add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 60, 780, 340));

        jScrollPane1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));

        jTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Concepto", "Descripción", "Categoría", "Seleccione"
            }
        ));
        jTable.setRowHeight(35);
        jScrollPane1.setViewportView(jTable);

        add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 440, 460, 110));

        jLabel10.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu700-350 (2).png"))); // NOI18N
        add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 110, 800, 300));

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
        add(btnSalir, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, -1, 30));

        jLabel12.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        jLabel12.setText("Registro de Cuotas Especiales");
        add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 20, -1, -1));

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
        jPanel3.add(jSeparator8, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 0, 10, 70));

        jSeparator9.setForeground(new java.awt.Color(255, 255, 255));
        jSeparator9.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jPanel3.add(jSeparator9, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 0, 10, 70));

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

        jSeparator10.setForeground(new java.awt.Color(255, 255, 255));
        jSeparator10.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jPanel3.add(jSeparator10, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 0, 10, 70));

        add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(240, 590, 360, 80));

        jLabel11.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondobtn1chiqui.png"))); // NOI18N
        add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(240, 560, -1, 100));

        jLabel14.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu700-350 (2).png"))); // NOI18N
        add(jLabel14, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 50, 800, 300));

        txtid.setEditable(false);
        add(txtid, new org.netbeans.lib.awtextra.AbsoluteConstraints(680, 430, -1, -1));

        jLabel17.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel17.setForeground(new java.awt.Color(0, 94, 159));
        jLabel17.setText("Seleccione el concepto gasto");
        add(jLabel17, new org.netbeans.lib.awtextra.AbsoluteConstraints(330, 410, -1, -1));

        jLabel18.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondofomu340-130.png"))); // NOI18N
        add(jLabel18, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 430, -1, -1));

        jLabel19.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondofomu340-130.png"))); // NOI18N
        add(jLabel19, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 430, -1, -1));
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JSeparator barrita;
    public javax.swing.JSeparator barritahorizontal;
    public javax.swing.JButton btnBuscarproveedor;
    public javax.swing.JButton btnEliminar;
    public javax.swing.JButton btnGuardar;
    public javax.swing.JButton btnLimpiar;
    public javax.swing.JButton btnModificar;
    public javax.swing.JButton btnSalir;
    public javax.swing.JLabel fue_elegido;
    public javax.swing.JComboBox<String> jAsamblea;
    public javax.swing.JComboBox<String> jCalcular;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel19;
    public javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel9;
    public com.toedter.calendar.JMonthChooser jMonthChooser1;
    public javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JSeparator jSeparator10;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JSeparator jSeparator4;
    private javax.swing.JSeparator jSeparator8;
    private javax.swing.JSeparator jSeparator9;
    public javax.swing.JTable jTable;
    public com.toedter.calendar.JYearChooser jYearChooser1;
    public javax.swing.JComboBox<String> jcombotipo;
    public javax.swing.JLabel labelAsamblea;
    public javax.swing.JLabel labelmense;
    public javax.swing.JRadioButton no;
    public javax.swing.JRadioButton si;
    public javax.swing.JTextArea txaObservaciones;
    public javax.swing.JTextField txtNmeses;
    public javax.swing.JTextField txtProveedor;
    public javax.swing.JTextField txtid;
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
