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
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.RowFilter;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;
import modelo.CerrarMes;
import modelo.Gasto;
import modelo.GastoComun;
import modelo.Interes;
import modelo.Sancion;
import modelo.Unidades;
import vista.Catalogo;
import vista.PantallaPrincipal;
import vista.VisCerrarMes;

/**
 *
 * @author rma
 */
public class CtrlCerrarMes implements ActionListener, KeyListener {

    private VisCerrarMes vista;
    private CerrarMes modc;
    private Unidades moduni;
    ArrayList<Unidades> listaunidades;
    ArrayList<GastoComun> listagastocomun;
    ArrayList<Gasto> listacuotasespeciales;
    ArrayList<Sancion> listasanciones;
    ArrayList<Interes> listainteres;
    ArrayList<CerrarMes> listaCierremes;
    private PantallaPrincipal panta1;
    private GastoComun modgac;
    private Gasto modcuo;
    private Sancion modsan;
    private Interes modin;
    private Catalogo catalogo;
    DefaultTableModel dm;

    public CtrlCerrarMes() {

        this.vista = new VisCerrarMes();
        this.modc = new CerrarMes();
        this.moduni = new Unidades();

        this.modgac = new GastoComun();
        this.modcuo = new Gasto();
        this.modsan = new Sancion();
        this.modin = new Interes();
        this.catalogo = new Catalogo();
        catalogo.lblTitulo.setText("Cerrar mes");

        CtrlVentana.cambiarVista(catalogo);
        Llenartabla(catalogo.tabla);
        vista.jButton1.addActionListener(this);
        vista.btnSalir.addActionListener(this);
        catalogo.btnNuevo.addActionListener(this);
        catalogo.txtBuscar.addKeyListener(this);
        

    }

    public void Llenartabla(JTable tablaD) {

        listaCierremes = modc.listar();
        DefaultTableModel modeloT = new DefaultTableModel() {
            @Override
            public boolean isCellEditable(int row, int column) {

                return false;
            }

        };
        tablaD.setModel(modeloT);
        tablaD.getTableHeader().setReorderingAllowed(false);
        tablaD.getTableHeader().setResizingAllowed(false);

        modeloT.addColumn("Nº de Cierre");
        modeloT.addColumn("Mes");
        modeloT.addColumn("Año");

        Object[] columna = new Object[3];

        int numRegistro = listaCierremes.size();

        for (int i = 0; i < numRegistro; i++) {

            columna[0] = listaCierremes.get(i).getId_gasto();
            columna[1] = listaCierremes.get(i).getMes_cierre();
            columna[2] = listaCierremes.get(i).getAño_cierre();

            modeloT.addRow(columna);

        }
        DefaultTableCellRenderer tcr = new DefaultTableCellRenderer();
        tcr.setHorizontalAlignment(SwingConstants.CENTER);
        tablaD.getColumnModel().getColumn(0).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(1).setCellRenderer(tcr);
        tablaD.getColumnModel().getColumn(2).setCellRenderer(tcr);

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == catalogo.btnNuevo) {
            CtrlVentana.cambiarVista(vista);
        }
        if (e.getSource() == vista.jButton1) {
            Calendar c1 = Calendar.getInstance();
            int messis = (c1.get(Calendar.MONTH)) + 1;
            int anniosis = (c1.get(Calendar.YEAR));

            modc.setMes_cierre(vista.jMonthChooser1.getMonth() + 1);
            modc.setAño_cierre(vista.jYearChooser1.getYear());
            int mm = modc.getMes_cierre();
            if (modc.getAño_cierre() <= anniosis) {
                if (modc.getAño_cierre() < anniosis) {
                    mm = mm - 13;
                }
                if (mm <= messis) {
                    if (modc.buscarfechas(modc)) {
                        JOptionPane.showMessageDialog(null, "Este mes ya se ha cerrado");
                    } else {
                        modc.setMes_cierre(vista.jMonthChooser1.getMonth() + 1);
                        modc.setAño_cierre(vista.jYearChooser1.getYear());
                        listaunidades = moduni.listar();

                        int numRegistro = listaunidades.size();

                        Object[] area = new Object[numRegistro];
                        Object[] alicuota = new Object[numRegistro];
                        Object[] id_unidad = new Object[numRegistro];
                        Object[] id_factura = new Object[numRegistro];
                        double totalarea = 0;
                        for (int i = 0; i < numRegistro; i++) {

                            area[i] = listaunidades.get(i).getArea();
                            double areai = Double.parseDouble(String.valueOf(area[i]));
                            totalarea = areai + totalarea;
                            id_unidad[i] = listaunidades.get(i).getId();

                        }

                        for (int i = 0; i < numRegistro; i++) {

                            area[i] = listaunidades.get(i).getArea();
                            double areai = Double.parseDouble(String.valueOf(area[i]));
                            double ali = areai / totalarea;
                            alicuota[i] = ali;
                            modc.setId_unidad(listaunidades.get(i).getId());
                            modc.setMonto(0);
                            modc.setAlicuota(ali);
                            modc.setEstado("Pendiente de Pago");
                            modc.guardartotal(modc);
                            modc.buscaultimo(modc);

                            id_factura[i] = modc.getId();

                        }

                        modgac.setMes(modc.getMes_cierre());
                        modgac.setAño(modc.getAño_cierre());
                        listagastocomun = modgac.listarGastoComuncierremes();
                        int numGastos = listagastocomun.size();

                        if (numGastos == 0) {
                        } else {
                            Object[] concepto = new Object[numGastos];
                            Object[] proveedor = new Object[numGastos];
                            Object[] id_gasto = new Object[numGastos];
                            Object[] monto_gasto = new Object[numGastos];
                            Object[][] gastodes = new Object[numGastos][numRegistro];
                            Object[][] id_unidad_gasto = new Object[numGastos][numRegistro];
                            Object[] estado = new Object[numGastos];
                            DecimalFormat formato1 = new DecimalFormat("#.00");

                            for (int f = 0; f < numGastos; f++) {
                                concepto[f] = listagastocomun.get(f).getNombre_Concepto();
                                proveedor[f] = listagastocomun.get(f).getId_proveedor();
                                id_gasto[f] = listagastocomun.get(f).getId();
                                monto_gasto[f] = listagastocomun.get(f).getMonto();

                                for (int x = 0; x < numRegistro; x++) {

                                    double gastoxunidad = Double.parseDouble(String.valueOf(monto_gasto[f])) * Double.parseDouble(String.valueOf(alicuota[x]));

                                    gastodes[f][x] = gastoxunidad;
                                    id_unidad_gasto[f][x] = id_unidad[x];
                                    modc.setMonto(gastoxunidad);
                                    modc.setId_gasto(Integer.parseInt(String.valueOf(id_gasto[f])));

                                    modc.setId(Integer.parseInt(String.valueOf(id_factura[x])));

                                    if (listagastocomun.get(f).getEstado().equals("Pendiente")) {
                                        modc.setEstado("Procesado");

                                    }
                                    if (listagastocomun.get(f).getEstado().equals("Pagado")) {
                                        modc.setEstado("Procesado y pagado");
                                    }
                                    modc.setTipo_gasto("Gasto comun");

                                    modc.registrarGasto(modc);
                                    modc.actualizarGasto(modc);

                                }

                            }
                        }

                        listacuotasespeciales = modcuo.listarCuotasEspecialescerrarmes();
                        int numCuotas = listacuotasespeciales.size();
                        Object[] tipo_cuota = new Object[numCuotas];
                        Object[] id_cuota = new Object[numCuotas];
                        Object[] año_cuota = new Object[numCuotas];
                        int numReales = 0;

                        int mes = modc.getMes_cierre();
                        int año = modc.getAño_cierre();
                        if (numCuotas == 0) {

                        } else {

                            for (int z = 0; z < numCuotas; z++) {
                                id_cuota[z] = listacuotasespeciales.get(z).getId();
                                int mes_c = listacuotasespeciales.get(z).getMes();
                                int año_c = listacuotasespeciales.get(z).getAño();
                                int meses_r = listacuotasespeciales.get(z).getN_meses();
                                tipo_cuota[z] = listacuotasespeciales.get(z).getCalcular();
                                int var1 = mes_c + meses_r;
                                double monto_t = listacuotasespeciales.get(z).getMonto();

                                double parte_periodo = monto_t / meses_r;

                                if (año >= año_c) {

                                    if (año > año_c) {
                                        mes_c = mes_c - 11;

                                    }

                                    if (mes >= mes_c) {

                                        if (var1 > 13) {
                                            int var2 = var1;
                                            var1 = var1 - 12;
                                            año_c = año_c + 1;
                                            if (var2 > 25) {
                                                var1 = var1 - 12;
                                                año_c = año_c + 1;
                                            }
                                        }
                                        if (año <= año_c) {

                                            if (mes < var1) {

                                                String tipo = String.valueOf(tipo_cuota[z]);

                                                String clave = "Alicuota";
                                                if (numRegistro > 0) {
                                                    modc.setMeses_res(listacuotasespeciales.get(z).getN_meses_restantes() - 1);
                                                    modc.setId_gasto(Integer.parseInt(String.valueOf(id_cuota[z])));

                                                    if (modc.getMeses_res() == 0) {
                                                        modc.setEstado("Mensualidad Completada");
                                                        modc.actualizar_cuota(modc);

                                                    } else {
                                                        modc.setEstado("Mensualidad en Proceso");
                                                        modc.actualizar_cuota(modc);

                                                    }
                                                }

                                                if (tipo.equals(clave)) {

                                                    for (int w = 0; w < numRegistro; w++) {

                                                        double parte_cuota = parte_periodo * Double.parseDouble(String.valueOf(alicuota[w]));
                                                        modc.setId(Integer.parseInt(String.valueOf(id_factura[w])));
                                                        modc.setMonto(parte_cuota);
                                                        modc.setId_gasto(Integer.parseInt(String.valueOf(id_cuota[z])));
                                                        modc.setTipo_gasto("Cuota especial");
                                                        modc.registrar_cuota(modc);
                                                        numReales = numReales + 1;

                                                    }
                                                } else {
                                                    for (int w = 0; w < numRegistro; w++) {

                                                        double parte_cuota = parte_periodo / numRegistro;
                                                        modc.setId(Integer.parseInt(String.valueOf(id_factura[w])));
                                                        modc.setMonto(parte_cuota);
                                                        modc.setId_gasto(Integer.parseInt(String.valueOf(id_cuota[z])));
                                                        modc.setTipo_gasto("Cuota especial");
                                                        modc.registrar_cuota(modc);
                                                        modc.actualizar_cuota(modc);
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
                        if (numGastos == 0 && numReales == 0) {

                        } else {
                            for (int j = 0; j < numSanciones; j++) {
                                tipo_sancion[j] = listasanciones.get(j).getTipo();
                                factor_sancion[j] = listasanciones.get(j).getMonto();
                                id_sancion[j] = listasanciones.get(j).getId_sancion();
                                String var = String.valueOf(tipo_sancion[j]);

                                if (var.equals("Interes de mora")) {
                                    int id_fac = listasanciones.get(j).getId();
                                    modc.setId(id_fac);
                                    modc.setTipo_gasto("Gasto comun");
                                    modc.buscartotal(modc);
                                    double var6 = modc.getMonto();
                                    modc.setTipo_gasto("Cuota especial");
                                    modc.buscartotal(modc);
                                    double var7 = modc.getMonto();

                                    double total = var6 + var7;
                                    double totalf = Double.parseDouble(String.valueOf(factor_sancion[j])) / 100;
                                    double var3 = total * totalf;

                                    modc.setId_gasto(Integer.parseInt(String.valueOf(id_sancion[j])));
                                    modc.setMonto(var3);
                                    modc.setEstado("Procesado");
                                    modc.setTipo_gasto("Sancion");
                                    modc.guardarsancionpro(modc);
                                    modc.actualizarSancion(modc);

                                }

                                if (var.equals("Multa")) {
                                    int id_fac = listasanciones.get(j).getId();
                                    modc.setId(id_fac);
                                    modc.setMonto(listasanciones.get(j).getMonto());
                                    modc.setId_gasto(Integer.parseInt(String.valueOf(id_sancion[j])));
                                    modc.setTipo_gasto("Sancion");
                                    modc.guardarsancionpro(modc);
                                    modc.setEstado("Procesado");

                                    modc.actualizarSancion(modc);

                                }
                            }
                        }

                        listainteres = modin.listarInteresCerrames();
                        int numInteres = listainteres.size();
                        Object[] id_interes = new Object[numInteres];
                        Object[] factor = new Object[numInteres];
                        if (numGastos == 0 && numReales == 0) {

                        } else {
                            for (int l = 0; l < numInteres; l++) {
                                id_interes[l] = listainteres.get(l).getId();
                                factor[l] = listainteres.get(l).getFactor();

                                for (int w = 0; w < numRegistro; w++) {
                                    modc.setId(Integer.parseInt(String.valueOf(id_factura[w])));
                                    modc.setTipo_gasto("Gasto comun");
                                    if (modc.buscartotal(modc)) {

                                    } else {
                                        modc.setMonto(0);
                                    }

                                    double var6 = modc.getMonto();
                                    modc.setTipo_gasto("Cuota especial");
                                    if (modc.buscartotal(modc)) {

                                    } else {
                                        modc.setMonto(0);
                                    }
                                    double var7 = modc.getMonto();
                                    double var9 = Double.parseDouble(String.valueOf(factor[l])) / 100;
                                    double total = var6 + var7;
                                    double parte_cuota = total * var9;

                                    modc.setId(Integer.parseInt(String.valueOf(id_factura[w])));
                                    modc.setMonto(parte_cuota);
                                    modc.setId_gasto(Integer.parseInt(String.valueOf(id_interes[l])));
                                    modc.setTipo_gasto("Interes");
                                    modc.registrar_interes(modc);

                                }

                            }
                        }

                        for (int m = 0; m < numRegistro; m++) {

                            modc.setId(Integer.parseInt(String.valueOf(id_factura[m])));
                            modc.setTipo_gasto("Gasto comun");
                            if (modc.buscartotal(modc)) {

                            } else {
                                modc.setMonto(0);
                            }
                            double var6 = modc.getMonto();
                            modc.setTipo_gasto("Cuota especial");
                            if (modc.buscartotal(modc)) {

                            } else {
                                modc.setMonto(0);
                            }
                            double var7 = modc.getMonto();
                            modc.setTipo_gasto("Sancion");
                            if (modc.buscartotal(modc)) {

                            } else {
                                modc.setMonto(0);
                            }
                            double var8 = modc.getMonto();
                            modc.setTipo_gasto("Interes");

                            if (modc.buscartotal(modc)) {

                            } else {
                                modc.setMonto(0);
                            }
                            double var9 = modc.getMonto();

                            double totalfinal = 0;
                            totalfinal = var6 + var7 + var8 + var9;
                            if (numGastos == 0 && numReales == 0) {

                            } else {
                                modc.setMonto(totalfinal);
                                modc.setAlicuota(Double.parseDouble(String.valueOf(alicuota[m])));
                                modc.setEstado("Pendiente de Pago");

                                modc.actualizartotalcierre(modc);

                            }
                        }
                        if (numGastos > 0 || numReales > 0) {

                            modc.cerrar_mes(modc);

                            JOptionPane.showMessageDialog(null, "Cierre satisfactorio");
                            Llenartabla(catalogo.tabla);
                            CtrlVentana.cambiarVista(catalogo);
                        } else {

                            modc.borrarnulo(modc);
                            JOptionPane.showMessageDialog(null, "No hay gastos por cerrar");
                        }
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "No puede cerrar un mes que no ha concluido");
                }
            } else {
                JOptionPane.showMessageDialog(null, "No puede cerrar un mes que no ha concluido");
            }
        }
        if (e.getSource() == vista.btnSalir) {
            CtrlVentana.cambiarVista(catalogo);
        }
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

}