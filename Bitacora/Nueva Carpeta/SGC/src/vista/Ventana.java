package vista;

public class Ventana extends javax.swing.JFrame {

    /**
     * Creates new form Ventana
     */
    public Ventana() {
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

        barraMenu = new javax.swing.JMenuBar();
        menuArchivo = new javax.swing.JMenu();
        jBanco = new javax.swing.JMenuItem();
        jCategoria = new javax.swing.JMenuItem();
        jConcepto = new javax.swing.JMenuItem();
        jCondominio = new javax.swing.JMenuItem();
        jCuenta = new javax.swing.JMenuItem();
        jGasto = new javax.swing.JMenuItem();
        jFondo = new javax.swing.JMenuItem();
        jFormaPago = new javax.swing.JMenuItem();
        jUsuario = new javax.swing.JMenuItem();
        jInteres = new javax.swing.JMenuItem();
        jPropietarios = new javax.swing.JMenuItem();
        jProveedores = new javax.swing.JMenuItem();
        jResponsable = new javax.swing.JMenuItem();
        jSancion = new javax.swing.JMenuItem();
        jTipoUnidad = new javax.swing.JMenuItem();
        jTipo = new javax.swing.JMenuItem();
        jUnidades = new javax.swing.JMenuItem();
        menuProceso = new javax.swing.JMenu();
        pAsamblea = new javax.swing.JMenuItem();
        pCuentasporCobrar = new javax.swing.JMenuItem();
        pCuentapagar = new javax.swing.JMenuItem();
        pCerrarMes = new javax.swing.JMenuItem();
        pVisitas = new javax.swing.JMenuItem();
        menuReporte = new javax.swing.JMenu();
        menuAyudas = new javax.swing.JMenu();
        menuPerfil = new javax.swing.JMenu();
        jPerfil = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        setSize(new java.awt.Dimension(1366, 710));
        getContentPane().setLayout(null);

        barraMenu.setBackground(new java.awt.Color(255, 255, 255));
        barraMenu.setBorder(null);
        barraMenu.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        menuArchivo.setBackground(new java.awt.Color(255, 255, 255));
        menuArchivo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/file (1).png"))); // NOI18N
        menuArchivo.setText("Archivos");
        menuArchivo.setToolTipText("Gestiones del sistema");
        menuArchivo.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        menuArchivo.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N

        jBanco.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jBanco.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/banco.png"))); // NOI18N
        jBanco.setText("Bancos");
        jBanco.setToolTipText("Gestionar bancos");
        jBanco.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jBanco.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBancoActionPerformed(evt);
            }
        });
        menuArchivo.add(jBanco);

        jCategoria.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jCategoria.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/gastos.png"))); // NOI18N
        jCategoria.setText("Categoría Gastos");
        jCategoria.setToolTipText("Gestionar las categorias de los gastos");
        jCategoria.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jCategoria.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCategoriaActionPerformed(evt);
            }
        });
        menuArchivo.add(jCategoria);

        jConcepto.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jConcepto.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/analisis.png"))); // NOI18N
        jConcepto.setText("Concepto Gastos");
        jConcepto.setToolTipText("Gestionar los conceptos de los gastos");
        jConcepto.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jConcepto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jConceptoActionPerformed(evt);
            }
        });
        menuArchivo.add(jConcepto);

        jCondominio.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jCondominio.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/condominio.png"))); // NOI18N
        jCondominio.setText("Condominio");
        jCondominio.setToolTipText("Gestionar los condominios");
        jCondominio.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jCondominio.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCondominioActionPerformed(evt);
            }
        });
        menuArchivo.add(jCondominio);

        jCuenta.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jCuenta.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cuota.png"))); // NOI18N
        jCuenta.setText("Cuentas Bancarias");
        jCuenta.setToolTipText("Gestionar las cuentas bancarias");
        jCuenta.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jCuenta.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCuentaActionPerformed(evt);
            }
        });
        menuArchivo.add(jCuenta);

        jGasto.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jGasto.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/presupuesto.png"))); // NOI18N
        jGasto.setText("Gasto");
        jGasto.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jGasto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jGastoActionPerformed(evt);
            }
        });
        menuArchivo.add(jGasto);

        jFondo.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jFondo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/hucha.png"))); // NOI18N
        jFondo.setText("Fondo");
        jFondo.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jFondo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jFondoActionPerformed(evt);
            }
        });
        menuArchivo.add(jFondo);

        jFormaPago.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jFormaPago.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/pattern (2) (1) (1).png"))); // NOI18N
        jFormaPago.setText("Forma de Pago");
        jFormaPago.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        menuArchivo.add(jFormaPago);

        jUsuario.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jUsuario.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/administracion.png"))); // NOI18N
        jUsuario.setText("Gestionar Usuarios");
        jUsuario.setToolTipText("Gestionar los usuarios");
        jUsuario.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jUsuario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jUsuarioActionPerformed(evt);
            }
        });
        menuArchivo.add(jUsuario);

        jInteres.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jInteres.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/caro.png"))); // NOI18N
        jInteres.setText("Interes");
        jInteres.setToolTipText("Gestionar los intereses de los condominios");
        jInteres.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jInteres.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jInteresMouseClicked(evt);
            }
        });
        jInteres.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jInteresActionPerformed(evt);
            }
        });
        menuArchivo.add(jInteres);

        jPropietarios.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jPropietarios.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/boton-cuadrado-de-la-llave-de-la-casa.png"))); // NOI18N
        jPropietarios.setText("Propietarios");
        jPropietarios.setToolTipText("Gestionar los propietarios de las unidades");
        jPropietarios.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jPropietarios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jPropietariosActionPerformed(evt);
            }
        });
        menuArchivo.add(jPropietarios);

        jProveedores.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jProveedores.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/proveedor.png"))); // NOI18N
        jProveedores.setText("Proveedores");
        jProveedores.setToolTipText("Gestionar los proveedores");
        jProveedores.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jProveedores.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jProveedoresActionPerformed(evt);
            }
        });
        menuArchivo.add(jProveedores);

        jResponsable.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jResponsable.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/responsibility.png"))); // NOI18N
        jResponsable.setText("Responsable");
        jResponsable.setToolTipText("Gestionar el responsable");
        jResponsable.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jResponsable.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jResponsableActionPerformed(evt);
            }
        });
        menuArchivo.add(jResponsable);

        jSancion.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jSancion.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/no-stopping.png"))); // NOI18N
        jSancion.setText("Sanciones");
        jSancion.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jSancion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jSancionActionPerformed(evt);
            }
        });
        menuArchivo.add(jSancion);

        jTipoUnidad.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jTipoUnidad.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/pattern (1) (2).png"))); // NOI18N
        jTipoUnidad.setText("Tipos de Unidades");
        jTipoUnidad.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        menuArchivo.add(jTipoUnidad);

        jTipo.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jTipo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/team.png"))); // NOI18N
        jTipo.setText("Tipos de Usuarios");
        jTipo.setToolTipText("Gestionar los tipos de usuario");
        jTipo.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jTipo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTipoActionPerformed(evt);
            }
        });
        menuArchivo.add(jTipo);

        jUnidades.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jUnidades.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/casa.png"))); // NOI18N
        jUnidades.setText("Unidades");
        jUnidades.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jUnidades.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jUnidadesActionPerformed(evt);
            }
        });
        menuArchivo.add(jUnidades);

        barraMenu.add(menuArchivo);

        menuProceso.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N
        menuProceso.setText("Procesos");
        menuProceso.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        menuProceso.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        menuProceso.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel.png"))); // NOI18N
        menuProceso.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N
        menuProceso.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N
        menuProceso.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/cogwheel (1).png"))); // NOI18N

        pAsamblea.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        pAsamblea.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/mesa-redonda.png"))); // NOI18N
        pAsamblea.setText("Asambleas");
        pAsamblea.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        pAsamblea.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pAsambleaActionPerformed(evt);
            }
        });
        menuProceso.add(pAsamblea);

        pCuentasporCobrar.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        pCuentasporCobrar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/dar-dinero.png"))); // NOI18N
        pCuentasporCobrar.setText("Cuentas por Cobrar");
        pCuentasporCobrar.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        pCuentasporCobrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pCuentasporCobrarActionPerformed(evt);
            }
        });
        menuProceso.add(pCuentasporCobrar);

        pCuentapagar.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        pCuentapagar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/metodo-de-pago.png"))); // NOI18N
        pCuentapagar.setText("Cuentas por Pagar");
        pCuentapagar.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        pCuentapagar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pCuentapagarActionPerformed(evt);
            }
        });
        menuProceso.add(pCuentapagar);

        pCerrarMes.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        pCerrarMes.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/factura.png"))); // NOI18N
        pCerrarMes.setText("Generar Recibo");
        pCerrarMes.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        pCerrarMes.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pCerrarMesActionPerformed(evt);
            }
        });
        menuProceso.add(pCerrarMes);

        pVisitas.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        pVisitas.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/autorizacion.png"))); // NOI18N
        pVisitas.setText("Visitas Autorizadas");
        pVisitas.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        pVisitas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                pVisitasActionPerformed(evt);
            }
        });
        menuProceso.add(pVisitas);

        barraMenu.add(menuProceso);

        menuReporte.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/data-analytics.png"))); // NOI18N
        menuReporte.setText("Reportes");
        menuReporte.setToolTipText("Reportes del sistema");
        menuReporte.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        menuReporte.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        barraMenu.add(menuReporte);

        menuAyudas.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/educacion.png"))); // NOI18N
        menuAyudas.setText("Ayudas");
        menuAyudas.setToolTipText("");
        menuAyudas.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        menuAyudas.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        barraMenu.add(menuAyudas);

        menuPerfil.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/user (1).png"))); // NOI18N
        menuPerfil.setText("Usuario");
        menuPerfil.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        menuPerfil.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N

        jPerfil.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jPerfil.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/datos-del-usuario.png"))); // NOI18N
        jPerfil.setText("Perfil");
        menuPerfil.add(jPerfil);

        barraMenu.add(menuPerfil);

        setJMenuBar(barraMenu);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void pAsambleaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pAsambleaActionPerformed

    }//GEN-LAST:event_pAsambleaActionPerformed

    private void jBancoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBancoActionPerformed

    }//GEN-LAST:event_jBancoActionPerformed

    private void jCategoriaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCategoriaActionPerformed

    }//GEN-LAST:event_jCategoriaActionPerformed

    private void jConceptoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jConceptoActionPerformed

    }//GEN-LAST:event_jConceptoActionPerformed

    private void jCondominioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCondominioActionPerformed

    }//GEN-LAST:event_jCondominioActionPerformed

    private void jCuentaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCuentaActionPerformed

    }//GEN-LAST:event_jCuentaActionPerformed

    private void jGastoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jGastoActionPerformed

    }//GEN-LAST:event_jGastoActionPerformed

    private void jFondoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jFondoActionPerformed

    }//GEN-LAST:event_jFondoActionPerformed

    private void jUsuarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jUsuarioActionPerformed

    }//GEN-LAST:event_jUsuarioActionPerformed

    private void jInteresMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jInteresMouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_jInteresMouseClicked

    private void jInteresActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jInteresActionPerformed

    }//GEN-LAST:event_jInteresActionPerformed

    private void jPropietariosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jPropietariosActionPerformed

    }//GEN-LAST:event_jPropietariosActionPerformed

    private void jProveedoresActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jProveedoresActionPerformed

    }//GEN-LAST:event_jProveedoresActionPerformed

    private void jResponsableActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jResponsableActionPerformed

    }//GEN-LAST:event_jResponsableActionPerformed

    private void jSancionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jSancionActionPerformed

    }//GEN-LAST:event_jSancionActionPerformed

    private void jTipoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTipoActionPerformed

    }//GEN-LAST:event_jTipoActionPerformed

    private void jUnidadesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jUnidadesActionPerformed

    }//GEN-LAST:event_jUnidadesActionPerformed

    private void pCuentasporCobrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pCuentasporCobrarActionPerformed

    }//GEN-LAST:event_pCuentasporCobrarActionPerformed

    private void pCuentapagarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pCuentapagarActionPerformed

    }//GEN-LAST:event_pCuentapagarActionPerformed

    private void pVisitasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pVisitasActionPerformed

    }//GEN-LAST:event_pVisitasActionPerformed

    private void pCerrarMesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_pCerrarMesActionPerformed

    }//GEN-LAST:event_pCerrarMesActionPerformed

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
            java.util.logging.Logger.getLogger(Ventana.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Ventana.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Ventana.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Ventana.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Ventana().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JMenuBar barraMenu;
    public javax.swing.JMenuItem jBanco;
    public javax.swing.JMenuItem jCategoria;
    public javax.swing.JMenuItem jConcepto;
    public javax.swing.JMenuItem jCondominio;
    public javax.swing.JMenuItem jCuenta;
    public javax.swing.JMenuItem jFondo;
    public javax.swing.JMenuItem jFormaPago;
    public javax.swing.JMenuItem jGasto;
    public javax.swing.JMenuItem jInteres;
    public javax.swing.JMenuItem jPerfil;
    public javax.swing.JMenuItem jPropietarios;
    public javax.swing.JMenuItem jProveedores;
    public javax.swing.JMenuItem jResponsable;
    public javax.swing.JMenuItem jSancion;
    public javax.swing.JMenuItem jTipo;
    public javax.swing.JMenuItem jTipoUnidad;
    public javax.swing.JMenuItem jUnidades;
    public javax.swing.JMenuItem jUsuario;
    public javax.swing.JMenu menuArchivo;
    public javax.swing.JMenu menuAyudas;
    public javax.swing.JMenu menuPerfil;
    public javax.swing.JMenu menuProceso;
    public javax.swing.JMenu menuReporte;
    public javax.swing.JMenuItem pAsamblea;
    public javax.swing.JMenuItem pCerrarMes;
    public javax.swing.JMenuItem pCuentapagar;
    public javax.swing.JMenuItem pCuentasporCobrar;
    public javax.swing.JMenuItem pVisitas;
    // End of variables declaration//GEN-END:variables
}
