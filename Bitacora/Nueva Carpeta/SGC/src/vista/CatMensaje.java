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
public class CatMensaje extends javax.swing.JPanel {

    /**
     * Creates new form CatMensaje
     */
    public CatMensaje() {
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

        txtBuscar = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        btnMensaje = new javax.swing.JButton();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jScrollPane1 = new javax.swing.JScrollPane();
        tablaRecibidos = new javax.swing.JTable();
        jScrollPane2 = new javax.swing.JScrollPane();
        tablaEnviados = new javax.swing.JTable();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());
        add(txtBuscar, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 100, 340, -1));

        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel2.setText("Mensaje");
        add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 20, 310, 60));

        btnMensaje.setText("Nuevo Mensaje");
        add(btnMensaje, new org.netbeans.lib.awtextra.AbsoluteConstraints(660, 100, -1, -1));

        jTabbedPane1.setTabPlacement(javax.swing.JTabbedPane.LEFT);

        tablaRecibidos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(tablaRecibidos);

        jTabbedPane1.addTab("Recibidos", jScrollPane1);

        tablaEnviados.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jScrollPane2.setViewportView(tablaEnviados);

        jTabbedPane1.addTab("Enviados", jScrollPane2);

        add(jTabbedPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 189, 780, 370));
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton btnMensaje;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTabbedPane jTabbedPane1;
    public javax.swing.JTable tablaEnviados;
    public javax.swing.JTable tablaRecibidos;
    public javax.swing.JTextField txtBuscar;
    // End of variables declaration//GEN-END:variables
}