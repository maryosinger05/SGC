package vista;

import controlador.controladoRegistroVisita;
import controlador.controladorAsambleas;
import controlador.controladorCerrarMes;
import controlador.controladorComunicados;
import controlador.controladorCuenta_Pagar;
import controlador.controladorCuentasPorCobrar;
import controlador.controladorCuotasEspeciales;
import controlador.controladorFondo;
import controlador.controladorGastoComun;
import controlador.controladorSancion;
import controlador.controladorUnidades;
import java.awt.Image;
import java.awt.Toolkit;
import javax.swing.JOptionPane;
import modelo.Asambleas;
import modelo.CerrarMes;
import modelo.Comunicados;
import modelo.CrudUsuario;
import modelo.Cuenta;
import modelo.Cuenta_Pagar;
import modelo.CuentasPorCobrar;
import modelo.CuotasEspeciales;
import modelo.Fondo;
import modelo.GastoComun;
import modelo.Interes;
import modelo.ModeloConceptoGastos;
import modelo.Propietarios;
import modelo.Proveedores;
import modelo.Registro_visitas;
import modelo.Sancion;
import modelo.Unidades;

/**
 *
 * @author Anthony
 */
public class PantallaPrincipal1 extends javax.swing.JFrame {

    /**
     * Creates new form PantallaPrincipal
     */
    public PantallaPrincipal1() {
        initComponents();

        this.setLocationRelativeTo(null);
        this.setTitle("Vista");
        this.setVisible(false);
    }

    public Image getIconImagine() {

        Image retValue = Toolkit.getDefaultToolkit().getImage(ClassLoader.getSystemResource("img/LogoSistema.png"));

        return retValue;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jMenu1 = new javax.swing.JMenu();
        jMenuItem8 = new javax.swing.JMenuItem();
        jTextField1 = new javax.swing.JTextField();
        btnSalir = new javax.swing.JButton();
        btnMinimizar = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        rif = new javax.swing.JTextField();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu2 = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuItem4 = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenuItem6 = new javax.swing.JMenuItem();
        jMenuItem7 = new javax.swing.JMenuItem();
        jMenuItem9 = new javax.swing.JMenuItem();
        jMenuItem10 = new javax.swing.JMenuItem();
        jMenu3 = new javax.swing.JMenu();
        jMenuItem11 = new javax.swing.JMenuItem();
        jMenuItem12 = new javax.swing.JMenuItem();
        jMenuItem13 = new javax.swing.JMenuItem();
        jMenuItem14 = new javax.swing.JMenuItem();
        jMenuItem15 = new javax.swing.JMenuItem();
        jMenu4 = new javax.swing.JMenu();
        jMenu5 = new javax.swing.JMenu();
        jMenu6 = new javax.swing.JMenu();

        jMenu1.setText("jMenu1");

        jMenuItem8.setText("jMenuItem8");

        jTextField1.setText("jTextField1");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setIconImage(getIconImage());
        setUndecorated(true);
        setResizable(false);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (1).png"))); // NOI18N
        btnSalir.setToolTipText("Cerrar");
        btnSalir.setBorder(null);
        btnSalir.setBorderPainted(false);
        btnSalir.setContentAreaFilled(false);
        btnSalir.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnSalir.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cancelar (2).png"))); // NOI18N
        btnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalirActionPerformed(evt);
            }
        });
        getContentPane().add(btnSalir, new org.netbeans.lib.awtextra.AbsoluteConstraints(850, 0, 40, -1));

        btnMinimizar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (1).png"))); // NOI18N
        btnMinimizar.setToolTipText("Minimizar");
        btnMinimizar.setBorder(null);
        btnMinimizar.setBorderPainted(false);
        btnMinimizar.setContentAreaFilled(false);
        btnMinimizar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnMinimizar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/menos (2).png"))); // NOI18N
        btnMinimizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnMinimizarActionPerformed(evt);
            }
        });
        getContentPane().add(btnMinimizar, new org.netbeans.lib.awtextra.AbsoluteConstraints(810, 0, 40, 30));

        jButton1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jButton1.setForeground(new java.awt.Color(0, 94, 159));
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/puerta.png"))); // NOI18N
        jButton1.setText("Volver al Menú Anterior");
        jButton1.setToolTipText("Regresar al menú de datos compartidos");
        jButton1.setBorder(null);
        jButton1.setBorderPainted(false);
        jButton1.setContentAreaFilled(false);
        jButton1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton1.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/logout (1).png"))); // NOI18N
        jButton1.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/logout.png"))); // NOI18N
        jButton1.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/logout (1).png"))); // NOI18N
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(630, 0, -1, 30));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/FPM.png"))); // NOI18N
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, -1, -1));

        rif.setEditable(false);
        getContentPane().add(rif, new org.netbeans.lib.awtextra.AbsoluteConstraints(650, 70, 60, -1));

        jMenuBar1.setBackground(new java.awt.Color(255, 255, 255));
        jMenuBar1.setBorder(null);
        jMenuBar1.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        jMenu2.setBackground(new java.awt.Color(255, 255, 255));
        jMenu2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file (1).png"))); // NOI18N
        jMenu2.setText("Archivos");
        jMenu2.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu2.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenu2.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file.png"))); // NOI18N
        jMenu2.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file (1).png"))); // NOI18N
        jMenu2.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file (1).png"))); // NOI18N
        jMenu2.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file (1).png"))); // NOI18N

        jMenuItem1.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/mesa-redonda.png"))); // NOI18N
        jMenuItem1.setText("Asambleas");
        jMenuItem1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem1);

        jMenuItem4.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/presupuesto.png"))); // NOI18N
        jMenuItem4.setText("Cuotas Especiales");
        jMenuItem4.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem4ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem4);

        jMenuItem2.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/alquiler-de-casa.png"))); // NOI18N
        jMenuItem2.setText("Gastos Comunes");
        jMenuItem2.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem2);

        jMenuItem6.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/no-stopping.png"))); // NOI18N
        jMenuItem6.setText("Sanciones");
        jMenuItem6.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem6ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem6);

        jMenuItem7.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/casa.png"))); // NOI18N
        jMenuItem7.setText("Unidades");
        jMenuItem7.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem7ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem7);

        jMenuItem9.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem9.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/hucha.png"))); // NOI18N
        jMenuItem9.setText("Fondo");
        jMenuItem9.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem9ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem9);

        jMenuItem10.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem10.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/mensaje.png"))); // NOI18N
        jMenuItem10.setText("Comunicados");
        jMenuItem10.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem10.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem10ActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuItem10);

        jMenuBar1.add(jMenu2);

        jMenu3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N
        jMenu3.setText("Procesos");
        jMenu3.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu3.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenu3.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel.png"))); // NOI18N
        jMenu3.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N
        jMenu3.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N
        jMenu3.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N

        jMenuItem11.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem11.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/dar-dinero.png"))); // NOI18N
        jMenuItem11.setText("Cuentas por Cobrar");
        jMenuItem11.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem11.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem11ActionPerformed(evt);
            }
        });
        jMenu3.add(jMenuItem11);

        jMenuItem12.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem12.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/metodo-de-pago.png"))); // NOI18N
        jMenuItem12.setText("Cuentas por Pagar");
        jMenuItem12.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem12.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem12ActionPerformed(evt);
            }
        });
        jMenu3.add(jMenuItem12);

        jMenuItem13.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem13.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/autorizacion.png"))); // NOI18N
        jMenuItem13.setText("Visitas Autorizadas");
        jMenuItem13.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem13.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem13ActionPerformed(evt);
            }
        });
        jMenu3.add(jMenuItem13);

        jMenuItem14.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem14.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cuota.png"))); // NOI18N
        jMenuItem14.setText("Pago de Cuotas Especiales");
        jMenuItem14.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem14.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem14ActionPerformed(evt);
            }
        });
        jMenu3.add(jMenuItem14);

        jMenuItem15.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jMenuItem15.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/factura.png"))); // NOI18N
        jMenuItem15.setText("Generar Recibo");
        jMenuItem15.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenuItem15.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem15ActionPerformed(evt);
            }
        });
        jMenu3.add(jMenuItem15);

        jMenuBar1.add(jMenu3);

        jMenu4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics.png"))); // NOI18N
        jMenu4.setText("Reportes");
        jMenu4.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu4.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenu4.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics (1).png"))); // NOI18N
        jMenu4.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics.png"))); // NOI18N
        jMenu4.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics.png"))); // NOI18N
        jMenu4.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics.png"))); // NOI18N
        jMenuBar1.add(jMenu4);

        jMenu5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/educacion.png"))); // NOI18N
        jMenu5.setText("Ayudas");
        jMenu5.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu5.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenuBar1.add(jMenu5);

        jMenu6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user (1).png"))); // NOI18N
        jMenu6.setText("Perfil");
        jMenu6.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jMenu6.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jMenu6.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user.png"))); // NOI18N
        jMenu6.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user (1).png"))); // NOI18N
        jMenu6.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user (1).png"))); // NOI18N
        jMenu6.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user (1).png"))); // NOI18N
        jMenuBar1.add(jMenu6);

        setJMenuBar(jMenuBar1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jMenuItem4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem4ActionPerformed
        catalogoCuotasEspeciales catace = new catalogoCuotasEspeciales();
        cuotasEspeciales cuotae = new cuotasEspeciales();
        Proveedores modpro = new Proveedores();
        ModeloConceptoGastos modcon = new ModeloConceptoGastos();
        Asambleas modasa = new Asambleas();
        CuotasEspeciales modcuo = new CuotasEspeciales();
        CerrarMes modc = new CerrarMes();
        buscarProveedor buscpro = new buscarProveedor();
        controladorCuotasEspeciales controce = new controladorCuotasEspeciales(cuotae, catace, modpro, modcon, modasa, this, modcuo, modc, buscpro);

        catace.setVisible(true);
    }//GEN-LAST:event_jMenuItem4ActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        catalogoAsambleas cataa = new catalogoAsambleas();
        asambleas asam = new asambleas();
        Asambleas modasa = new Asambleas();
        Propietarios modpro = new Propietarios();
        controladorAsambleas controa = new controladorAsambleas(cataa, asam, modasa, modpro, this);

        cataa.setVisible(true);
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        catalogoGastoComun catagac = new catalogoGastoComun();
        gastoComun gc = new gastoComun();
        GastoComun modgac = new GastoComun();
        Proveedores modpro = new Proveedores();
        ModeloConceptoGastos modcon = new ModeloConceptoGastos();
        CerrarMes modc = new CerrarMes();
        buscarProveedor buscpro = new buscarProveedor();

        controladorGastoComun controgc = new controladorGastoComun(gc, catagac, modgac, modpro, modcon, this, modc, buscpro);

        catagac.setVisible(true);
    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void jMenuItem6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem6ActionPerformed
        catalogoSancion catasan = new catalogoSancion();
        sancion san = new sancion();
        Sancion modsan = new Sancion();
        CerrarMes modc = new CerrarMes();
        controladorSancion controsan = new controladorSancion(san, catasan, modsan, this, modc);

        catasan.setVisible(true);
    }//GEN-LAST:event_jMenuItem6ActionPerformed

    private void jMenuItem7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem7ActionPerformed
        catalogoUnidades cataun = new catalogoUnidades();
        unidades uni = new unidades();
        detallecuenta detacun = new detallecuenta();
        detalleRecibo detare = new detalleRecibo();
        Unidades moduni = new Unidades();
        catalogoInactivoUnidades cataiuni = new catalogoInactivoUnidades();
        unidadesInactivas unii = new unidadesInactivas();

        CerrarMes modc = new CerrarMes();
        controladorUnidades controuni = new controladorUnidades(uni, cataun, detacun, detare, moduni, this, modc, cataiuni, unii);

        cataun.setVisible(true);
    }//GEN-LAST:event_jMenuItem7ActionPerformed

    private void jMenuItem9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem9ActionPerformed
        catalogoFondo catafon = new catalogoFondo();
        fondo fon = new fondo();
        Fondo modfon = new Fondo();
        catalogoInactivoFondo cataifon = new catalogoInactivoFondo();

        controladorFondo controfon = new controladorFondo(fon, catafon, modfon, this, cataifon);

        catafon.setVisible(true);
    }//GEN-LAST:event_jMenuItem9ActionPerformed

    private void jMenuItem10ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem10ActionPerformed
        catalogoComunicados catacomu = new catalogoComunicados();
        comunicados com = new comunicados();
        Comunicados modco = new Comunicados();
        Propietarios modpro = new Propietarios();
        CrudUsuario modus = new CrudUsuario();
        controladorComunicados controcom = new controladorComunicados(catacomu, com, modco, this, modus);

        catacomu.setVisible(true);
    }//GEN-LAST:event_jMenuItem10ActionPerformed

    private void jMenuItem11ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem11ActionPerformed
        cuentasPorCobrar cuenco = new cuentasPorCobrar();
        CuentasPorCobrar modcuen = new CuentasPorCobrar();
        Unidades moduni = new Unidades();
        Fondo modfon = new Fondo();
        Cuenta modcu = new Cuenta();
        CerrarMes modc = new CerrarMes();
        controladorCuentasPorCobrar controcpc = new controladorCuentasPorCobrar(cuenco, modcuen, moduni, modfon, modcu, modc, this);

        cuenco.setVisible(true);
    }//GEN-LAST:event_jMenuItem11ActionPerformed

    private void jMenuItem12ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem12ActionPerformed
        cuentasPorPagar vistaCuentaP = new cuentasPorPagar();
        Cuenta_Pagar modCuentaP = new Cuenta_Pagar();
        Fondo modFon = new Fondo();
        GastoComun modGastoC = new GastoComun();
        Cuenta modCuenta = new Cuenta();
        catalogoCuentas_procesada catCuenPro = new catalogoCuentas_procesada();
        controladorCuenta_Pagar ctrlCuentaP = new controladorCuenta_Pagar(modCuentaP, vistaCuentaP, modFon, modCuenta, modGastoC, catCuenPro);
        vistaCuentaP.setVisible(true);

    }//GEN-LAST:event_jMenuItem12ActionPerformed

    private void jMenuItem13ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem13ActionPerformed
        registroVisitas regvi = new registroVisitas();
        Registro_visitas modRvtas = new Registro_visitas();
        controladoRegistroVisita contVisita = new controladoRegistroVisita(regvi, modRvtas);

        regvi.setVisible(true);
    }//GEN-LAST:event_jMenuItem13ActionPerformed

    private void jMenuItem14ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem14ActionPerformed
        pagoCuotasEspeciales pagoce = new pagoCuotasEspeciales();
        pagoce.setVisible(true);
    }//GEN-LAST:event_jMenuItem14ActionPerformed

    private void jMenuItem15ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem15ActionPerformed
        catalogoCierreMes catac = new catalogoCierreMes();

        cerrarMes reci = new cerrarMes();
        CerrarMes modc = new CerrarMes();
        Unidades moduni = new Unidades();
        GastoComun modgac = new GastoComun();
        CuotasEspeciales modcuo = new CuotasEspeciales();
        Sancion modsan = new Sancion();
        Interes modin = new Interes();
        catac.setVisible(true);

        controladorCerrarMes controc = new controladorCerrarMes(reci, modc, moduni, this, modgac, modcuo, modsan, modin, catac);

    }//GEN-LAST:event_jMenuItem15ActionPerformed

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
        try {

            int botonDialogo = JOptionPane.YES_NO_OPTION;
            int result = JOptionPane.showConfirmDialog(null, "DESEA CERRAR LA VENTANA?", "SALIR", botonDialogo);
            if (result == 0) {

                System.exit(0);

            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, e);
        }
    }//GEN-LAST:event_btnSalirActionPerformed

    private void btnMinimizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnMinimizarActionPerformed
        this.setState(vista.InicioUsuario.ICONIFIED);
    }//GEN-LAST:event_btnMinimizarActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        PantallaPrincipal panta = new PantallaPrincipal();
        panta.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jButton1ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(PantallaPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(PantallaPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(PantallaPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(PantallaPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new PantallaPrincipal1().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnMinimizar;
    private javax.swing.JButton btnSalir;
    public javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenu jMenu5;
    private javax.swing.JMenu jMenu6;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem10;
    private javax.swing.JMenuItem jMenuItem11;
    private javax.swing.JMenuItem jMenuItem12;
    private javax.swing.JMenuItem jMenuItem13;
    private javax.swing.JMenuItem jMenuItem14;
    private javax.swing.JMenuItem jMenuItem15;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JMenuItem jMenuItem6;
    private javax.swing.JMenuItem jMenuItem7;
    private javax.swing.JMenuItem jMenuItem8;
    private javax.swing.JMenuItem jMenuItem9;
    private javax.swing.JTextField jTextField1;
    public javax.swing.JTextField rif;
    // End of variables declaration//GEN-END:variables
}
