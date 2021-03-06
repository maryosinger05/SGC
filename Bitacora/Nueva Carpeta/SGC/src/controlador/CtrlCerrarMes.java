/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.BorderFactory;
import static javax.swing.BorderFactory.createLineBorder;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.RowFilter;
import javax.swing.SwingConstants;
import javax.swing.UIManager;
import static javax.swing.WindowConstants.DISPOSE_ON_CLOSE;
import javax.swing.plaf.ColorUIResource;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;
import modelo.CerrarMes;
import modelo.ConexionBD;
import modelo.Gasto;

import modelo.Interes;
import modelo.Sancion;
import modelo.Unidad;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
import vista.Catalogo;
import vista.PantallaPrincipal;
import vista.VisCerrarMes;

/**
 *
 * @author rma
 */
public class CtrlCerrarMes extends JComboBox implements ActionListener, KeyListener, ItemListener {

    private VisCerrarMes vista;
    private CerrarMes modc;
    private Unidad moduni;
    ArrayList<Unidad> listaunidades;

    ArrayList<Gasto> listaGastos;
    ArrayList<Sancion> listasanciones;
    ArrayList<Interes> listainteres;
    ArrayList<CerrarMes> listaCierremes;
    private PantallaPrincipal panta1;

    private Gasto modcuo;
    private Sancion modsan;
    private Interes modin;
    private Catalogo catalogo;
    DefaultTableModel dm;

    public CtrlCerrarMes() {

        this.vista = new VisCerrarMes();
        this.modc = new CerrarMes();
        this.moduni = new Unidad();

        this.modcuo = new Gasto();
        this.modsan = new Sancion();
        this.modin = new Interes();
        this.catalogo = new Catalogo();
        catalogo.lblTitulo.setText("Cerrar mes");

        CtrlVentana.cambiarVista(catalogo);

        vista.cbxMoneda.addItemListener(this);
        stylecombo(vista.cbxMoneda);

        Llenartabla(catalogo.tabla);
        vista.jButton1.addActionListener(this);
        vista.btnSalir.addActionListener(this);
        catalogo.btnNuevo.addActionListener(this);
        catalogo.txtBuscar.addKeyListener(this);
        catalogo.reportes.addActionListener(this);

    }

    public void Llenartabla(JTable tablaD) {

        listaCierremes = modc.listar();
        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {

                return false;
            }

        };
        TableRowSorter<DefaultTableModel> tr = new TableRowSorter<>(modeloT);
        tablaD.setRowSorter(tr);
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);
        tablaD.getTableHeader().setResizingAllowed(false);

        modeloT.addColumn("Nº de Unidad");
        modeloT.addColumn("Mes");
        modeloT.addColumn("Año");
        modeloT.addColumn("Monto dolar");
        modeloT.addColumn("Monto bolivar");

        Object[] columna = new Object[5];

        int numRegistro = listaCierremes.size();

        for (int i = 0; i < numRegistro; i++) {

            columna[0] = listaCierremes.get(i).uni.getNumeroUnidad();
            columna[1] = listaCierremes.get(i).getMes_cierre();
            columna[2] = listaCierremes.get(i).getAño_cierre();
            columna[3] = Validacion.formatopago.format(listaCierremes.get(i).getMonto_dolar());
            columna[4] = Validacion.formatopago.format(listaCierremes.get(i).getMonto_bolivar());

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

    @Override
    public void actionPerformed(ActionEvent e) {
        
        if (e.getSource() == catalogo.reportes) {

            try {
                ConexionBD con = new ConexionBD();
                Connection conn = con.getConexion();

                JasperReport reporte = null;
                String path = "src\\reportes\\cerrar.jasper";

                String x = catalogo.txtBuscar.getText();

                Map parametros = new HashMap();
                parametros.put("cerrar", x);

                reporte = (JasperReport) JRLoader.loadObjectFromFile(path);

                JasperPrint jprint = JasperFillManager.fillReport(path, parametros, conn);

                JasperViewer view = new JasperViewer(jprint, false);

                view.setDefaultCloseOperation(DISPOSE_ON_CLOSE);

                view.setVisible(true);
            } catch (JRException ex) {
                Logger.getLogger(Catalogo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (e.getSource() == catalogo.btnNuevo) {
            CtrlVentana.cambiarVista(vista);

        }
        if (e.getSource() == vista.jButton1) {
            if (validar()) {
                Calendar c1 = Calendar.getInstance();
                int messis = (c1.get(Calendar.MONTH)) + 1;
                int anniosis = (c1.get(Calendar.YEAR));

                modc.setMes_cierre(vista.txtMes.getSelectedIndex() + 1);
                modc.setAño_cierre(Integer.parseInt(vista.txtAnio.getSelectedItem().toString()));
                int mm = modc.getMes_cierre();
                if (modc.getAño_cierre() <= anniosis) {
                    if (modc.getAño_cierre() < anniosis) {
                        mm = mm - 13;
                    }
                    if (mm <= messis) {
                        if (modc.buscarfechas(modc)) {

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

                            JOptionPane.showMessageDialog(null, "Este mes ya se ha cerrado ", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE, p);
                        } else {
                            modc.setMes_cierre(vista.txtMes.getSelectedIndex() + 1);
                            modc.setAño_cierre(Integer.parseInt(vista.txtAnio.getSelectedItem().toString()));
                            listaunidades = moduni.listar();

                            int numRegistro = listaunidades.size();

                            listaGastos = modcuo.listarGastos();

                            int numCuotas = listaGastos.size();
                            Object[] tipo_cuota = new Object[numCuotas];
                            Object[] id_cuota = new Object[numCuotas];

                            int numReales = 0;

                            int mes = vista.txtMes.getSelectedIndex() + 1;
                            int año = Integer.parseInt(vista.txtAnio.getSelectedItem().toString());
                            if (numCuotas == 0) {

                            } else {

                                for (int z = 0; z < numCuotas; z++) {
                                    id_cuota[z] = listaGastos.get(z).getId();
                                    mes = vista.txtMes.getSelectedIndex() + 1;
                                    int mes_c = listaGastos.get(z).getMes();
                                    int año_c = listaGastos.get(z).getAnio();
                                    int meses_r = listaGastos.get(z).getMesesRestantes();
                                    int meses_t = listaGastos.get(z).getNumMeses();

                                    tipo_cuota[z] = listaGastos.get(z).getCalcular();
                                    int var1 = mes_c + meses_t;
                                    System.out.println(var1 + "=" + mes_c + "+" + listaGastos.get(z).getMesesRestantes());
                                    double monto_t = listaGastos.get(z).getMonto();
                                    System.out.println("var1 " + var1);
                                    System.out.println("gasto id:" + listaGastos.get(z).getId());
                                    double parte_periodo = monto_t / meses_t;

                                    if (año >= año_c) {

                                        if (año > año_c) {
                                            mes_c = mes_c - 11;

                                        }

                                        if (mes >= mes_c) {

                                            if (var1 > 13) {
                                                int var2 = var1;
                                                var1 = var1 - 12;
                                                mes = mes - 12;
                                                año_c = año_c + 1;
                                                if (var2 > 25) {
                                                    var1 = var1 - 12;
                                                    mes = mes - 12;
                                                    año_c = año_c + 1;
                                                }
                                            }

                                            if (año <= año_c) {

                                                if (mes < var1) {

                                                    String tipo = String.valueOf(tipo_cuota[z]);

                                                    if (numRegistro > 0) {

                                                        System.out.println("antes" + meses_r);
                                                        modc.gasto.setMesesRestantes(meses_r - 1);
                                                        System.out.println("despues" + modc.gasto.getMesesRestantes());
                                                        modc.gasto.setId(Integer.parseInt(String.valueOf(id_cuota[z])));

                                                        if (modc.gasto.getMesesRestantes() == 0) {
                                                            modc.setEstado("Mensualidad Completada");
                                                            modc.actualizar_cuota(modc);

                                                        } else {
                                                            modc.setEstado("Mensualidad en Proceso");
                                                            modc.actualizar_cuota(modc);

                                                        }
                                                    }

                                                    if (tipo.equals("ALICUOTA")) {

                                                        for (int w = 0; w < numRegistro; w++) {

                                                            double parte_cuota = parte_periodo * listaunidades.get(w).getAlicuota();
                                                            parte_cuota = Math.round(parte_cuota * 100);
                                                            parte_cuota = parte_cuota / 100;

                                                            if (listaGastos.get(z).getMoneda().equals("BOLÍVAR")) {

                                                                double paridad = Double.parseDouble(vista.txtParidad.getText());
                                                                double total_dolar = parte_cuota / paridad;

                                                                modc.setMonto_bolivar(parte_cuota);
                                                                total_dolar = Math.round(total_dolar * 100);
                                                                total_dolar = total_dolar / 100;
                                                                if (total_dolar == 0) {
                                                                    total_dolar = 0.01;
                                                                }
                                                                modc.setMonto_dolar(total_dolar);

                                                            } else {
                                                                double paridad = Double.parseDouble(vista.txtParidad.getText());
                                                                double total_bolivar = parte_cuota * paridad;
                                                                total_bolivar = Math.round(total_bolivar * 100);
                                                                total_bolivar = total_bolivar / 100;
                                                                modc.setMonto_bolivar(total_bolivar);

                                                                modc.setMonto_dolar(parte_cuota);
                                                            }
                                                            modc.setId(listaGastos.get(z).getId());
                                                            modc.setParidad(Double.parseDouble(vista.txtParidad.getText()));
                                                            modc.setMoneda_dominante(vista.cbxMoneda.getSelectedItem().toString());
                                                            modc.gasto.setId(Integer.parseInt(String.valueOf(id_cuota[z])));
                                                            modc.setTipo_gasto(listaGastos.get(z).getTipo());
                                                            modc.uni.setId(listaunidades.get(w).getId());
                                                            modc.uni.setAlicuota(listaunidades.get(w).getAlicuota());
                                                            modc.registrar_cuota(modc);

                                                            numReales = numReales + 1;

                                                        }
                                                    } else {
                                                        for (int w = 0; w < numRegistro; w++) {

                                                            double parte_cuota = parte_periodo / numRegistro;
                                                            modc.setId(listaGastos.get(z).getId());
                                                            if (listaGastos.get(z).getMoneda().equals("BOLÍVAR")) {
                                                                double paridad = Double.parseDouble(vista.txtParidad.getText());
                                                                double total_dolar = parte_cuota / paridad;
                                                                parte_cuota = Math.round(parte_cuota * 100);
                                                                parte_cuota = parte_cuota / 100;
                                                                modc.setMonto_bolivar(parte_cuota);
                                                                total_dolar = Math.round(total_dolar * 100);
                                                                total_dolar = total_dolar / 100;
                                                                if (total_dolar == 0) {
                                                                    total_dolar = 0.01;
                                                                }
                                                                modc.setMonto_dolar(total_dolar);
                                                            } else {
                                                                double paridad = Double.parseDouble(vista.txtParidad.getText());
                                                                double total_bolivar = parte_cuota * paridad;
                                                                total_bolivar = Math.round(total_bolivar * 100);
                                                                total_bolivar = total_bolivar / 100;
                                                                modc.setMonto_bolivar(total_bolivar);
                                                                parte_cuota = Math.round(parte_cuota * 100);
                                                                parte_cuota = parte_cuota / 100;
                                                                modc.setMonto_dolar(parte_cuota);
                                                            }
                                                            modc.uni.setId(listaunidades.get(w).getId());
                                                            modc.setTipo_gasto(listaGastos.get(z).getTipo());
                                                            modc.setParidad(Double.parseDouble(vista.txtParidad.getText()));
                                                            modc.setMoneda_dominante(vista.cbxMoneda.getSelectedItem().toString());
                                                            modc.uni.setAlicuota(listaunidades.get(w).getAlicuota());
                                                            modc.registrar_cuota(modc);

                                                            numReales = numReales + 1;

                                                        }
                                                    }

                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            modsan.setMes(modc.getMes_cierre());
                            modsan.setAño(modc.getAño_cierre());
                            listasanciones = modsan.listarSancionesCerrarmes();
                            int numSanciones = listasanciones.size();
                            Object[] tipo_sancion = new Object[numSanciones];
                            Object[] factor_sancion = new Object[numSanciones];
                            Object[] id_sancion = new Object[numSanciones];
                            if (numReales == 0) {

                            } else {
                                for (int j = 0; j < numSanciones; j++) {
                                    tipo_sancion[j] = listasanciones.get(j).getTipo();
                                    factor_sancion[j] = listasanciones.get(j).getMonto();
                                    id_sancion[j] = listasanciones.get(j).getId();
                                    String var = String.valueOf(tipo_sancion[j]);
                                    modc.uni.setAlicuota(listasanciones.get(j).uni.getAlicuota());

                                    if (var.equals("INTERES DE MORA")) {
                                        double monto = 0;
                                        modc.gasto.setId(listasanciones.get(j).getId());
                                        if (vista.cbxMoneda.getSelectedItem().toString().equals("DÓLAR")) {

                                            modc.buscartotal(modc, 2);
                                            monto = modc.getMonto_dolar();
                                        } else {
                                            modc.buscartotal(modc, 1);
                                            monto = modc.getMonto_bolivar();
                                        }

                                        double totalf = Double.parseDouble(String.valueOf(factor_sancion[j])) / 100;
                                        double var3 = monto * totalf;

                                        modc.gasto.setId(Integer.parseInt(String.valueOf(id_sancion[j])));
                                        modc.uni.setId(listasanciones.get(j).uni.getId());

                                        if (vista.cbxMoneda.getSelectedItem().toString().equals("DÓLAR")) {
                                            var3 = Math.round(var3 * 100);
                                            var3 = var3 / 100;
                                            modc.setMonto_dolar(var3);
                                            double var4 = var3 * Double.parseDouble(vista.txtParidad.getText());
                                            var4 = Math.round(var4 * 100);
                                            var4 = var4 / 100;
                                            modc.setMonto_bolivar(var4);

                                        } else {
                                            var3 = Math.round(var3 * 100);
                                            var3 = var3 / 100;
                                            modc.setMonto_bolivar(var3);
                                            double var4 = var3 / Double.parseDouble(vista.txtParidad.getText());
                                            var4 = Math.round(var4 * 100);
                                            var4 = var4 / 100;
                                            modc.setMonto_dolar(var4);

                                        }
                                        modc.setParidad(Double.parseDouble(vista.txtParidad.getText()));
                                        modc.setMoneda_dominante(vista.cbxMoneda.getSelectedItem().toString());

                                        modc.setEstado("Procesado");
                                        modc.setTipo_gasto("Sancion");
                                        modc.guardarsancionpro(modc);
                                        modc.actualizarSancion(modc);

                                    }

                                    if (var.equals("MULTA")) {

                                        modc.setId(listasanciones.get(j).getId());
                                        if (listasanciones.get(j).getMoneda().equals("DÓLAR")) {
                                            modc.setMonto_dolar(listasanciones.get(j).getMonto());
                                            double var10 = listasanciones.get(j).getMonto() * Double.parseDouble(vista.txtParidad.getText());
                                            var10 = Math.round(var10 * 100);
                                            var10 = var10 / 100;
                                            modc.setMonto_bolivar(var10);
                                        } else {
                                            modc.setMonto_bolivar(listasanciones.get(j).getMonto());
                                            double var10 = listasanciones.get(j).getMonto() / Double.parseDouble(vista.txtParidad.getText());
                                            var10 = Math.round(var10 * 100);
                                            var10 = var10 / 100;
                                            modc.setMonto_dolar(var10);
                                        }

                                        modc.gasto.setId(Integer.parseInt(String.valueOf(id_sancion[j])));
                                        modc.uni.setId(listasanciones.get(j).uni.getId());
                                        modc.setTipo_gasto("Sancion");

                                        modc.setParidad(Double.parseDouble(vista.txtParidad.getText()));
                                        modc.setMoneda_dominante(vista.cbxMoneda.getSelectedItem().toString());

                                        modc.setEstado("Procesado");
                                        modc.guardarsancionpro(modc);
                                        modc.actualizarSancion(modc);

                                    }
                                }
                            }

                            listainteres = modin.listarInteres();
                            int numInteres = listainteres.size();
                            Object[] id_interes = new Object[numInteres];
                            Object[] factor = new Object[numInteres];
                            if (numReales == 0) {

                            } else {
                                for (int l = 0; l < numInteres; l++) {
                                    id_interes[l] = listainteres.get(l).getId();
                                    factor[l] = listainteres.get(l).getFactor();

                                    for (int w = 0; w < numRegistro; w++) {
                                        modc.uni.setId(listaunidades.get(w).getId());
                                        double monto = 0;

                                        modc.buscartotal(modc, 1);
                                        monto = modc.getMonto_bolivar();

                                        double var9 = Double.parseDouble(String.valueOf(factor[l])) / 100;

                                        double parte_cuota = monto * var9;
                                        parte_cuota = Math.round(parte_cuota * 100);
                                        parte_cuota = parte_cuota / 100;
                                        double var10 = parte_cuota / Double.parseDouble(vista.txtParidad.getText());
                                        var10 = Math.round(var10 * 100);
                                        var10 = var10 / 100;
                                        modc.setMonto_dolar(var10);
                                        modc.setMonto_bolivar(parte_cuota);
                                        modc.gasto.setId(listainteres.get(l).getId());

                                        modc.uni.setId(listaunidades.get(w).getId());
                                        modc.setTipo_gasto("Interes");

                                        modc.setParidad(Double.parseDouble(vista.txtParidad.getText()));
                                        modc.setMoneda_dominante(vista.cbxMoneda.getSelectedItem().toString());
                                        modc.uni.setAlicuota(listaunidades.get(w).getAlicuota());
                                        modc.registrar_interes(modc);

                                    }

                                }
                            }

                            if (numReales > 0) {

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

                                JOptionPane.showMessageDialog(null, "Cierre satisfactorio ", "¡FELICIDADES!", JOptionPane.INFORMATION_MESSAGE, p);
                                Llenartabla(catalogo.tabla);
                                CtrlVentana.cambiarVista(catalogo);
                            } else {

                                modc.borrarnulo(modc);

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

                                JOptionPane.showMessageDialog(null, "No hay gastos por cerrar ", "¡FELICIDADES!", JOptionPane.INFORMATION_MESSAGE, p);
                            }
                        }
                    } else {

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

                        JOptionPane.showMessageDialog(null, "No puede cerrar un mes que no ha concluido ", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE, p);
                    }
                } else {

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

                    JOptionPane.showMessageDialog(null, "No puede cerrar un mes que no ha concluido ", "ADVERTENCIA", JOptionPane.WARNING_MESSAGE, p);
                }
            }
        }
        if (e.getSource() == vista.btnSalir) {
            CtrlVentana.cambiarVista(catalogo);
        }
    }

    @Override
    public void keyTyped(KeyEvent e
    ) {

    }

    @Override
    public void keyPressed(KeyEvent e
    ) {

    }

    @Override
    public void keyReleased(KeyEvent e
    ) {
        if (e.getSource() == catalogo.txtBuscar) {

            filtro(catalogo.txtBuscar.getText(), catalogo.tabla);
        } else {

        }
    }

    private void filtro(String consulta, JTable jtableBuscar) {
        dm = (DefaultTableModel) jtableBuscar.getModel();
        TableRowSorter<DefaultTableModel> tr = new TableRowSorter<>(dm);
        jtableBuscar.setRowSorter(tr);
        tr.setRowFilter(RowFilter.regexFilter(consulta));

    }

    @Override
    public void itemStateChanged(ItemEvent e) {
        vista.cbxMoneda.setFocusable(false);
    }

    public void stylecombo(JComboBox c) {
        c.setFont(new Font("Tahoma", Font.BOLD, 14));
        c.setForeground(Color.WHITE);

        c.setBorder(BorderFactory.createLineBorder(new Color(255, 255, 255), 2));
    }

    private Boolean validar() {

        Boolean resultado = true;
        String msj = "";

        if (vista.txtParidad.getText().isEmpty()) {

            msj += "El campo paridad no puede estar vacío \n";
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

}
