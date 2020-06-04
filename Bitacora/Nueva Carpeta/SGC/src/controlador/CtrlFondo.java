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
import java.util.ArrayList;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.RowFilter;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableRowSorter;
import modelo.Fondo;
import modelo.Funcion;
import sgc.SGC;
import vista.Catalogo;
import vista.VisFondo;

public class CtrlFondo implements ActionListener, MouseListener, KeyListener, WindowListener {

    private VisFondo vista;
    private Catalogo catalogo;
    private Fondo modfon;

    Funcion permiso;

    ArrayList<Fondo> listafondo;
    DefaultTableModel dm;
    double montoi;
    double saldo;

    public CtrlFondo() {
        this.vista = new VisFondo();
        this.catalogo = new Catalogo();
        this.modfon = new Fondo();

        catalogo.lblTitulo.setText("Fondo");
        CtrlVentana.cambiarVista(catalogo);

        Llenartabla(catalogo.tabla);
        permisoBtn();

        if (permiso.getRegistrar()) {
            catalogo.btnNuevo.setEnabled(true);
        }

        this.catalogo.btnNuevo.addActionListener(this);
        this.catalogo.txtBuscar.addKeyListener(this);
        this.catalogo.tabla.addMouseListener(this);
        this.vista.btnGuardar.addActionListener(this);
        this.vista.btnLimpiar.addActionListener(this);
        this.vista.btnModificar.addActionListener(this);
        this.vista.btnEliminar.addActionListener(this);
        this.vista.btnSalir.addActionListener(this);
        this.vista.txtMontoInicial.addKeyListener(this);
        this.catalogo.setVisible(true);
    }

    public void Llenartabla(JTable tablaD) {

        listafondo = modfon.listar(2);
        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {

                return false;
            }

        };
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);

        modeloT.addColumn("Fecha");
        modeloT.addColumn("Tipo");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Observación");
        modeloT.addColumn("Monto Inicial");
        modeloT.addColumn("Saldo Actual");

        Object[] columna = new Object[6];

        int numRegistro = listafondo.size();

        for (int i = 0; i < numRegistro; i++) {

            columna[0] = listafondo.get(i).getFecha();
            columna[1] = listafondo.get(i).getTipo();
            columna[2] = listafondo.get(i).getDescripcion();
            columna[3] = listafondo.get(i).getObservacion();
            columna[4] = Validacion.formato1.format(listafondo.get(i).getMonto_inicial());
            columna[5] = Validacion.formato1.format(listafondo.get(i).getSaldo());

            modeloT.addRow(columna);

        }
        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);
        tablaD.getColumnModel().getColumn(0).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(1).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(2).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(3).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(4).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(5).setCellRenderer(tcr);
    }

    private void permisoBtn() {

        for (Funcion funcionbtn : SGC.usuarioActual.getTipoU().getFunciones()) {
            if (funcionbtn.getNombre().equals("Responsables")) {
                permiso = funcionbtn;

            }

        }

    }

    public void Llenartablainactivos(JTable tablaD) {

        listafondo = modfon.listar(3);
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
                    resu = false;
                }
                if (column == 4) {
                    resu = false;
                }
                if (column == 5) {
                    resu = false;
                }
                if (column == 6) {
                    resu = true;
                }

                return resu;
            }

        };
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);

        modeloT.addColumn("Fecha");
        modeloT.addColumn("Tipo");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Observación");
        modeloT.addColumn("Monto Inicial");
        modeloT.addColumn("Saldo Actual");
        modeloT.addColumn("Seleccione");

        Object[] columna = new Object[7];

        int numRegistro = listafondo.size();

        for (int i = 0; i < numRegistro; i++) {

            columna[0] = listafondo.get(i).getFecha();
            columna[1] = listafondo.get(i).getTipo();
            columna[2] = listafondo.get(i).getDescripcion();
            columna[3] = listafondo.get(i).getObservacion();
            columna[4] = Validacion.formato1.format(listafondo.get(i).getMonto_inicial());
            columna[5] = Validacion.formato1.format(listafondo.get(i).getSaldo());

            modeloT.addRow(columna);

        }
        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);
        tablaD.getColumnModel().getColumn(0).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(1).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(2).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(3).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(4).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(5).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(6).setCellRenderer(tcr);
    }

    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == catalogo.btnNuevo) {
            vista.txtId.setVisible(false);
            this.vista.btnModificar.setEnabled(false);
            this.vista.btnGuardar.setEnabled(true);
            this.vista.btnEliminar.setEnabled(false);
            this.vista.txtTipo.setEnabled(true);
            vista.txaDescripcion.setText("");
            vista.txaObservaciones.setText("");
            vista.txtMontoInicial.setText("");
            vista.txtTipo.setText("");
            vista.jDateChooser1.setDate(null);

            CtrlVentana.cambiarVista(vista);
        }

        if (e.getSource() == vista.btnGuardar) {
            if (validar()) {
                modfon.setTipo(vista.txtTipo.getText());
                if (vista.jDateChooser1.getDate() == null) {
                    JOptionPane.showMessageDialog(null, "ingrese la fecha de creacion del fondo");
                } else {
                    java.sql.Date sqlDate = convert(vista.jDateChooser1.getDate());
                    modfon.setFecha(sqlDate);
                    modfon.setDescripcion(vista.txaDescripcion.getText());
                    modfon.setObservacion(vista.txaObservaciones.getText());
                    modfon.setMonto_inicial(Double.parseDouble(vista.txtMontoInicial.getText()));

                    if (modfon.buscar(modfon)) {
                        JOptionPane.showMessageDialog(null, "este fondo ya esta registrado");
                    } else {

                        if (modfon.registrar(modfon)) {

                            JOptionPane.showMessageDialog(null, "Registro Guardado");
                            Llenartabla(catalogo.tabla);

                        } else {

                            JOptionPane.showMessageDialog(null, "Este Registro Ya Existe");

                        }
                    }
                }
            }

        }

        if (e.getSource() == vista.btnModificar) {
            if (validar()) {
                modfon.setTipo(vista.txtTipo.getText());
                java.sql.Date sqlDate = convert(vista.jDateChooser1.getDate());
                modfon.setFecha(sqlDate);
                modfon.setDescripcion(vista.txaDescripcion.getText());
                modfon.setObservacion(vista.txaObservaciones.getText());
                modfon.setMonto_inicial(Double.parseDouble(vista.txtMontoInicial.getText()));

                modfon.setId(Integer.parseInt(vista.txtId.getText()));
                int var7 = 0;
                var7 = modfon.getId();

                if (modfon.buscar1(modfon)) {
                    if (var7 == modfon.getId()) {
                        double var1 = Double.parseDouble(vista.txtMontoInicial.getText());
                        double var2 = var1 - montoi;
                        double total = var2 + saldo;
                        modfon.setSaldo(total);

                        if (total > 0) {
                            if (modfon.modificar(modfon)) {

                                JOptionPane.showMessageDialog(null, "Registro Modificado");
                                Llenartabla(catalogo.tabla);
                                CtrlVentana.cambiarVista(catalogo);

                            } else {

                                JOptionPane.showMessageDialog(null, "Este Registro Ya Existe");

                            }
                        } else {
                            JOptionPane.showMessageDialog(null, "el saldo no puede ser negativo");
                        }
                    } else {
                        JOptionPane.showMessageDialog(null, "este registro ya existe");
                    }

                } else {

                    double var1 = Double.parseDouble(vista.txtMontoInicial.getText());
                    double var2 = var1 - montoi;
                    double total = var2 + saldo;
                    modfon.setSaldo(total);

                    if (total > 0) {
                        if (modfon.modificar(modfon)) {

                            JOptionPane.showMessageDialog(null, "Registro Modificado");
                            Llenartabla(catalogo.tabla);
                            CtrlVentana.cambiarVista(catalogo);

                        } else {

                            JOptionPane.showMessageDialog(null, "Este Registro Ya Existe");

                        }
                    } else {
                        JOptionPane.showMessageDialog(null, "el saldo no puede ser negativo");
                    }
                }

            }

        }

        if (e.getSource() == vista.btnEliminar) {

            modfon.setTipo(vista.txtTipo.getText());

            if (saldo == 0) {

                if (modfon.eliminar(modfon)) {

                    JOptionPane.showMessageDialog(null, "Registro Eliminado");
                    CtrlVentana.cambiarVista(catalogo);
                    Llenartabla(catalogo.tabla);

                } else {

                    JOptionPane.showMessageDialog(null, "Error al Eliminar");

                }
            } else {
                JOptionPane.showMessageDialog(null, "No se puede eliminar un fondo con saldo mayor a 0");
            }

        }
        if (e.getSource() == vista.btnLimpiar) {

            limpiar();

        }

        if (e.getSource() == vista.btnSalir) {
            CtrlVentana.cambiarVista(catalogo);
        }
    }

    public void limpiar() {

        vista.txtMontoInicial.setText(null);
        vista.txtTipo.setText(null);
        vista.txaDescripcion.setText(null);
        vista.txaObservaciones.setText(null);
        vista.jDateChooser1.setDate(null);
    }

    private Boolean validar() {

        Boolean resultado = true;
        String msj = "";

        if (vista.txtMontoInicial.getText().isEmpty()) {

            msj += "El campo monto inicial no puede estar vacío\n";
            resultado = false;
        }

        if (vista.txtTipo.getText().isEmpty()) {

            msj += "El campo tipo no puede estar vacío\n";
            resultado = false;
        }

        if (!resultado) {

            JOptionPane.showMessageDialog(null, msj, "Advertencia", JOptionPane.WARNING_MESSAGE);
        }

        return resultado;
    }

    private static java.sql.Date convert(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        int fila = this.catalogo.tabla.getSelectedRow(); // primero, obtengo la fila seleccionada

        if (permiso.getModificar()) {
            vista.btnModificar.setEnabled(true);
        }
        if (permiso.getEliminar()) {
            vista.btnEliminar.setEnabled(true);
        }

        String dato = String.valueOf(this.catalogo.tabla.getValueAt(fila, 1)); // por ultimo, obtengo el valor de la celda

        modfon.setTipo(String.valueOf(dato));

        vista.txtTipo.setEnabled(true);
        vista.btnGuardar.setEnabled(false);
        vista.btnEliminar.setEnabled(true);
        vista.btnModificar.setEnabled(true);

        modfon.buscar(modfon);

        vista.txaDescripcion.setText(modfon.getDescripcion());
        vista.txaObservaciones.setText(modfon.getObservacion());
        vista.txtId.setText(String.valueOf(modfon.getId()));
        vista.txtId.setVisible(false);
        vista.txtTipo.setText(modfon.getTipo());
        vista.jDateChooser1.setDate(modfon.getFecha());
        vista.txtMontoInicial.setText(String.valueOf(Validacion.formato1.format(modfon.getMonto_inicial())));
        saldo = modfon.getSaldo();
        montoi = modfon.getMonto_inicial();

        CtrlVentana.cambiarVista(vista);
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
        if (ke.getSource() == vista.txtMontoInicial) {

            Validacion.Espacio(ke);
            Validacion.soloUnPunto(ke, vista.txtMontoInicial.getText());

        }
    }

    @Override
    public void keyPressed(KeyEvent e) {

    }

    @Override
    public void keyReleased(KeyEvent e) {
        if (e.getSource() == catalogo.txtBuscar) {

            filtro(catalogo.txtBuscar.getText(), catalogo.tabla);
        } else {

        }
    }

    @Override
    public void windowOpened(WindowEvent e) {

        Component[] components = vista.jPanel2.getComponents();
        JComponent[] com = {
            vista.txtTipo, vista.txtMontoInicial
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

    private void filtro(String consulta, JTable jtableBuscar) {
        dm = (DefaultTableModel) jtableBuscar.getModel();
        TableRowSorter<DefaultTableModel> tr = new TableRowSorter<>(dm);
        jtableBuscar.setRowSorter(tr);
        tr.setRowFilter(RowFilter.regexFilter(consulta));

    }

    public void addCheckBox(int column, JTable table) {
        TableColumn tc = table.getColumnModel().getColumn(column);
        tc.setCellEditor(table.getDefaultEditor(Boolean.class));
        tc.setCellRenderer(table.getDefaultRenderer(Boolean.class));
    }
}