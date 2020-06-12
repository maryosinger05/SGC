package controlador;

import java.awt.Color;
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
import javax.swing.JOptionPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import javax.swing.RowFilter;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableRowSorter;
import modelo.Mensaje;
import modelo.Usuario;
import sgc.SGC;
import vista.CatMensaje;
import vista.VisMensaje;

public class CtrlMensaje implements ActionListener, MouseListener, KeyListener, WindowListener {

    private CatMensaje catalogo;
    private VisMensaje vista;
    private Mensaje modelo;
    private ArrayList<Mensaje> listaRecibidos;
    private ArrayList<Mensaje> listaEnviados;

    private Usuario modUsuario;
    private ArrayList<Usuario> listaUsuarios;

    private JTabbedPane contenedor;

    public CtrlMensaje(JTabbedPane contenedor) {
        this.catalogo = new CatMensaje();
        this.vista = new VisMensaje();
        this.modelo = new Mensaje();

        modUsuario = new Usuario();

        this.contenedor = contenedor;

        llenarTablaRecibidos();
        llenarTablaEnviados();
        llenarTablaUsuario();
        addCheckBox(2, vista.tablaUsuarios);

        this.catalogo.btnMensaje.addActionListener(this);
        this.catalogo.tablaRecibidos.addMouseListener(this);
        this.catalogo.tablaEnviados.addMouseListener(this);
        this.catalogo.txtBuscar.addKeyListener(this);

        this.vista.btnEnviar.addActionListener(this);
        this.vista.btnSalir.addActionListener(this);
        this.vista.txtBuscarPropietarios.addKeyListener(this);

        this.catalogo.setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == catalogo.btnMensaje) {
            contenedor.setComponentAt(1, vista);
            vista.repaint();
        }

        if (e.getSource() == vista.btnEnviar) {

            if (validar()) {
                modelo = new Mensaje();
                modelo.setAsunto(vista.txtAsunto.getText());
                modelo.setContenido(vista.txaMensaje.getText());

                //Se recorre cada usuario de la tabla
                for (int i = 0; i < vista.tablaUsuarios.getRowCount(); i++) {

                    //Si el usuario actual fue seleccionado
                    if (String.valueOf(vista.tablaUsuarios.getValueAt(i, 2)) == "true") {
                        //Se guarda el usuario actual
                        modelo.getReceptores().add(listaUsuarios.get(i));
                    }
                }

                if (modelo.enviarMensaje()) {
                    JOptionPane.showMessageDialog(null, "Mensaje enviado");
                    llenarTablaEnviados();
                    llenarTablaRecibidos();
                    contenedor.setComponentAt(1, catalogo);
                    catalogo.repaint();

                } else {
                    JOptionPane.showMessageDialog(null, "No se pudo enviar");
                }
            }
        }

        if (e.getSource() == vista.btnSalir) {
            llenarTablaRecibidos();
            contenedor.setComponentAt(1, catalogo);
            catalogo.repaint();
        }
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        if (e.getSource().equals(catalogo.tablaEnviados)) {
            int fila;
            fila = catalogo.tablaEnviados.getSelectedRow();
            mostrarMensaje(listaEnviados.get(fila));
        }

        if (e.getSource().equals(catalogo.tablaRecibidos)) {
            int fila;
            Mensaje mensaje;
            fila = catalogo.tablaRecibidos.getSelectedRow();
            mensaje = listaRecibidos.get(fila);
            mensaje.actualizarLeido();
            mostrarMensaje(mensaje);
        }

//        int fila = this.catalogo.tablaMensajes.getSelectedRow(); // primero, obtengo la fila seleccionada
//
//        String dato = String.valueOf(this.catalogo.tablaMensajes.getValueAt(fila, 0)); // por ultimo, obtengo el valor de la celda
//        modelo.setId(Integer.parseInt(dato));
//
//        modelo.buscarComunicado(modelo);
//        vista.txtid.setVisible(false);
//        vista.txtid.setText(dato);
//        vista.txtAsunto.setText(modelo.getAsunto());
//        vista.txaMensaje.setText(modelo.getMensaje());
//        Llenartablamod(vista.tablaUsuarios);
//        addCheckBox(5, vista.tablaUsuarios);
//        vista.btnEnviar.setEnabled(false);
//
//        CtrlVentana.cambiarVista(vista);
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
        if (e.getSource() == catalogo.txtBuscar) {

            filtro(catalogo.txtBuscar.getText(), catalogo.tablaRecibidos);
        }

        if (e.getSource() == vista.txtBuscarPropietarios) {

            filtro(vista.txtBuscarPropietarios.getText(), vista.tablaUsuarios);
        }
    }

    @Override
    public void windowOpened(WindowEvent e) {

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

    public void llenarTablaEnviados() {
        //Lista los mensajes enviados y los guarda en lista
        listaEnviados = modelo.listar(SGC.usuarioActual.getId(), "Enviados");

        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        catalogo.tablaEnviados.setModel(modeloT);
        catalogo.tablaEnviados.getTableHeader().setReorderingAllowed(false);
        catalogo.tablaEnviados.getTableHeader().setResizingAllowed(false);

        modeloT.addColumn("Remitente");
        modeloT.addColumn("Asunto");
        modeloT.addColumn("Fecha y Hora");

        Object[] columna = new Object[modeloT.getColumnCount()];

        int numRegistro = listaEnviados.size();
        int ind;

        for (int i = 0; i < numRegistro; i++) {
            ind = 0;
            columna[ind++] = listaEnviados.get(i).getEmisor().getPersona().getpNombre() + " " + listaEnviados.get(i).getEmisor().getPersona().getpApellido();
            columna[ind++] = listaEnviados.get(i).getAsunto();
            columna[ind++] = listaEnviados.get(i).getFecha();

            modeloT.addRow(columna);
        }

        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);

        for (int i = 0; i < modeloT.getColumnCount(); i++) {
            catalogo.tablaEnviados.getColumnModel().getColumn(i).setCellRenderer(tcr);
        }
    }

    public void llenarTablaRecibidos() {
        //Lista los mensajes recibidos y los guarda en lista
        listaRecibidos = modelo.listar(SGC.usuarioActual.getId(), "Recibidos");

        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        catalogo.tablaRecibidos.setModel(modeloT);
        catalogo.tablaRecibidos.getTableHeader().setReorderingAllowed(false);
        catalogo.tablaRecibidos.getTableHeader().setResizingAllowed(false);

        modeloT.addColumn("Remitente");
        modeloT.addColumn("Asunto");
        modeloT.addColumn("Fecha y Hora");
        modeloT.addColumn("Leído");

        Object[] columna = new Object[modeloT.getColumnCount()];

        int numRegistro = listaRecibidos.size();
        int ind;

        for (int i = 0; i < numRegistro; i++) {
            ind = 0;
            columna[ind++] = listaRecibidos.get(i).getEmisor().getPersona().getpNombre() + " " + listaRecibidos.get(i).getEmisor().getPersona().getpApellido();
            columna[ind++] = listaRecibidos.get(i).getAsunto();
            columna[ind++] = listaRecibidos.get(i).getFecha();
            columna[ind++] = listaRecibidos.get(i).getLeido();

            modeloT.addRow(columna);
        }

        DefaultTableCellRenderer tcr;

        tcr = new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable tabla, Object valor, boolean estaSeleccionado, boolean tieneFoco, int fila, int columna) {

                if (String.valueOf(tabla.getValueAt(fila, 3)) == "false") {
                    setBackground(Color.CYAN);

                } else {
                    setBackground(Color.WHITE);
                }

                return super.getTableCellRendererComponent(tabla, valor, estaSeleccionado, tieneFoco, fila, columna);
            }
        };

        tcr.setHorizontalAlignment(SwingConstants.CENTER);

        catalogo.tablaRecibidos.setDefaultRenderer(Object.class, tcr);

//        for (int i = 0; i < modeloT.getColumnCount(); i++) {
//            tabla.getColumnModel().getColumn(i).setCellRenderer(tcr);
//        }
    }

    public void llenarTablaUsuario() {
        listaUsuarios = modUsuario.listar();

        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {
                boolean resu = false;

                switch (column) {
                    case 0:
                    case 1:
                        resu = false;
                        break;
                    case 2:
                        resu = true;
                        break;
                    default:
                        break;
                }

                return resu;
            }
        };

        vista.tablaUsuarios.setModel(modeloT);
        vista.tablaUsuarios.getTableHeader().setReorderingAllowed(false);
        vista.tablaUsuarios.getTableHeader().setResizingAllowed(false);

        modeloT.addColumn("Nombre");
        modeloT.addColumn("Apellido");
        modeloT.addColumn("Seleccione");

        Object[] columna = new Object[modeloT.getColumnCount()];

        int numRegistro = listaUsuarios.size();
        int ind;

        for (int i = 0; i < numRegistro; i++) {
            ind = 0;
            columna[ind++] = listaUsuarios.get(i).getPersona().getpNombre();
            columna[ind++] = listaUsuarios.get(i).getPersona().getpApellido();

            modeloT.addRow(columna);
        }

        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);

        for (int i = 0; i < modeloT.getColumnCount(); i++) {
            vista.tablaUsuarios.getColumnModel().getColumn(i).setCellRenderer(tcr);
        }
    }

    private void mostrarMensaje(Mensaje mensaje) {
        contenedor.setComponentAt(1, vista);
        vista.repaint();

        vista.txtAsunto.setText(mensaje.getAsunto());
        vista.txaMensaje.setText(mensaje.getContenido());
    }

    private Boolean validar() {

        Boolean resultado = true;
        String msj = "";

        if (vista.txtAsunto.getText().isEmpty()) {
            msj += "El campo de asunto no puede estar vacío\n";
            resultado = false;
        }

        if (vista.txaMensaje.getText().isEmpty()) {
            msj += "El campo de mensaje no puede estar vacío\n";
            resultado = false;
        }

        int numUsuariosSeleccionados = 0;

        //Se recorre cada concepto de la tabla
        for (int i = 0; i < vista.tablaUsuarios.getRowCount(); i++) {

            //Si el concepto actual fue seleccionado
            if (String.valueOf(vista.tablaUsuarios.getValueAt(i, 2)) == "true") {
                numUsuariosSeleccionados++;
            }
        }

        //Si no se seleccionó ningún concepto
        if (numUsuariosSeleccionados == 0) {
            msj += "Debe seleccionar al menos un concepto en la tabla\n";
            resultado = false;
        }

        if (!resultado) {
            JOptionPane.showMessageDialog(null, msj, "Advertencia", JOptionPane.WARNING_MESSAGE);
        }

        return resultado;
    }

    public void addCheckBox(int column, JTable table) {
        TableColumn tc = table.getColumnModel().getColumn(column);
        tc.setCellEditor(table.getDefaultEditor(Boolean.class));
        tc.setCellRenderer(table.getDefaultRenderer(Boolean.class));
    }

    private void filtro(String consulta, JTable jtableBuscar) {
        DefaultTableModel dm = (DefaultTableModel) jtableBuscar.getModel();
        TableRowSorter<DefaultTableModel> tr = new TableRowSorter<>(dm);
        jtableBuscar.setRowSorter(tr);
        tr.setRowFilter(RowFilter.regexFilter(consulta));

    }

    public CatMensaje getCatalogo() {
        return catalogo;
    }

}