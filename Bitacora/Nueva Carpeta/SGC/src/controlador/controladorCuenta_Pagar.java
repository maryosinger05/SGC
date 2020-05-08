package controlador;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.util.ArrayList;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.RowFilter;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;
import modelo.Cuenta;
import modelo.Cuenta_Pagar;
import modelo.Fondo;
import modelo.GastoComun;
import vista.catalogoCuentas_procesada;
import vista.catalogoPagos_referencias;
import vista.cuentasPorPagar;

public class controladorCuenta_Pagar implements ActionListener, WindowListener, ItemListener, KeyListener, MouseListener {

    private Cuenta_Pagar modCuentaP;
    private cuentasPorPagar vista;
    private Fondo modFondo;
    private Cuenta modCuenta;
    private GastoComun modGastoC;
    private catalogoCuentas_procesada catCuenPro;
    private catalogoPagos_referencias catPagos;
    ArrayList<GastoComun> listaGastoC;
    ArrayList<Fondo> listaFondo;
    ArrayList<Cuenta> listaCuenta;
    ArrayList<Cuenta_Pagar> listaPagar;
    DefaultTableModel dm;

    int fila;

    public controladorCuenta_Pagar(Cuenta_Pagar modCuentaP, cuentasPorPagar vistaCuentaP, Fondo modFondo, Cuenta modCuenta, GastoComun modGastoC, catalogoCuentas_procesada catCuenPro) {

        catPagos = new catalogoPagos_referencias();
        this.modCuentaP = modCuentaP;
        this.vista = vistaCuentaP;
        this.modFondo = modFondo;
        this.modCuenta = modCuenta;
        this.modGastoC = modGastoC;
        this.catCuenPro = catCuenPro;
        this.vista.btnProcesar.addActionListener(this);
        this.vista.addWindowListener(this);
        this.vista.jTable.addMouseListener(this);
        this.vista.btnMostrar.addActionListener(this);
        this.vista.btnPagos.addActionListener(this);
        this.catPagos.txtBusqueda.addKeyListener(this);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == vista.btnProcesar) {

            modCuentaP.setNum_ref(vista.txtReferencia.getText());
            modCuentaP.setForma_pago(vista.cbxFormaP.getSelectedItem().toString());
            int ind = vista.cbxCuentaT.getSelectedIndex() - 1;
            modCuentaP.getModCuenta().setN_cuenta(listaCuenta.get(ind).getN_cuenta());
            modCuentaP.setDescripcion(vista.txtDescripcion.getText());
            java.sql.Date sqlDate = convert(vista.jDate.getDate());
            modCuentaP.setFecha(sqlDate);
            ind = vista.cbxFondo.getSelectedIndex() - 1;
            modCuentaP.getModFondo().setId(listaFondo.get(ind).getId());
            modCuentaP.getModFondo().setSaldo(listaFondo.get(ind).getSaldo());
            //int fila = this.vistaCuentaP.jTable.getSelectedRow(); // primero, obtengo la fila seleccionada
            float montoTabla;
            float montoUsuario;
            if (Float.parseFloat(vista.txtMonto.getText()) > 0) {
                montoUsuario = Float.parseFloat(vista.txtMonto.getText());
                montoTabla = Float.parseFloat(vista.jTable.getValueAt(fila, 3).toString());

                if (montoUsuario <= montoTabla) {
                    if (montoUsuario <= modCuentaP.getModFondo().getSaldo()) {
                        modCuentaP.setMonto(Float.parseFloat(vista.txtMonto.getText()));

                        if (modCuentaP.registrarPago(modCuentaP)) {
                            modCuentaP.getModFondo().restarFondo(modCuentaP.getMonto());
                            modGastoC.setId(listaGastoC.get(fila).getId());
                            modGastoC.restarSaldo(modCuentaP.getMonto());
                            JOptionPane.showMessageDialog(null, "REGISTRO GUARDADO");

                        } else {
                            JOptionPane.showMessageDialog(null, "ERROR AL REGISTAR");
                        }
                    } else {
                        JOptionPane.showMessageDialog(null, "El monto ingresado no puede ser mayor al Fondo");
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "El monto ingresado no puede ser mayor al monto de la factura");
                }
            } else {
                JOptionPane.showMessageDialog(null, "El monto ingresado no puede ser cero");
            }
            //listaGastoC = modGastoC.listarGastoComun();
            listaGastoC = modGastoC.listarGastoComun(2);
            Llenartabla(vista.jTable, 2);
            listaFondo = modFondo.listar(1);
            crearCbxFondo(listaFondo);
        }
        if (e.getSource() == vista.btnMostrar) {
            catCuenPro.addWindowListener(this);
            this.catCuenPro.setVisible(true);
        }
        if (e.getSource() == vista.btnPagos) {
            catPagos.addWindowListener(this);
            this.catPagos.setVisible(true);

        }
    }

    @Override
    public void windowOpened(WindowEvent e) {
        if (e.getSource() == vista) {
            listaFondo = modFondo.listar(1);
            crearCbxFondo(listaFondo);
            listaCuenta = modCuenta.listarcuenta();
            crearCbxCuenta(listaCuenta);
            modGastoC = new GastoComun();
            //listaGastoC = modGastoC.listarGastoComun();
            Llenartabla(vista.jTable, 2);
            //addCheckBox(0, vistaCuentaP.jTable);
        } else if (e.getSource() == catCuenPro) {
            Llenartabla(catCuenPro.jTable1, 1);
        } else if (e.getSource() == catPagos) {
            llenarTablaPagos(catPagos.jTable);
        }

        Component[] components = vista.jPanel.getComponents();
        JComponent[] com = {vista.jDate, vista.txtDescripcion, vista.txtMonto, vista.txtProveedor, vista.txtReferencia};
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

    @Override
    public void itemStateChanged(ItemEvent e) {
    }

    @Override
    public void keyTyped(KeyEvent e) {
    }

    @Override
    public void keyPressed(KeyEvent e) {
    }

    @Override
    public void keyReleased(KeyEvent e) {
        if (e.getSource() == catPagos.txtBusqueda) {
            filtro(catPagos.txtBusqueda.getText(), catPagos.jTable);
        }
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        if(e.getSource() == vista.jTable)
        {
        //Llenartabla(vista.jTable, 2);
        fila = this.vista.jTable.getSelectedRow(); // primero, obtengo la fila seleccionada
        //Boolean resultado = true;
        //String msj = "";

        modCuentaP.cargarProveedor(listaGastoC.get(fila).getId());

        vista.setVisible(true);
        vista.txtProveedor.setText(modCuentaP.getNom_proveedor());
        }
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

    private void crearCbxCuenta(ArrayList<Cuenta> datos) {
        vista.cbxCuentaT.addItem("Seleccione...");

        if (datos != null) {
            for (Cuenta datosX : datos) {
                vista.cbxCuentaT.addItem(datosX.getN_cuenta() + " - " + datosX.getNombre_banco());
            }

        }
    }

    private void crearCbxFondo(ArrayList<Fondo> datos) {
        vista.cbxFondo.removeAllItems();
        vista.cbxFondo.addItem("Seleccione...");

        if (datos != null) {
            for (Fondo datosX : datos) {
                vista.cbxFondo.addItem(Validacion.formatoDecimal(datosX.getSaldo()) + " - " + datosX.getTipo());
            }

        }
    }

    private void filtro(String consulta, JTable jtableBuscar) {
        dm = (DefaultTableModel) jtableBuscar.getModel();
        TableRowSorter<DefaultTableModel> tr = new TableRowSorter<>(dm);
        jtableBuscar.setRowSorter(tr);
        tr.setRowFilter(RowFilter.regexFilter(consulta));
    }

    private static java.sql.Date convert(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getDate());
        return sDate;
    }

    public void Llenartabla(JTable tablaD, int status) {
        listaGastoC = modGastoC.listarGastoComun(status);

        DefaultTableModel modeloT = new DefaultTableModel();
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);
        tablaD.getTableHeader().setResizingAllowed(false);

        // modeloT.addColumn("Selecciona");
        modeloT.addColumn("id");
        modeloT.addColumn("Fecha");
        modeloT.addColumn("Concepto");
        modeloT.addColumn("Monto");
        modeloT.addColumn("Saldo Restante");
        modeloT.addColumn("Estado");
        modeloT.addColumn("Tipo");
        Object[] columna = new Object[7];

        int num = listaGastoC.size();

        for (int i = 0; i < num; i++) {

            columna[0] = listaGastoC.get(i).getId();
            columna[1] = listaGastoC.get(i).getFecha();
            columna[2] = listaGastoC.get(i).getNombre_Concepto();
            columna[3] = listaGastoC.get(i).getMonto();
            columna[4] = listaGastoC.get(i).getSaldo();
            columna[5] = listaGastoC.get(i).getEstado();
            columna[6] = listaGastoC.get(i).getTipo_gasto();

            modeloT.addRow(columna);

        }
        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);
        tablaD.getColumnModel().getColumn(0).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(1).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(2).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(3).setCellRenderer(tcr);
    }

    public void llenarTablaPagos(JTable tablaD) {
        listaPagar = modCuentaP.listar();

        DefaultTableModel modeloT = new DefaultTableModel();
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);

        // modeloT.addColumn("Selecciona");
        modeloT.addColumn("Referencia");
        modeloT.addColumn("Pago");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Monto");
        modeloT.addColumn("Fecha");
        modeloT.addColumn("Proveedor");
        modeloT.addColumn("Nro Cuenta");
        modeloT.addColumn("Banco");
        modeloT.addColumn("Tipo");

        Object[] columna = new Object[9];

        int num = listaPagar.size();

        for (int i = 0; i < num; i++) {
            columna[0] = listaPagar.get(i).getNum_ref();
            columna[1] = listaPagar.get(i).getForma_pago();
            columna[2] = listaPagar.get(i).getDescripcion();
            columna[3] = listaPagar.get(i).getMonto();
            columna[4] = listaPagar.get(i).getFecha();
            columna[5] = listaPagar.get(i).getNom_proveedor();
            columna[6] = listaPagar.get(i).getModCuenta().getN_cuenta();
            columna[7] = listaPagar.get(i).getModBanco().getNombre_banco();
            columna[8] = listaPagar.get(i).getModFondo().getTipo();
            modeloT.addRow(columna);

        }

    }

    /*public void addCheckBox(int column, JTable table) {
        TableColumn tc = table.getColumnModel().getColumn(column);
        tc.setCellEditor(table.getDefaultEditor(Boolean.class));
        tc.setCellRenderer(table.getDefaultRenderer(Boolean.class));
    }*/
}