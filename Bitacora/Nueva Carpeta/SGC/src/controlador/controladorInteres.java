/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import static java.lang.String.valueOf;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.RowFilter;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableRowSorter;
import modelo.Condominio;
import modelo.Interes;
import vista.catalogoInteres;
import vista.interes;

/**
 *
 * @author rma
 */
public class controladorInteres implements ActionListener, MouseListener, KeyListener, WindowListener {

    private interes in;
    private catalogoInteres catain;
    ArrayList<Condominio> listaCondo;
    private Condominio modcon;
    private Interes modin;
    DefaultTableModel dm;
    ArrayList<Interes> listainteres;
    ArrayList<Interes> listainteresmod;

    public controladorInteres(interes in, catalogoInteres catain, Condominio modcon, Interes modin) {
        this.in = in;
        this.catain = catain;
        this.modcon=modcon;
        this.modin=modin;

        this.catain.jButton2.addActionListener(this);
        this.catain.jTable1.addMouseListener(this);
        this.catain.jTextField1.addKeyListener(this);
        this.catain.addWindowListener(this);

        this.in.btnGuardar.addActionListener(this);
        this.in.btnLimpiar.addActionListener(this);
        this.in.btnModificar.addActionListener(this);
        this.in.btnEliminar.addActionListener(this);
    }

    public void Llenartablacondominio(JTable tablaD) {

        listaCondo = modcon.lPerson();
        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {

                boolean resu = false;
                if (column == 0) {
                    resu = false;
                }
                if (column == 1) {
                    resu = false;
                }
                if (column == 2) {
                    resu = true;
                }
                return resu;
            }
        };
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);

        modeloT.addColumn("Rif");
        modeloT.addColumn("Razónn Social");
        modeloT.addColumn("Seleccione");

        Object[] columna = new Object[2];

        int numRegistro = listaCondo.size();

        for (int i = 0; i < numRegistro; i++) {
            System.out.println(listaCondo.get(i).getRif());
            columna[0] = listaCondo.get(i).getRif();
            columna[1] = listaCondo.get(i).getRazonS();

            modeloT.addRow(columna);

        }
        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);
        tablaD.getColumnModel().getColumn(0).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(1).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(2).setCellRenderer(tcr);
    }
    
    public void Llenartablainteres(JTable tablaD) {

        listainteres = modin.listarInteres();
        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {

                return false;
            }
            

        };
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);

        modeloT.addColumn("<html>Nº de <br> Interes</html>");
        modeloT.addColumn("<html>Nombre de<br> Interes</html>");
        modeloT.addColumn("Factor");
        modeloT.addColumn("<html>Nº de <br> Condominios</html>");
        modeloT.addColumn("Estatus");

        Object[] columna = new Object[5];

        int numRegistro = listainteres.size();

        for (int i = 0; i < numRegistro; i++) {

            columna[0] = listainteres.get(i).getId();
            columna[1] = listainteres.get(i).getNombre();
            columna[2] = listainteres.get(i).getFactor();
            columna[3] = listainteres.get(i).getN_condominios();
            columna[4] = listainteres.get(i).getEstado();

            modeloT.addRow(columna);

        }
        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);
        tablaD.getColumnModel().getColumn(0).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(1).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(2).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(3).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(4).setCellRenderer(tcr);
    }
    
     public void llenartablacondominiomod(JTable tablaD) {
        listainteresmod = modin.interescondominiomodificar();
        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {

                boolean resu = false;
                if (column == 0) {
                    resu = false;
                }
                if (column == 1) {
                    resu = false;
                }
                if (column == 2) {
                    resu = true;
                }
                return resu;
            }
        };
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);

        modeloT.addColumn("Rif");
        modeloT.addColumn("Razónn Social");
        modeloT.addColumn("Selecione");

        Object[] columna = new Object[3];

        int numRegistro = listainteresmod.size();
       

        for (int i = 0; i < numRegistro; i++) {

            columna[0] = listainteresmod.get(i).getRif();
            columna[1] = listainteresmod.get(i).getRazonS();
            

            if (listainteresmod.get(i).getN_condominios()!= 0) {
                columna[2] = Boolean.TRUE;
            } else {
                columna[2] = Boolean.FALSE;
            }

            modeloT.addRow(columna);

        }
        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);
        tablaD.getColumnModel().getColumn(0).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(1).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(2).setCellRenderer(tcr);
    }

    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == catain.jButton2) {
            this.in.setVisible(true);
            this.in.btnModificar.setEnabled(false);
            this.in.btnGuardar.setEnabled(true);
            this.in.btnEliminar.setEnabled(false);
            Llenartablacondominio(in.jTable1);
            addCheckBox(2, in.jTable1);
            in.txtId.setVisible(false);
            in.txtFactor.setText("");
            in.txtNombreinteres.setText("");
        }

        if (e.getSource() == in.btnGuardar) {
            modin.setNombre(in.txtNombreinteres.getText());
            modin.setFactor(Integer.parseInt(in.txtFactor.getText()));
            modin.setEstado("Activo");
            
            
            if (modin.registrarinteres(modin)) {
                    modin.buscId(modin);
                    JOptionPane.showMessageDialog(null, "Registro Guardado");

                    for (int i = 0; i < in.jTable1.getRowCount(); i++) {
                       if (valueOf(in.jTable1.getValueAt(i, 2)) == "true") {

                            String valor = String.valueOf(in.jTable1.getValueAt(i, 0));
                            modin.setId_condominio(valor);

                            modin.registrar_interes_condominio(modin);

                        }
                    }
                    Llenartablainteres(catain.jTable1);
            }
                   

        }

        if (e.getSource() == in.btnModificar) {
            modin.setNombre(in.txtNombreinteres.getText());
            modin.setFactor(Double.parseDouble(in.txtFactor.getText()));
            modin.setEstado("Activo");
            modin.setId(Integer.parseInt(in.txtId.getText()));
            
            
            if (modin.modificar_Interes(modin)) {
                    
                    JOptionPane.showMessageDialog(null, "Registro Modificado");
                    modin.borrarpuente(modin);

                    for (int i = 0; i < in.jTable1.getRowCount(); i++) {
                       if (valueOf(in.jTable1.getValueAt(i, 2)) == "true") {

                            String valor = String.valueOf(in.jTable1.getValueAt(i, 0));
                            modin.setId_condominio(valor);

                            modin.registrar_interes_condominio(modin);

                        }
                    }
                    Llenartablainteres(catain.jTable1);
                    in.dispose();
            }

        }
        
         if (e.getSource() == in.btnEliminar) {
            modin.setId(Integer.parseInt(in.txtId.getText()));
            modin.borrarpuente(modin);
            modin.eliminarInteres(modin);
            JOptionPane.showMessageDialog(null, "registro eliminado");
            in.dispose();
            Llenartablainteres(catain.jTable1);
        }
    }
    
    public void addCheckBox(int column, JTable table) {
        TableColumn tc = table.getColumnModel().getColumn(column);
        tc.setCellEditor(table.getDefaultEditor(Boolean.class));
        tc.setCellRenderer(table.getDefaultRenderer(Boolean.class));
    }
    
    private Boolean validar() {

        Boolean resultado = true;
        String msj = "";

        if (in.txtFactor.getText().isEmpty()) {

            msj += "El campo numero de Cuenta no puede estar vacio\n";
            resultado = false;
        }

        

        if (!resultado) {

            JOptionPane.showMessageDialog(null, msj, "Advertencia", JOptionPane.WARNING_MESSAGE);
        }

        return resultado;
    }
    
    private void filtro(String consulta, JTable jtableBuscar) {
        dm = (DefaultTableModel) jtableBuscar.getModel();
        TableRowSorter<DefaultTableModel> tr = new TableRowSorter<>(dm);
        jtableBuscar.setRowSorter(tr);
        tr.setRowFilter(RowFilter.regexFilter(consulta));

    }

    @Override
    public void mouseClicked(MouseEvent e) {
        int fila = this.catain.jTable1.getSelectedRow(); // primero, obtengo la fila seleccionada
        
        String dato = String.valueOf(this.catain.jTable1.getValueAt(fila, 0)); // por ultimo, obtengo el valor de la celda

        modin.setId(Integer.parseInt(String.valueOf(dato)));

        modin.buscarInteres(modin);

        in.setVisible(true);
        in.btnEliminar.setEnabled(true);
        in.btnGuardar.setEnabled(false);
        in.btnModificar.setEnabled(true);
        
        in.txtFactor.setText(String.valueOf(modin.getFactor()));
        in.txtNombreinteres.setText(modin.getNombre());
        in.txtId.setText(dato);
        in.txtId.setVisible(false);
        llenartablacondominiomod(in.jTable1);
        addCheckBox(2, in.jTable1);
    }

    @Override
    public void mousePressed(MouseEvent e) {
        
    }

    @Override
    public void mouseReleased(MouseEvent e) {
        
    }

    @Override
    public void mouseEntered(MouseEvent e) {
        
    }

    @Override
    public void mouseExited(MouseEvent e) {
        
    }

    @Override
    public void keyTyped(KeyEvent e) {
        
    }

    @Override
    public void keyPressed(KeyEvent e) {
        
    }

    @Override
    public void keyReleased(KeyEvent e) {
         if (e.getSource() == catain.jTextField1 ){

            filtro(catain.jTextField1.getText(), catain.jTable1);
        } else {

        }
    }

    @Override
    public void windowOpened(WindowEvent e) {
        Llenartablainteres(catain.jTable1);
    }

    @Override
    public void windowClosing(WindowEvent e) {
        
    }

    @Override
    public void windowClosed(WindowEvent e) {
        
    }

    @Override
    public void windowIconified(WindowEvent e) {
        
    }

    @Override
    public void windowDeiconified(WindowEvent e) {
        
    }

    @Override
    public void windowActivated(WindowEvent e) {
        
    }

    @Override
    public void windowDeactivated(WindowEvent e) {
        
    }

}
