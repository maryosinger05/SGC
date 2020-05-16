package controlador;

import java.awt.Component;
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
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import vista.catalogoConceptoGasto;
import vista.conceptoGasto;
import modelo.ModeloConceptoGastos;
import javax.swing.RowFilter;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableColumn;
import javax.swing.table.TableRowSorter;
import modelo.CategoriaGasto;
import vista.catalogoInactivoConceptoGastos;

public class controladorConceptoGasto implements ActionListener, MouseListener, KeyListener, WindowListener {

    private catalogoConceptoGasto catacga;
    private conceptoGasto cga;
    private ModeloConceptoGastos modCatGas;
    private CategoriaGasto modCat;
    private catalogoInactivoConceptoGastos cataicga;
    ArrayList<ModeloConceptoGastos> listaConGas;
    ArrayList<CategoriaGasto> listaCatGas;
    DefaultTableModel dm;

    public controladorConceptoGasto() {

        this.catacga = new catalogoConceptoGasto();
        this.cga = new conceptoGasto();
        this.modCatGas = new ModeloConceptoGastos();
        this.modCat = new CategoriaGasto();
        this.cataicga = new catalogoInactivoConceptoGastos();
        this.catacga.btnActivar.addActionListener(this);
        this.cataicga.btnActivar.addActionListener(this);
        this.catacga.btnNuevoRegistro.addActionListener(this);
        this.cga.btnGuardar.addActionListener(this);
        this.cga.btnLimpiar.addActionListener(this);
        this.cga.btnModificar.addActionListener(this);
        this.cga.txtNombreC.addKeyListener(this);
        this.cga.txtDescripcion.addKeyListener(this);
        this.cga.btnEliminar.addActionListener(this);
        this.catacga.addWindowListener(this);
        this.catacga.jTable.addMouseListener(this);
        this.catacga.txtBuscar.addKeyListener(this);
        listaCatGas = modCat.lCategGas();
        crearCbxCategoria(listaCatGas);
        this.catacga.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == catacga.btnActivar) {
            this.cataicga.setVisible(true);
            Llenartabla1(cataicga.jTable1);
            addCheckBox(3, cataicga.jTable1);
        }

        if (e.getSource() == cataicga.btnActivar) {
            listaConGas = modCatGas.listarConcepto1();

            for (int i = 0; i < cataicga.jTable1.getRowCount(); i++) {
                if (valueOf(cataicga.jTable1.getValueAt(i, 3)) == "true") {

                    modCatGas.setId(listaConGas.get(i).getId());
                    modCatGas.activar(modCatGas);
                    modCat.setId(listaConGas.get(i).getId_categoria());

                    modCat.activar(modCat);

                }
            }
            Llenartabla1(cataicga.jTable1);
            addCheckBox(3, cataicga.jTable1);
            Llenartabla(catacga.jTable);

        }
        if (e.getSource() == cga.btnGuardar) {
            if (validar()) {
                modCatGas.setNombre_Concepto(cga.txtNombreC.getText());
                modCatGas.setDescripcion(cga.txtDescripcion.getText());
                int ind = cga.cbxCategoria.getSelectedIndex() - 1;
                modCatGas.setId_categoria(listaCatGas.get(ind).getId());

                if (modCatGas.registrarConcepto(modCatGas)) {

                    JOptionPane.showMessageDialog(null, "REGISTRO GUARDADO");
                    Llenartabla(catacga.jTable);

                } else {

                    JOptionPane.showMessageDialog(null, "Registro Duplicado");

                }
            }
        }

        if (e.getSource() == cga.btnModificar) {
            if (validar()) {
                modCatGas.setId(Integer.parseInt(cga.txtId.getText()));
                modCatGas.setNombre_Concepto(cga.txtNombreC.getText());
                modCatGas.setDescripcion(cga.txtDescripcion.getText());
                int ind = cga.cbxCategoria.getSelectedIndex() - 1;
                modCatGas.setId_categoria(listaCatGas.get(ind).getId());

                if (modCatGas.modificarConcepto(modCatGas)) {

                    JOptionPane.showMessageDialog(null, "Registro modificado");
                    cga.dispose();
                    Llenartabla(catacga.jTable);
                    limpiar();

                } else {

                    JOptionPane.showMessageDialog(null, "Este Registro ya Existe");

                }
            }
        }
        if (e.getSource() == cga.btnEliminar) {
            if (modCatGas.Buscargas(modCatGas) || modCatGas.Buscarcuo(modCatGas)) {
                JOptionPane.showMessageDialog(null, "no se puede eliminar si tiene gastos por procesar asignados");
            } else {
                if (modCatGas.eliminar(modCatGas)) {
                    modCatGas.setId(Integer.parseInt(cga.txtId.getText()));
                    JOptionPane.showMessageDialog(null, "Registro Eliminado");
                    cga.dispose();
                    Llenartabla(catacga.jTable);

                } else {

                    JOptionPane.showMessageDialog(null, "Error al Eliminar");

                }
            }

        }

        if (e.getSource() == cga.btnLimpiar) {
            limpiar();
        }

        if (e.getSource() == catacga.btnNuevoRegistro) {
            limpiar();
            this.cga.setVisible(true);
            cga.txtId.setVisible(false);
            this.cga.btnModificar.setEnabled(false);
            this.cga.btnGuardar.setEnabled(true);
            this.cga.btnEliminar.setEnabled(false);
            this.cga.txtNombreC.setEnabled(true);

        }

    }

    public void limpiar() {

        cga.txtNombreC.setText(null);
        cga.txtDescripcion.setText(null);
        cga.cbxCategoria.setSelectedItem(0);

    }

    public void Llenartabla(JTable tablaD) {

        listaConGas = modCatGas.listarConcepto();

        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {

                return false;
            }

        };
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);
        tablaD.getTableHeader().setResizingAllowed(false);

        modeloT.addColumn("Concepto");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Categoría");

        Object[] columna = new Object[3];

        int numRegistro = listaConGas.size();

        for (int i = 0; i < numRegistro; i++) {

            columna[0] = listaConGas.get(i).getNombre_Concepto();
            columna[1] = listaConGas.get(i).getDescripcion();
            columna[2] = listaConGas.get(i).getNombreCategoria();

            modeloT.addRow(columna);

        }
        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);
        tablaD.getColumnModel().getColumn(0).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(1).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(2).setCellRenderer(tcr);
    }

    public void Llenartabla1(JTable tablaD) {

        listaConGas = modCatGas.listarConcepto1();

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
                    resu = false;
                }
                if (column == 3) {
                    resu = true;
                }
                return resu;
            }

        };
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);
        tablaD.getTableHeader().setResizingAllowed(false);

        modeloT.addColumn("Concepto");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Categoría");
        modeloT.addColumn("Seleccione");

        Object[] columna = new Object[4];

        int numRegistro = listaConGas.size();

        for (int i = 0; i < numRegistro; i++) {

            columna[0] = listaConGas.get(i).getNombre_Concepto();
            columna[1] = listaConGas.get(i).getDescripcion();
            columna[2] = listaConGas.get(i).getNombreCategoria();

            modeloT.addRow(columna);

        }
        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);
        tablaD.getColumnModel().getColumn(0).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(1).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(2).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(3).setCellRenderer(tcr);
    }

    private Boolean validar() {

        Boolean resultado = true;
        String msj = "";

        if (cga.txtNombreC.getText().isEmpty()) {

            msj += "El campo nombre del concepto no puede estar vacío\n";
            resultado = false;
        }
        if (cga.txtDescripcion.getText().isEmpty()) {

            msj += "El campo descripción no puede estar vacío\n";
            resultado = false;
        }

        if (!resultado) {

            JOptionPane.showMessageDialog(null, msj, "Advertencia", JOptionPane.WARNING_MESSAGE);
        }

        return resultado;
    }

    private void crearCbxCategoria(ArrayList<CategoriaGasto> datos) {
        cga.cbxCategoria.addItem("Seleccione...");

        if (datos != null) {
            for (CategoriaGasto datosX : datos) {
                modCat = datosX;
                cga.cbxCategoria.addItem(modCat.getNombre());
            }

        }
    }

    private void filtro(String consulta, JTable jTableBuscar) {
        dm = (DefaultTableModel) jTableBuscar.getModel();
        TableRowSorter<DefaultTableModel> tr = new TableRowSorter<>(dm);
        jTableBuscar.setRowSorter(tr);
        tr.setRowFilter(RowFilter.regexFilter(consulta));
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        int fila = this.catacga.jTable.getSelectedRow(); // primero, obtengo la fila seleccionada
        int columna = this.catacga.jTable.getSelectedColumn(); // luego, obtengo la columna seleccionada
        String dato = String.valueOf(this.catacga.jTable.getValueAt(fila, 0)); // por ultimo, obtengo el valor de la celda
        Boolean resultado = true;
        String msj = "";

        modCatGas.setNombre_Concepto(String.valueOf(dato));

        modCatGas.buscarC(modCatGas);

        cga.setVisible(true);

        cga.txtId.setText(modCatGas.getId() + "");
        cga.txtNombreC.setText(modCatGas.getNombre_Concepto());
        cga.txtDescripcion.setText(modCatGas.getDescripcion());
        cga.cbxCategoria.setSelectedItem(modCatGas.getNombreCategoria());
        cga.txtId.setEnabled(false);
        cga.txtId.setVisible(false);
        cga.btnGuardar.setEnabled(false);
        cga.btnModificar.setEnabled(true);
        cga.btnEliminar.setEnabled(true);
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
    public void keyTyped(KeyEvent ke) {
        if (ke.getSource() == cga.txtNombreC) {
            Validacion.soloLetras(ke);
            Validacion.limite(ke, cga.txtNombreC.getText(), 120);
        }
        if (ke.getSource() == cga.txtDescripcion) {

            Validacion.limite(ke, cga.txtDescripcion.getText(), 120);
        }
    }

    @Override
    public void keyPressed(KeyEvent e) {
    }

    @Override
    public void keyReleased(KeyEvent e) {
        if (e.getSource() == catacga.txtBuscar) {
            filtro(catacga.txtBuscar.getText(), catacga.jTable);
        } else {
        }
    }

    @Override
    public void windowOpened(WindowEvent e) {
        Llenartabla(catacga.jTable);

        Component[] components = cga.jPanel2.getComponents();
        JComponent[] com = {
            cga.txtNombreC
        };
        Validacion.copiar(components);
        Validacion.pegar(com);
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

    public void addCheckBox(int column, JTable table) {
        TableColumn tc = table.getColumnModel().getColumn(column);
        tc.setCellEditor(table.getDefaultEditor(Boolean.class));
        tc.setCellRenderer(table.getDefaultRenderer(Boolean.class));
    }
}
