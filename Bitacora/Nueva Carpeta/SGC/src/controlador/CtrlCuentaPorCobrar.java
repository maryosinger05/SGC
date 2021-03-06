/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import static java.lang.String.valueOf;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.BorderFactory;
import static javax.swing.BorderFactory.createLineBorder;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.SwingConstants;
import javax.swing.UIManager;
import static javax.swing.WindowConstants.DISPOSE_ON_CLOSE;
import javax.swing.plaf.ColorUIResource;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;
import javax.swing.table.TableRowSorter;
import modelo.CerrarMes;
import modelo.ConexionBD;
import modelo.Cuenta;
import modelo.CuentasPorCobrar;
import modelo.Fondo;
import modelo.FormaPago;
import modelo.Unidad;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
import vista.Catalogo;
import vista.VisCuentaPorCobrar;

/**
 *
 * @author rma
 */
public class CtrlCuentaPorCobrar implements ActionListener, ItemListener, KeyListener {

    private VisCuentaPorCobrar vista;
    private CuentasPorCobrar modcuen;
    private Unidad moduni;
    private Fondo modfon;
    private Cuenta modcu;
    private CerrarMes modc;
    private FormaPago modfor;
    ArrayList<CerrarMes> listaCierremes;
    ArrayList<CerrarMes> listaDominante;
    ArrayList<CerrarMes> lista_detalles;
    ArrayList<Unidad> listaunidades;
    ArrayList<Fondo> listafondo;
    ArrayList<Cuenta> listaCuenta;
    ArrayList<FormaPago> listaformapago;
    int x;
    DefaultTableModel dm;

    public CtrlCuentaPorCobrar() {
        Object hola = "";
        String e = "";
        do {
            hola = "";
            UIManager UI = new UIManager();
            UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
            UI.put("Panel.background", new ColorUIResource(255, 255, 255));

            Icon q = new ImageIcon(getClass().getResource("/img/pregunta.png"));
            UIManager.put("Button.background", Color.white);
            UIManager.put("Button.font", Color.blue);
            UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
            UIManager.put("Label.background", Color.blue);
            UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));
            UIManager.put("Input.border", createLineBorder(new Color(0, 94, 159), 3));
            UIManager.put("Input.font", new Font("Tahoma", Font.BOLD, 12));

            hola = JOptionPane.showInputDialog(null, "¿A que paridad va a trabajar?, Por favor ingrese ", "PARIDAD", 0, q, null, null); //ventana que se despliega para que ingresen la paridad 
            e = String.valueOf(hola);
            if (e != null && isValidDouble(e) == true) {
                this.moduni = new Unidad();
                this.modfor = new FormaPago();
                this.modcu = new Cuenta();
                this.modfon = new Fondo();

                if (moduni.contar() == 0) {

                    new UIManager();
                    UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                    UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                    int botonDialogo = JOptionPane.OK_OPTION;
                    Icon p = new ImageIcon(getClass().getResource("/img/check.png"));
                    UIManager.put("Button.background", Color.white);
                    UIManager.put("Button.font", Color.blue);
                    UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                    UIManager.put("Label.background", Color.blue);
                    UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                    JOptionPane.showMessageDialog(null, "No existen Unidades, debe registrar una para continuar ", "ADVERTENCIA", JOptionPane.INFORMATION_MESSAGE, p);

                    new CtrlUnidad();

                } else if (modfor.contar() == 0) {

                    new UIManager();
                    UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                    UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                    int botonDialogo = JOptionPane.OK_OPTION;
                    Icon p = new ImageIcon(getClass().getResource("/img/check.png"));
                    UIManager.put("Button.background", Color.white);
                    UIManager.put("Button.font", Color.blue);
                    UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                    UIManager.put("Label.background", Color.blue);
                    UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                    JOptionPane.showMessageDialog(null, "No existen Forma de Pagos, debe registrar uno para continuar ", "ADVERTENCIA", JOptionPane.INFORMATION_MESSAGE, p);

                    new CtrlFormaPago();

                } else if (modcu.contar() == 0) {

                    new UIManager();
                    UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                    UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                    int botonDialogo = JOptionPane.OK_OPTION;
                    Icon p = new ImageIcon(getClass().getResource("/img/check.png"));
                    UIManager.put("Button.background", Color.white);
                    UIManager.put("Button.font", Color.blue);
                    UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                    UIManager.put("Label.background", Color.blue);
                    UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                    JOptionPane.showMessageDialog(null, "No existen Cuentas, debe registrar una para continuar ", "ADVERTENCIA", JOptionPane.INFORMATION_MESSAGE, p);

                    new CtrlCuenta();

                } else if (modfon.contar() == 0) {

                    new UIManager();
                    UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                    UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                    int botonDialogo = JOptionPane.OK_OPTION;
                    Icon p = new ImageIcon(getClass().getResource("/img/check.png"));
                    UIManager.put("Button.background", Color.white);
                    UIManager.put("Button.font", Color.blue);
                    UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                    UIManager.put("Label.background", Color.blue);
                    UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                    JOptionPane.showMessageDialog(null, "No existen Fondos, debe registrar uno para continuar ", "ADVERTENCIA", JOptionPane.INFORMATION_MESSAGE, p);

                    new CtrlFondo();

                } else {

                    this.vista = new VisCuentaPorCobrar();
                    this.modcuen = new CuentasPorCobrar();
                    this.modc = new CerrarMes();

                    modc.setParidad(Double.parseDouble(e)); //seteamos la paridad para que busque los gastos en la bd y los multiplique por la paridad
                    vista.txtParidad.setText(e); // seteamos la paridad en la caja de texto para que este cargada al abrir la vantana

                    vista.jComboUnidad.addItemListener(this);
                    vista.btnGuardar.addActionListener(this);
                    vista.txtMonto.addKeyListener(this);
                    vista.txtDescripcion.addKeyListener(this);
                    vista.txtReferencia.addKeyListener(this);
                    vista.cbxMoneda.addItemListener(this);
                    CtrlVentana.cambiarVista(vista); //funcion para que abra la ventana

                    vista.cbxMoneda.addItemListener(this);
                    stylecombo(vista.cbxMoneda);
                    vista.jComboCuenta.addItemListener(this);
                    stylecombo(vista.jComboCuenta);
                    vista.jComboFondo.addItemListener(this);
                    stylecombo(vista.jComboFondo);
                    vista.jComboForma.addItemListener(this);
                    stylecombo(vista.jComboForma);
                    vista.jComboUnidad.addItemListener(this);
                    stylecombo(vista.jComboUnidad);

                    vista.jComboFondo.removeAllItems(); //limpiamos los combobox
                    modfon.setMoneda("BOLÍVAR"); //seteamos la moneda por defecto (bs)
                    listafondo = modfon.listar(2);
                    crearCbxFondo(listafondo); //llenamos el combobox con la funcion de arriba (arraylist)

                    listaunidades = moduni.listar();
                    crearCbxUnidad(listaunidades); //llenamos el combobox con la funcion de arriba (arraylist)

                    listaCuenta = modcu.listarcuenta();
                    crearCbxCuenta(listaCuenta); //llenamos el combobox con la funcion de arriba (arraylist)v

                    listaformapago = modfor.listar();
                    crearCbxFormadePago(listaformapago); //llenamos el combobox con la funcion de arriba (arraylist)

                    Component[] components = vista.jPanel2.getComponents();
                    JComponent[] com = {
                        vista.txtReferencia, vista.txtDescripcion, vista.txtMonto
                    };
                    Validacion.copiar(components);
                    Validacion.pegar(com);
                }
            }
            System.out.println(hola);
            if (hola == null) {
                break;
            } else {

            }
        } while (isValidDouble(e) == false); //ciclo que repite mientras no ingresen un numero valido

    }

    public void Llenartabla(JTable tablaD, ArrayList listadominante) { //funcion para llenar la tabla de pagos pendientes

        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) { //indicamos que columnas son editables y cuales no

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
                    resu = false;
                }
                if (column == 7) {
                    resu = true;
                }

                return resu;
            }

        };
        TableRowSorter<DefaultTableModel> tr = new TableRowSorter<>(modeloT);
        tablaD.setRowSorter(tr);
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);
        tablaD.getTableHeader().setResizingAllowed(false);

        modeloT.addColumn("<html>Mes a <br> Cobrar</html>"); //añadimos el encabezado de la columna
        modeloT.addColumn("Año");
        modeloT.addColumn("<html>Monto <br> en $</html>");
        modeloT.addColumn("<html>Monto <br> en BsS</html>");
        modeloT.addColumn("<html>Saldo <br> Restante $</html>");
        modeloT.addColumn("<html>Saldo <br> Restante BsS</html>");
        modeloT.addColumn("<html>Mantener<br> Valor en</html>");
        modeloT.addColumn("Seleccione");

        Object[] columna = new Object[8];

        for (int s = 0; s < listaDominante.size(); s++) { //ciclo que busca los gastos por la moneda dominante, mes y año
            modc.setMes_cierre(listaDominante.get(s).getMes_cierre()); //seteamos los datos necesarios para la busqueda
            modc.setAño_cierre(listaDominante.get(s).getAño_cierre());
            modc.uni.setId(listaDominante.get(s).uni.getId());
            listaCierremes = modc.listarpagospendientes(listaDominante.get(s).getMoneda_dominante()); // buscamos los datos por cada mes, año, unidad, se suman y multiplican/dividen por la paridad para obtener el total a mostrar
            int numRegistro = listaCierremes.size();

            for (int i = 0; i < numRegistro; i++) { //llenamos la columna con los datos obtenidos

                columna[0] = listaCierremes.get(i).getMes_cierre();
                columna[1] = listaCierremes.get(i).getAño_cierre();
                columna[2] = Validacion.formatopago1.format(listaCierremes.get(i).getMonto_bolivar());
                columna[3] = Validacion.formatopago1.format(listaCierremes.get(i).getMonto_dolar());
                columna[4] = Validacion.formatopago1.format(listaCierremes.get(i).getSaldo_restante_dolar()); //limito los decimales
                columna[5] = Validacion.formatopago1.format(listaCierremes.get(i).getSaldo_restante_bs());
                columna[6] = listaCierremes.get(i).getMoneda_dominante();

                modeloT.addRow(columna);

            }
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

        TableColumnModel columnModel = tablaD.getColumnModel();
        columnModel.getColumn(0).setPreferredWidth(25);
        columnModel.getColumn(1).setPreferredWidth(18);
        columnModel.getColumn(2).setPreferredWidth(35);
        columnModel.getColumn(3).setPreferredWidth(35);
        columnModel.getColumn(4).setPreferredWidth(35);
        columnModel.getColumn(5).setPreferredWidth(35);
        columnModel.getColumn(6).setPreferredWidth(35);
        columnModel.getColumn(7).setPreferredWidth(40);

    }

    public void Llenartablapagados(JTable tablaD) { //igual que la funcion anterior pero para las factura que ya esten pagadas

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
                    resu = false;
                }
                if (column == 7) {
                    resu = true;
                }

                return resu;
            }

        };
        TableRowSorter<DefaultTableModel> tr = new TableRowSorter<>(modeloT);
        tablaD.setRowSorter(tr);
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);
        tablaD.getTableHeader().setResizingAllowed(false);

        modeloT.addColumn("<html>Mes <br> a Cobrar</html>");
        modeloT.addColumn("Año");
        modeloT.addColumn("<html>Monto <br> en $</html>");
        modeloT.addColumn("<html>Monto <br> en BsS</html>");
        modeloT.addColumn("<html>Saldo <br> Restante $</html>");
        modeloT.addColumn("<html>Saldo <br> Restante BsS</html>");
        modeloT.addColumn("<html>Mantener<br> Valor en</html>");
        modeloT.addColumn("Seleccione");

        Object[] columna = new Object[8];

        for (int s = 0; s < listaDominante.size(); s++) {
            modc.setMes_cierre(listaDominante.get(s).getMes_cierre());
            modc.setAño_cierre(listaDominante.get(s).getAño_cierre());
            modc.uni.setId(listaDominante.get(s).uni.getId());
            listaCierremes = modc.listarpagospagados(listaDominante.get(s).getMoneda_dominante());
            int numRegistro = listaCierremes.size();

            for (int i = 0; i < numRegistro; i++) {

                columna[0] = listaCierremes.get(i).getMes_cierre();
                columna[1] = listaCierremes.get(i).getAño_cierre();
                columna[2] = Validacion.formatopago1.format(listaCierremes.get(i).getMonto_bolivar());
                columna[3] = Validacion.formatopago1.format(listaCierremes.get(i).getMonto_dolar());
                columna[4] = listaCierremes.get(i).getSaldo_restante_dolar();
                columna[5] = listaCierremes.get(i).getSaldo_restante_bs();
                columna[6] = listaCierremes.get(i).getMoneda_dominante();

                modeloT.addRow(columna);

            }
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

        TableColumnModel columnModel = tablaD.getColumnModel();
        columnModel.getColumn(0).setPreferredWidth(25);
        columnModel.getColumn(1).setPreferredWidth(18);
        columnModel.getColumn(2).setPreferredWidth(35);
        columnModel.getColumn(3).setPreferredWidth(35);
        columnModel.getColumn(4).setPreferredWidth(35);
        columnModel.getColumn(5).setPreferredWidth(35);
        columnModel.getColumn(6).setPreferredWidth(35);
        columnModel.getColumn(7).setPreferredWidth(40);
    }

    private static java.sql.Date convert(java.util.Date uDate) { // funcion para convertir fechas de java a sql
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == vista.btnGuardar) { //cuando haga click en el boton guardar
            if (validar()) { //valido que no hayan campos vacion
                if (vista.txtMonto.getText().equals(".")) {

                    UIManager UI = new UIManager();
                    UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                    UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                    int botonDialogo = JOptionPane.OK_OPTION;
                    Icon p = new ImageIcon(getClass().getResource("/img/warning.png"));
                    UIManager.put("Button.background", Color.white);
                    UIManager.put("Button.font", Color.blue);
                    UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                    UIManager.put("Label.background", Color.blue);
                    UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                    JOptionPane.showMessageDialog(null, "Por favor, ingrese un monto valido", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE, p);

                } else {
                    listaunidades = moduni.listar(); //traigo una lista para saber que unidad esta pagando
                    modfon.setMoneda(vista.cbxMoneda.getSelectedItem().toString()); //seteo la moneda en la que se va a realizar el pago
                    listafondo = modfon.listar(2); //traigo la lista de los fondos de acuerdo a su moneda
                    listaCuenta = modcu.listarcuenta(); // traigo la lista de las cuentas

                    int j = 0; //declaro un contador
                    modcuen.setDescripcion(vista.txtDescripcion.getText()); //seteo descripcion
                    modcuen.setForma_pago(vista.jComboForma.getSelectedItem().toString());//seteo forma de pago
                    int ind2 = vista.jComboCuenta.getSelectedIndex() - 2; //declaro un contador y le doy el valor del index del combobox restanto las 2 opciones que estan fuera de la lista(el "seleccione" y "otros")

                    for (int i = 0; i < vista.jTable1.getRowCount(); i++) { //ciclo para recorrer la tabla
                        if (valueOf(vista.jTable1.getValueAt(i, 7)) == "true") {//verifico cuales checkbox estan marcados

                            j = j + 1; //por cada una que este marcada se le suma 1 al contador

                        }
                    }
                    if (j == 0) { //si no hay ninguna marcada detiene la ejecucion y muestra un mensaje

                        UIManager UI = new UIManager();
                        UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                        UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                        int botonDialogo = JOptionPane.OK_OPTION;
                        Icon p = new ImageIcon(getClass().getResource("/img/warning.png"));
                        UIManager.put("Button.background", Color.white);
                        UIManager.put("Button.font", Color.blue);
                        UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                        UIManager.put("Label.background", Color.blue);
                        UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                        JOptionPane.showMessageDialog(null, "Debe seleccionar al menos 1 registro de la tabla ", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE, p);
                    } else {
                        if (ind2 == -2) { //si la opcion seleccionada en cuenta es la de "seleccione" lance un mensaje y detenga la ejecucion

                            UIManager UI = new UIManager();
                            UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                            UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                            int botonDialogo = JOptionPane.OK_OPTION;
                            Icon p = new ImageIcon(getClass().getResource("/img/warning.png"));
                            UIManager.put("Button.background", Color.white);
                            UIManager.put("Button.font", Color.blue);
                            UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                            UIManager.put("Label.background", Color.blue);
                            UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                            JOptionPane.showMessageDialog(null, "Seleccione una cuenta ", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE, p);
                        } else {
                            if (ind2 == -1) { //si la opcion seleccionada en cuenta es la de "otros" seteo esa palabra en el numero de cuenta
                                modcuen.setId_cuenta("OTROS");
                            } else { //de lo contrario tome el valor normal del combobox
                                modcuen.setId_cuenta(listaCuenta.get(ind2).getN_cuenta());
                            }

                            int ind1 = vista.jComboFondo.getSelectedIndex() - 1;  //declaro un contador y le doy el valor del index del combobox restanto 1 opcion que esta fuera de la lista(el "seleccione")
                            if (ind1 == -1) { //si la opcion seleccionada en fondos es la de "seleccione" lance un mensaje y detenga la ejecucion

                                UIManager UI = new UIManager();
                                UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                                UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                                int botonDialogo = JOptionPane.OK_OPTION;
                                Icon p = new ImageIcon(getClass().getResource("/img/warning.png"));
                                UIManager.put("Button.background", Color.white);
                                UIManager.put("Button.font", Color.blue);
                                UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                                UIManager.put("Label.background", Color.blue);
                                UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                                JOptionPane.showMessageDialog(null, "Seleccione el fondo a depositar ", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE, p);
                            } else {

                                modcuen.setId_fondo(listafondo.get(ind1).getId()); //seteo el id del fondo del combobox

                                int ind = vista.jComboUnidad.getSelectedIndex() - 1; //declaro un contador y le doy el valor del index del combobox restanto 1 opcion que esta fuera de la lista(el "seleccione")

                                if (ind == -1) { //si la opcion seleccionada en unidad es la de "seleccione" lance un mensaje y detenga la ejecucion

                                    UIManager UI = new UIManager();
                                    UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                                    UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                                    int botonDialogo = JOptionPane.OK_OPTION;
                                    Icon p = new ImageIcon(getClass().getResource("/img/warning.png"));
                                    UIManager.put("Button.background", Color.white);
                                    UIManager.put("Button.font", Color.blue);
                                    UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                                    UIManager.put("Label.background", Color.blue);
                                    UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                                    JOptionPane.showMessageDialog(null, "Seleccione el número de la unidad ", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE, p);
                                } else {
                                    modcuen.uni.setId(listaunidades.get(ind).getId()); //seteo el id de la unidad 
                                    String como = Validacion.formatopago1.format(Double.parseDouble(vista.txtMonto.getText()));
                                    modcuen.setMonto(Double.parseDouble(como)); //seteo el monto ingresado en la casilla de monto
                                    modcuen.setReferencia(vista.txtReferencia.getText()); //seteo el numero de referencia
                                    java.sql.Date sqlDate = convert(vista.txtFecha.getDatoFecha()); //seteo la fecha y la convierto a formato sql
                                    modcuen.setFecha(sqlDate);

                                    double total_dolar = 0; //declaro un par de variables que serviran para obtener el total 
                                    double total_bs = 0;
                                    for (int i = 0; i < vista.jTable1.getRowCount(); i++) { //ciclo para recorrer la tabla
                                        if (valueOf(vista.jTable1.getValueAt(i, 7)) == "true") { //verifico cuales checkbox estan marcados

                                            double dato_dolar = Double.parseDouble(String.valueOf(this.vista.jTable1.getValueAt(i, 4))); //obtengo el valor de la columna de la tabla "saldo restante dolar"
                                            double dato_bs = Double.parseDouble(String.valueOf(this.vista.jTable1.getValueAt(i, 5)));//obtengo el valor de la columna de la tabla "saldo restante dolar"
                                            total_dolar = total_dolar + dato_dolar;//sumo el valor de cada fila para obtener la sumatoria de las filas selccionadas
                                            total_bs = total_bs + dato_bs;

                                        }
                                    }

                                    total_dolar = Double.parseDouble(Validacion.formatopago1.format(total_dolar));
                                    total_bs = Double.parseDouble(Validacion.formatopago1.format(total_bs));
                                    System.out.println(total_dolar);
                                    if ((modcuen.getMonto() > total_dolar && vista.cbxMoneda.getSelectedItem().toString().equals("DÓLAR")) || (modcuen.getMonto() > total_bs && vista.cbxMoneda.getSelectedItem().toString().equals("BOLÍVAR"))) {

                                        UIManager UI = new UIManager();
                                        UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                                        UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                                        int botonDialogo = JOptionPane.OK_OPTION;
                                        Icon p = new ImageIcon(getClass().getResource("/img/warning.png"));
                                        UIManager.put("Button.background", Color.white);
                                        UIManager.put("Button.font", Color.blue);
                                        UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                                        UIManager.put("Label.background", Color.blue);
                                        UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                                        JOptionPane.showMessageDialog(null, "No puede ingresar mas dinero de lo que debe ", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE, p); //si el monto ingresado es superior al que ha selccionado en al tabla detiene la ejecucion y lanza mensaje
                                    } else {
                                        modcuen.setParidad(Double.parseDouble(vista.txtParidad.getText())); //seteo la paridad que se va a utilizar para calcular el pago
                                        modcuen.setMoneda(vista.cbxMoneda.getSelectedItem().toString()); //seteo la moneda 
                                        if (modcuen.registrarCobro(modcuen)) { //registro el cobro, lo que viene siendo la transferencia total
                                            double var4 = listafondo.get(ind1).getSaldo() + modcuen.getMonto();// declaro una variable que se le asigna el valor de la sumatoria del valor anterior del fondo + el monto ingresado
                                            modfon.setId(listafondo.get(ind1).getId()); //seteo el id del fondo
                                            modfon.setSaldo(var4); //seteo el nuevo saldo del fondo
                                            System.out.println(var4);
                                            modfon.fondear(modfon); //registro el nuevo saldo del monto

                                            UIManager UI = new UIManager();
                                            UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
                                            UI.put("Panel.background", new ColorUIResource(255, 255, 255));

                                            int botonDialogo = JOptionPane.OK_OPTION;
                                            Icon p = new ImageIcon(getClass().getResource("/img/check.png"));
                                            UIManager.put("Button.background", Color.white);
                                            UIManager.put("Button.font", Color.blue);
                                            UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
                                            UIManager.put("Label.background", Color.blue);
                                            UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

                                            JOptionPane.showMessageDialog(null, "Registro guardado ", "REGISTRO DE DATOS", JOptionPane.INFORMATION_MESSAGE, p);
                                            modcuen.buscId(modcuen); //busco el ultimo id que viene siendo el pago que acabo de cargar

                                            double monto_total = Double.parseDouble(Validacion.formatopago1.format(Double.parseDouble(vista.txtMonto.getText()))); //declaro variable que obtiene el valor del monto ingresado

                                            for (int i = 0; i < vista.jTable1.getRowCount(); i++) {
                                                if (monto_total > 0) {//si todavia queda dinero sin utilizar continua el ciclo
                                                    if (valueOf(vista.jTable1.getValueAt(i, 7)) == "true") {
                                                        modc.setMes_cierre(Integer.parseInt(valueOf(vista.jTable1.getValueAt(i, 0)))); //seteamos mes
                                                        modc.setAño_cierre(Integer.parseInt(valueOf(vista.jTable1.getValueAt(i, 1))));//seteamos año

                                                        modc.uni.setId(listaunidades.get(vista.jComboUnidad.getSelectedIndex() - 1).getId());//seteo el id de la unidad de acuerdo al que se alla seleccionado en el combobox
                                                        lista_detalles = modc.listardetallesgastos();//listo el detalle de todos los gastos que tiene el recibo individualmente

                                                        if (vista.cbxMoneda.getSelectedItem().toString().equals("BOLÍVAR")) {//si la moneda en la que se va a realizar el pago es en bs
                                                            if ((vista.jTable1.getValueAt(i, 6).equals("BOLÍVAR"))) {//si el recibo la moneda dominante es en bs

                                                                double montototal = 0;
                                                                double varsaldo = 0;
                                                                for (int q = 0; q < lista_detalles.size(); q++) {// ciclo para pagar cada uno de los gastos dentro del recibo
                                                                    if (monto_total > 0) {//si todavia queda dinero sin utilizar continua el ciclo

                                                                        varsaldo = lista_detalles.get(q).getSaldo_restante_bs() - monto_total; //esta variable es igual al saldo restante del gasto menos el monto ingresado
                                                                        montototal = monto_total; //esta variable mantiene el valor del monto ingresado siempre que sea positivo
                                                                        monto_total = monto_total - lista_detalles.get(q).getSaldo_restante_bs();//el monto restante disponible para continuar el ciclo es = al monto ingresado-el saldo restante del gasto

                                                                        if (varsaldo < 0) { //si el resultado de la operacion anterior es negativo quiere decir que se ha pagado por completo el gasto por lo tanto el saldo restante se le asigna 0
                                                                            varsaldo = 0;
                                                                            montototal = lista_detalles.get(q).getSaldo_restante_bs(); //si el saldo restante es 0 quiere decir que el monto pagado a ese gasto es el total
                                                                        }
                                                                        modcuen.setMonto(Double.parseDouble(Validacion.formatopago1.format(montototal))); //seteamos el monto que se ha pagado del gasto
                                                                        modcuen.cer.setId(lista_detalles.get(q).getId());//seteamos id del gasto
                                                                        modcuen.setMoneda(vista.cbxMoneda.getSelectedItem().toString());//seteamos la moneda
                                                                        modc.setSaldo_restante_bs(Double.parseDouble(Validacion.formatopago1.format(varsaldo)));//seteamos el saldo restante del gasto
                                                                        modc.setId(lista_detalles.get(q).getId());
                                                                        modc.actualizarTotalBolivar(modc);//actualizo el saldo restante en bs
                                                                        if (montototal != 0) {
                                                                            modcuen.guardarpuentepagos(modcuen);//guardamos el detalle del pago del gasto en especifico
                                                                        }

                                                                    }
                                                                }
                                                                try {
                                                                    ConexionBD con = new ConexionBD();
                                                                    Connection conn = con.getConexion();

                                                                    JasperReport reporte = null;
                                                                    String path = "src\\reportes\\mes_pago.jasper";

                                                                    Map parametros = new HashMap();
                                                                    parametros.put("n_unidad", vista.jComboUnidad.getSelectedItem().toString());

                                                                    reporte = (JasperReport) JRLoader.loadObjectFromFile(path);

                                                                    JasperPrint jprint = JasperFillManager.fillReport(path, parametros, conn);

                                                                    JasperViewer view = new JasperViewer(jprint, false);

                                                                    view.setDefaultCloseOperation(DISPOSE_ON_CLOSE);

                                                                    view.setVisible(true);
                                                                } catch (JRException ex) {
                                                                    Logger.getLogger(Catalogo.class.getName()).log(Level.SEVERE, null, ex);
                                                                }
                                                            }

                                                            if ((vista.jTable1.getValueAt(i, 6).equals("DÓLAR"))) {//si el recibo la moneda dominante es en dolar

                                                                double varsaldo = 0;
                                                                double montototal = 0;

                                                                for (int q = 0; q < lista_detalles.size(); q++) {// ciclo para pagar cada uno de los gastos dentro del recibo
                                                                    if (monto_total > 0) {//si todavia queda dinero sin utilizar continua el ciclo

                                                                        varsaldo = lista_detalles.get(q).getSaldo_restante_dolar() - (monto_total / Double.parseDouble(vista.txtParidad.getText())); //esta variable es igual al saldo restante del gasto menos el monto ingresado dividido / la paridad
                                                                        montototal = monto_total;//esta variable mantiene el valor del monto ingresado siempre que sea positivo
                                                                        monto_total = monto_total - (lista_detalles.get(q).getSaldo_restante_dolar() * Double.parseDouble(vista.txtParidad.getText()));//el monto restante disponible para continuar el ciclo es = al monto ingresado-el saldo restante del gasto*la paridad
                                                                        if (varsaldo < 0) {//si el resultado de la operacion anterior es negativo quiere decir que se ha pagado por completo el gasto por lo tanto el saldo restante se le asigna 0                                                           
                                                                            varsaldo = 0;
                                                                            montototal = lista_detalles.get(q).getSaldo_restante_dolar() * Double.parseDouble(vista.txtParidad.getText());//si el saldo restante es 0 quiere decir que el monto pagado a ese gasto es el total * la paridad

                                                                        }
                                                                        modcuen.setMonto(Double.parseDouble(Validacion.formatopago1.format(montototal))); //seteamos el monto que se ha pagado del gasto
                                                                        modcuen.cer.setId(lista_detalles.get(q).getId());//seteamos id del gasto
                                                                        modcuen.setMoneda(vista.cbxMoneda.getSelectedItem().toString());//seteamos la moneda
                                                                        modc.setSaldo_restante_dolar(Double.parseDouble(Validacion.formatopago1.format(varsaldo)));//seteamos el saldo restante del gasto
                                                                        modc.setId(lista_detalles.get(q).getId());
                                                                        modc.actualizarTotalDolar(modc);//actualizo el saldo restante en dolar
                                                                        if (montototal != 0) {
                                                                            modcuen.guardarpuentepagos(modcuen);//guardamos el detalle del pago del gasto en especifico
                                                                        }

                                                                    }
                                                                }
                                                                try {
                                                                    ConexionBD con = new ConexionBD();
                                                                    Connection conn = con.getConexion();

                                                                    JasperReport reporte = null;
                                                                    String path = "src\\reportes\\mes_pago.jasper";

                                                                    Map parametros = new HashMap();
                                                                    parametros.put("n_unidad", vista.jComboUnidad.getSelectedItem().toString());

                                                                    reporte = (JasperReport) JRLoader.loadObjectFromFile(path);

                                                                    JasperPrint jprint = JasperFillManager.fillReport(path, parametros, conn);

                                                                    JasperViewer view = new JasperViewer(jprint, false);

                                                                    view.setDefaultCloseOperation(DISPOSE_ON_CLOSE);

                                                                    view.setVisible(true);
                                                                } catch (JRException ex) {
                                                                    Logger.getLogger(Catalogo.class.getName()).log(Level.SEVERE, null, ex);
                                                                }

                                                            }

                                                        }
                                                        if (vista.cbxMoneda.getSelectedItem().toString().equals("DÓLAR")) {//si la moneda en la que se va a realizar el pago es en dolar
                                                            if ((vista.jTable1.getValueAt(i, 6).equals("DÓLAR"))) {//si el recibo la moneda dominante es en dolar

                                                                double varsaldo = 0;
                                                                double montototal = 0;
                                                                for (int q = 0; q < lista_detalles.size(); q++) {// ciclo para pagar cada uno de los gastos dentro del recibo
                                                                    if (monto_total > 0) {//si todavia queda dinero sin utilizar continua el ciclo

                                                                        varsaldo = lista_detalles.get(q).getSaldo_restante_dolar() - monto_total; //esta variable es igual al saldo restante del gasto menos el monto ingresado
                                                                        montototal = monto_total;//esta variable mantiene el valor del monto ingresado siempre que sea positivo
                                                                        monto_total = monto_total - lista_detalles.get(q).getSaldo_restante_dolar();//el monto restante disponible para continuar el ciclo es = al monto ingresado-el saldo restante del gasto

                                                                        if (varsaldo < 0) { //si el resultado de la operacion anterior es negativo quiere decir que se ha pagado por completo el gasto por lo tanto el saldo restante se le asigna 0
                                                                            varsaldo = 0;
                                                                            montototal = lista_detalles.get(q).getSaldo_restante_dolar(); //si el saldo restante es 0 quiere decir que el monto pagado a ese gasto es el total
                                                                        }
                                                                        modcuen.setMonto(Double.parseDouble(Validacion.formatopago1.format(montototal))); //seteamos el monto que se ha pagado del gasto
                                                                        modcuen.cer.setId(lista_detalles.get(q).getId());//seteamos id del gasto
                                                                        modcuen.setMoneda(vista.cbxMoneda.getSelectedItem().toString());//seteamos la moneda
                                                                        modc.setSaldo_restante_dolar(Double.parseDouble(Validacion.formatopago1.format(varsaldo)));//seteamos el saldo restante del gasto
                                                                        modc.setId(lista_detalles.get(q).getId());
                                                                        modc.actualizarTotalDolar(modc);//actualizo el saldo restante en dolar
                                                                        if (montototal != 0) {
                                                                            modcuen.guardarpuentepagos(modcuen);//guardamos el detalle del pago del gasto en especifico
                                                                        }

                                                                    }
                                                                }

                                                                try {
                                                                    ConexionBD con = new ConexionBD();
                                                                    Connection conn = con.getConexion();

                                                                    JasperReport reporte = null;
                                                                    String path = "src\\reportes\\mes_pago.jasper";

                                                                    Map parametros = new HashMap();
                                                                    parametros.put("n_unidad", vista.jComboUnidad.getSelectedItem().toString());

                                                                    reporte = (JasperReport) JRLoader.loadObjectFromFile(path);

                                                                    JasperPrint jprint = JasperFillManager.fillReport(path, parametros, conn);

                                                                    JasperViewer view = new JasperViewer(jprint, false);

                                                                    view.setDefaultCloseOperation(DISPOSE_ON_CLOSE);

                                                                    view.setVisible(true);
                                                                } catch (JRException ex) {
                                                                    Logger.getLogger(Catalogo.class.getName()).log(Level.SEVERE, null, ex);
                                                                }
                                                            }
                                                            if ((vista.jTable1.getValueAt(i, 6).equals("BOLÍVAR"))) {//si el recibo la moneda dominante es en bs
                                                                double varsaldo = 0;
                                                                double montototal = 0;
                                                                for (int q = 0; q < lista_detalles.size(); q++) {// ciclo para pagar cada uno de los gastos dentro del recibo
                                                                    if (monto_total > 0) {//si todavia queda dinero sin utilizar continua el ciclo

                                                                        varsaldo = lista_detalles.get(q).getSaldo_restante_bs() - (monto_total * Double.parseDouble(vista.txtParidad.getText())); //esta variable es igual al saldo restante del gasto menos el monto ingresado dividido por la paridad
                                                                        montototal = monto_total; //esta variable mantiene el valor del monto ingresado siempre que sea positivo
                                                                        monto_total = monto_total - (lista_detalles.get(q).getSaldo_restante_bs() / Double.parseDouble(vista.txtParidad.getText()));//el monto restante disponible para continuar el ciclo es = al monto ingresado-el saldo restante del gasto/la paridad
                                                                        if (varsaldo < 0) {//si el resultado de la operacion anterior es negativo quiere decir que se ha pagado por completo el gasto por lo tanto el saldo restante se le asigna 0
                                                                            varsaldo = 0;
                                                                            montototal = lista_detalles.get(q).getSaldo_restante_bs() / Double.parseDouble(vista.txtParidad.getText()); //si el saldo restante es 0 quiere decir que el monto pagado a ese gasto es el total / la paridad

                                                                        }
                                                                        modcuen.setMonto(Double.parseDouble(Validacion.formatopago1.format(montototal)));//seteamos el monto que se ha pagado del gasto
                                                                        modcuen.cer.setId(lista_detalles.get(q).getId());//seteamos id del gasto
                                                                        modcuen.setMoneda(vista.cbxMoneda.getSelectedItem().toString());//seteamos la moneda
                                                                        modc.setSaldo_restante_bs(Double.parseDouble(Validacion.formatopago1.format(varsaldo)));//seteamos el saldo restante del gasto
                                                                        modc.setId(lista_detalles.get(q).getId());
                                                                        modc.actualizarTotalBolivar(modc);//actualizo el saldo restante en bs
                                                                        if (montototal != 0) {
                                                                            modcuen.guardarpuentepagos(modcuen);//guardamos el detalle del pago del gasto en especifico
                                                                        }

                                                                    }
                                                                }
                                                                try {
                                                                    ConexionBD con = new ConexionBD();
                                                                    Connection conn = con.getConexion();

                                                                    JasperReport reporte = null;
                                                                    String path = "src\\reportes\\mes_pago.jasper";

                                                                    Map parametros = new HashMap();
                                                                    parametros.put("n_unidad", vista.jComboUnidad.getSelectedItem().toString());

                                                                    reporte = (JasperReport) JRLoader.loadObjectFromFile(path);

                                                                    JasperPrint jprint = JasperFillManager.fillReport(path, parametros, conn);

                                                                    JasperViewer view = new JasperViewer(jprint, false);

                                                                    view.setDefaultCloseOperation(DISPOSE_ON_CLOSE);

                                                                    view.setVisible(true);
                                                                } catch (JRException ex) {
                                                                    Logger.getLogger(Catalogo.class.getName()).log(Level.SEVERE, null, ex);
                                                                }
                                                            }
                                                        }

                                                    }
                                                }
                                            }

                                            modc.uni.setId(listaunidades.get(ind).getId());

                                            listaDominante = modc.listarDominantes(); //llenamos la lista de monedas dominantes

                                            Llenartabla(vista.jTable1, listaDominante); //llenamos la tabla de recibos pendientes
                                            addCheckBox(7, vista.jTable1);//añadimos checkbox a la tabla
                                            Llenartablapagados(vista.jTable2); //llenamos la tabla de recibos pagados
                                            vista.jComboFondo.removeAllItems();//vaciamos combobox fondo
                                            modfon.setMoneda(vista.cbxMoneda.getSelectedItem().toString());//seteamos moneda
                                            listafondo = modfon.listar(2);
                                            crearCbxFondo(listafondo);//llenamos combobox fondo con datos actializados

                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

    }

    private void crearCbxUnidad(ArrayList<Unidad> datos) { //funcion para crear combobox unidades
        vista.jComboUnidad.addItem("Seleccione el numero de la unidad");
        vista.jComboUnidad.setFocusable(false);
        if (datos != null) {
            for (Unidad datosX : datos) {
                moduni = datosX;
                vista.jComboUnidad.addItem(moduni.getNumeroUnidad());
            }

        }
    }

    private void crearCbxFormadePago(ArrayList<FormaPago> datos) {//funcion para crear combobox forma de pago
        vista.jComboForma.setFocusable(false);
        if (datos != null) {
            for (FormaPago datosX : datos) {
                modfor = datosX;
                vista.jComboForma.addItem(modfor.getForma_pago());
            }

        }
    }

    private void crearCbxFondo(ArrayList<Fondo> datos) {//funcion para crear combobox fondo
        vista.jComboFondo.addItem("Seleccione el fondo a depositar");
        vista.jComboFondo.setFocusable(false);
        if (datos != null) {
            for (Fondo datosX : datos) {
                modfon = datosX;
                vista.jComboFondo.addItem(modfon.getTipo() + " " + Validacion.formatopago1.format(modfon.getSaldo()) + " " + modfon.getMoneda());
            }

        }
    }

    private void crearCbxCuenta(ArrayList<Cuenta> datos) { //funcion para crear combobox cuenta
        vista.jComboCuenta.addItem("Seleccione la cuenta depositada");
        vista.jComboCuenta.addItem("OTROS");
        vista.jComboCuenta.setFocusable(false);
        if (datos != null) {
            for (Cuenta datosX : datos) {
                modcu = datosX;
                vista.jComboCuenta.addItem(modcu.getN_cuenta() + " " + modcu.getBeneficiario().getCedula() + " " + modcu.getBeneficiario());
            }

        }
    }

    @Override
    public void itemStateChanged(ItemEvent e) {//cuando cambie el item seleccionado en el select
        if (e.getSource() == vista.jComboUnidad) {//de unidades
            if (e.getStateChange() == ItemEvent.SELECTED) {
                listaunidades = moduni.listar();//trae la lista de unidades
                int ind = vista.jComboUnidad.getSelectedIndex() - 1;//seleeciona la posicion en la lista
                if (ind == -1) {

                } else {
                    modc.uni.setId(listaunidades.get(ind).getId());//setea el id de la unidad seleccionada

                    listaDominante = modc.listarDominantes(); //llenamos la lista de monedas dominantes

                    Llenartabla(vista.jTable1, listaDominante);//llenamos la tabla de recibos pendientes
                    addCheckBox(7, vista.jTable1);//añadimos checkbox a la tabla
                    Llenartablapagados(vista.jTable2); //llenamos la tabla de recibos pagados
                }
            }
            vista.jComboUnidad.setFocusable(false);
        }
        if (e.getSource() == vista.cbxMoneda) {//de moneda
            vista.jComboFondo.removeAllItems();//limpie lo que hay en combobox fondo
            modfon.setMoneda(vista.cbxMoneda.getSelectedItem().toString());//seteamos la moneda
            listafondo = modfon.listar(2);
            crearCbxFondo(listafondo);//rellenamos el combobox con fondos acorde a la moneda seleccionada
            vista.cbxMoneda.setFocusable(false);
        }

    }

    private Boolean validar() {

        Boolean resultado = true;
        String msj = "";

        if (vista.txtMonto.getText().isEmpty()) {

            msj += "El campo monto no puede estar vacío \n";
            resultado = false;
        }

        if (vista.txtReferencia.getText().isEmpty()) {

            msj += "El campo de número de referencia no puede estar vacío \n";
            resultado = false;
        }

        if (vista.txtDescripcion.getText().isEmpty()) {

            msj += "El campo descripción no puede estar vacío \n";
            resultado = false;
        }

        if (!resultado) {

            UIManager UI = new UIManager();
            UI.put("OptionPane.border", createLineBorder(new Color(0, 94, 159), 5));
            UI.put("Panel.background", new ColorUIResource(255, 255, 255));

            int botonDialogo = JOptionPane.OK_OPTION;
            Icon p = new ImageIcon(getClass().getResource("/img/warning.png"));
            UIManager.put("Button.background", Color.white);
            UIManager.put("Button.font", Color.blue);
            UIManager.put("Button.font", new Font("Tahoma", Font.BOLD, 12));
            UIManager.put("Label.background", Color.blue);
            UIManager.put("Label.font", new Font("Tahoma", Font.BOLD, 12));

            JOptionPane.showMessageDialog(null, msj, "ADVERTENCIA", JOptionPane.WARNING_MESSAGE, p);
        }

        return resultado;
    }

    public void addCheckBox(int column, JTable table) {//funcion para añadir checkbox a una tabla
        TableColumn tc = table.getColumnModel().getColumn(column);
        tc.setCellEditor(table.getDefaultEditor(Boolean.class));
        tc.setCellRenderer(table.getDefaultRenderer(Boolean.class));
    }

    @Override
    public void keyTyped(KeyEvent e) {
        if (e.getSource() == vista.txtReferencia) {

            Validacion.Espacio(e);
            Validacion.limite(e, vista.txtReferencia.getText(), 50);
        }

        if (e.getSource() == vista.txtDescripcion) {

            Validacion.limite(e, vista.txtDescripcion.getText(), 500);
        }
        if (e.getSource() == vista.txtMonto) {

            Validacion.Espacio(e);
            Validacion.soloUnPunto(e, vista.txtMonto.getText());
        }
    }

    @Override
    public void keyPressed(KeyEvent e) {

    }

    @Override
    public void keyReleased(KeyEvent e) {

    }

    private static boolean isValidDouble(String s) {//funcion para validar si un dato es numerico
        boolean isValid = true;

        try {
            Double.parseDouble(s);
        } catch (NumberFormatException nfe) {
            isValid = false;
        }

        return isValid;
    }

    public void stylecombo(JComboBox c) {
        c.setFont(new Font("Tahoma", Font.BOLD, 14));
        c.setForeground(Color.WHITE);

        c.setBorder(BorderFactory.createLineBorder(new Color(255, 255, 255), 2));
    }

}
