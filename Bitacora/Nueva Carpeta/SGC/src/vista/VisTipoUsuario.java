/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

/**
 *
 * @author Jhen
 */
public class VisTipoUsuario extends javax.swing.JPanel {

    /**
     * Creates new form TipoUsuario1
     */
    public VisTipoUsuario() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnSalir = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        txtTipo = new javax.swing.JTextField();
        jSeparator4 = new javax.swing.JSeparator();
        jScrollPane1 = new javax.swing.JScrollPane();
        tabla = new javax.swing.JTable();
        jLabel10 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        btnGuardar = new javax.swing.JButton();
        btnModificar = new javax.swing.JButton();
        jSeparator8 = new javax.swing.JSeparator();
        jLabel3 = new javax.swing.JLabel();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (1).png"))); // NOI18N
        btnSalir.setToolTipText("Cerrar");
        btnSalir.setBorder(null);
        btnSalir.setBorderPainted(false);
        btnSalir.setContentAreaFilled(false);
        btnSalir.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        btnSalir.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        add(btnSalir, new org.netbeans.lib.awtextra.AbsoluteConstraints(1280, 10, -1, 30));

        jPanel2.setBackground(new java.awt.Color(0, 94, 159));
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Tipo de Usuario:");
        jPanel2.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 10, -1, 20));

        txtTipo.setBackground(new java.awt.Color(0, 94, 159));
        txtTipo.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtTipo.setForeground(new java.awt.Color(255, 255, 255));
        txtTipo.setToolTipText("Ingrese el nombre del tipo de usuario");
        txtTipo.setBorder(null);
        jPanel2.add(txtTipo, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 10, 230, 20));

        jSeparator4.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator4, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 30, 230, 10));

        jScrollPane1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));

        tabla.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {"Asambleas", null},
                {"Banco", null},
                {"Comunicados", null},
                {"Condominio", null},
                {"Cuenta", null},
                {"Cuentas por Cobrar", null},
                {"Cuentas por Pagar", null},
                {"Cuotas Especiales", null},
                {"Fondo", null},
                {"Gastos Comunes", null},
                {"Intereses", null},
                {"Pago de Cuotas Especiales", null},
                {"Propietarios", null},
                {"Proovedores", null},
                {"Recibo", null},
                {"Sanciones", null},
                {"Tipo de Usuario", null},
                {"Unidades", null},
                {"Registro de Visitas", null},
                {"Visitas Autorizadas", null}
            },
            new String [] {
                "Maestro ó Proceso", "Seleccione"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, true
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tabla.setToolTipText("Seleccione los modulos a los que tendra acceso el usuario");
        tabla.setRowHeight(20);
        jScrollPane1.setViewportView(tabla);

        jPanel2.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 50, 480, 220));

        add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 90, 480, 270));

        jLabel10.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 80, 500, 300));

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Tipo Usuario");
        add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 20, 1320, -1));

        jPanel3.setBackground(new java.awt.Color(0, 94, 159));
        jPanel3.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnGuardar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/salvar.png"))); // NOI18N
        btnGuardar.setToolTipText("Guardar");
        btnGuardar.setBorder(null);
        btnGuardar.setBorderPainted(false);
        btnGuardar.setContentAreaFilled(false);
        btnGuardar.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        btnGuardar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/disco-flexible (2).png"))); // NOI18N
        btnGuardar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/disco-flexible (2).png"))); // NOI18N
        btnGuardar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/disco-flexible (2).png"))); // NOI18N
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });
        jPanel3.add(btnGuardar, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 70, -1));
        //btnGuardar.addActionListener(ctrl);

        btnModificar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/contrato.png"))); // NOI18N
        btnModificar.setToolTipText("Modificar");
        btnModificar.setBorder(null);
        btnModificar.setBorderPainted(false);
        btnModificar.setContentAreaFilled(false);
        btnModificar.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        btnModificar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/contrato (1).png"))); // NOI18N
        btnModificar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/contrato (1).png"))); // NOI18N
        btnModificar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/contrato (1).png"))); // NOI18N
        jPanel3.add(btnModificar, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 0, 70, 70));
        //btnMinimizar.addActionListener(ctrl);

        jSeparator8.setForeground(new java.awt.Color(255, 255, 255));
        jSeparator8.setOrientation(javax.swing.SwingConstants.VERTICAL);
        jPanel3.add(jSeparator8, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 0, 10, 70));

        add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(530, 570, 240, 70));

        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondobtn1chiqui.png"))); // NOI18N
        add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 560, -1, 90));
    }// </editor-fold>//GEN-END:initComponents

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnGuardarActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton btnGuardar;
    public javax.swing.JButton btnModificar;
    public javax.swing.JButton btnSalir;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSeparator jSeparator4;
    private javax.swing.JSeparator jSeparator8;
    public javax.swing.JTable tabla;
    public javax.swing.JTextField txtTipo;
    // End of variables declaration//GEN-END:variables
}
