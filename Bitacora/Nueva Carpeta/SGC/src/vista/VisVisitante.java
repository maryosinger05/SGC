/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;
import java.awt.Color;
import static java.awt.Color.white;
import java.awt.Component;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import static java.awt.SystemColor.scrollbar;
import javax.swing.BorderFactory;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JList;
import javax.swing.JScrollBar;
import javax.swing.JTable;
import javax.swing.ListCellRenderer;
import javax.swing.plaf.ComboBoxUI;
import javax.swing.plaf.basic.BasicArrowButton;
import javax.swing.plaf.basic.BasicComboBoxUI;
import javax.swing.plaf.basic.BasicScrollBarUI;
import sun.swing.table.DefaultTableCellHeaderRenderer;
import vista.buscarProveedor.MyScrollBarUI;
/**
 *
 * @author Maryo
 */
public class VisVisitante extends javax.swing.JPanel {

    /**
     * Creates new form VisVisitante
     */
    //Aquí cambias la trasparencia de la barra mientras el cursor está encima. Mientras mál alto el valor, menos transparente
    private static final int SCROLL_BAR_ALPHA_ROLLOVER = 150;
    //Aquí cambias la trasparencia de la barra. Mientras mál alto el valor, menos transparente
    private static final int SCROLL_BAR_ALPHA = 100;
    private static final int THUMB_BORDER_SIZE = 5;
    //Aquí cambias el grosor de la barra
    private static final int THUMB_SIZE = 8;
    //Aquí cambias el color de la barra
    private static final Color THUMB_COLOR = Color.BLUE;
    
    public VisVisitante() {
        initComponents();
        jScrollPane1.getVerticalScrollBar().setUI(new MyScrollBarUI());
        tabla.getTableHeader().setDefaultRenderer(new VisMensaje.Headercolor());
        cbxCedula.setUI(new VisCerrarMes.CustomUI());
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txtCedula = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txtApellido = new javax.swing.JTextField();
        jSeparator2 = new javax.swing.JSeparator();
        jSeparator3 = new javax.swing.JSeparator();
        jSeparator5 = new javax.swing.JSeparator();
        btnAgregar = new javax.swing.JButton();
        txtNombre = new javax.swing.JTextField();
        cbxCedula = new javax.swing.JComboBox<>();
        jScrollPane1 = new javax.swing.JScrollPane();
        tabla = new javax.swing.JTable();
        jLabel13 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        btnSalir = new javax.swing.JButton();
        jLabel9 = new javax.swing.JLabel();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(0, 94, 159), 5, true));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel2.setBackground(new java.awt.Color(0, 94, 159));
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Cédula:");
        jPanel2.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 30, 60, -1));

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Nombre:");
        jPanel2.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 90, -1, -1));

        txtCedula.setBackground(new java.awt.Color(0, 94, 159));
        txtCedula.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtCedula.setForeground(new java.awt.Color(255, 255, 255));
        txtCedula.setBorder(null);
        jPanel2.add(txtCedula, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 30, 290, 20));

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("Apellido:");
        jPanel2.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 150, 70, -1));

        txtApellido.setBackground(new java.awt.Color(0, 94, 159));
        txtApellido.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtApellido.setForeground(new java.awt.Color(255, 255, 255));
        txtApellido.setBorder(null);
        jPanel2.add(txtApellido, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 150, 340, 20));

        jSeparator2.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator2, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 170, 340, 10));

        jSeparator3.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator3, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 50, 290, 10));

        jSeparator5.setForeground(new java.awt.Color(255, 255, 255));
        jPanel2.add(jSeparator5, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 110, 340, 10));

        btnAgregar.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        btnAgregar.setForeground(new java.awt.Color(255, 255, 255));
        btnAgregar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional.png"))); // NOI18N
        btnAgregar.setText("Agregar");
        btnAgregar.setToolTipText("Agregar al visitante a la lista");
        btnAgregar.setBorderPainted(false);
        btnAgregar.setContentAreaFilled(false);
        btnAgregar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnAgregar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional (1).png"))); // NOI18N
        btnAgregar.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional (1).png"))); // NOI18N
        btnAgregar.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/simbolo-grueso-adicional (1).png"))); // NOI18N
        jPanel2.add(btnAgregar, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 210, -1, 40));

        txtNombre.setBackground(new java.awt.Color(0, 94, 159));
        txtNombre.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        txtNombre.setForeground(new java.awt.Color(255, 255, 255));
        txtNombre.setBorder(null);
        jPanel2.add(txtNombre, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 90, 340, 20));

        cbxCedula.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        cbxCedula.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "V", "E" }));
        jPanel2.add(cbxCedula, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 20, 50, 30));

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 60, 440, 280));

        jScrollPane1.setBorder(new javax.swing.border.LineBorder(new java.awt.Color(255, 255, 255), 3, true));

        tabla.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        tabla.setRowHeight(35);
        jScrollPane1.setViewportView(tabla);

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 380, 480, 200));

        jLabel13.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        jPanel1.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 370, 510, -1));

        jLabel10.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/fondoformu500-350 (2).png"))); // NOI18N
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 50, -1, -1));

        btnSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/left-arrow.png"))); // NOI18N
        btnSalir.setToolTipText("Volver al catálogo");
        btnSalir.setBorder(null);
        btnSalir.setBorderPainted(false);
        btnSalir.setContentAreaFilled(false);
        btnSalir.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnSalir.setPressedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/left-arrow.png"))); // NOI18N
        btnSalir.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/img/left-arrow (1).png"))); // NOI18N
        btnSalir.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/left-arrow (1).png"))); // NOI18N
        btnSalir.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/img/left-arrow (1).png"))); // NOI18N
        jPanel1.add(btnSalir, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 10, -1, 30));

        jLabel9.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        jLabel9.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel9.setText("Visitante");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 10, 90, -1));

        add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 30, 560, 590));
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton btnAgregar;
    public javax.swing.JButton btnSalir;
    public javax.swing.JComboBox<String> cbxCedula;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JSeparator jSeparator5;
    public javax.swing.JTable tabla;
    public javax.swing.JTextField txtApellido;
    public javax.swing.JTextField txtCedula;
    public javax.swing.JTextField txtNombre;
    // End of variables declaration//GEN-END:variables
static public class Headercolor extends DefaultTableCellHeaderRenderer {

        public Headercolor() {
            setOpaque(true);
        }

        public Component getTableCellRendererComponent(JTable jTable1, Object value, boolean selected, boolean focused, int row, int column) {
            super.getTableCellRendererComponent(jTable1, value, selected, focused, row, column);
            setBackground(new java.awt.Color(0, 94, 159));
            setForeground(Color.white);
            setFont(new Font("Tahoma", Font.BOLD, 14));
            return this;
        }
    }

    public class MyScrollBarUI extends BasicScrollBarUI {

        @Override
        public void paintTrack(Graphics g, JComponent c, Rectangle trackBounds) {
            trackBounds.contains(thumbRect);
            g.setColor(new java.awt.Color(255, 255, 255));
            g.drawRect(0, 0, 500, 500);
            g.fillRect(0, 0, 500, 500);
        }

        @Override
        public void paintThumb(Graphics g, JComponent c, Rectangle thumbBounds) {
            int alpha = isThumbRollover() ? SCROLL_BAR_ALPHA_ROLLOVER : SCROLL_BAR_ALPHA;
            int orientation = scrollbar.getOrientation();
            int arc = THUMB_SIZE;
            int x = thumbBounds.x + THUMB_BORDER_SIZE;
            int y = thumbBounds.y + THUMB_BORDER_SIZE;

            int width = orientation == JScrollBar.VERTICAL
                    ? THUMB_SIZE : thumbBounds.width - (THUMB_BORDER_SIZE * 2);
            width = Math.max(width, THUMB_SIZE);

            int height = orientation == JScrollBar.VERTICAL
                    ? thumbBounds.height - (THUMB_BORDER_SIZE * 2) : THUMB_SIZE;
            height = Math.max(height, THUMB_SIZE);

            Graphics2D graphics2D = (Graphics2D) g.create();
            graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON);
            graphics2D.setColor(new Color(THUMB_COLOR.getRed(),
                    THUMB_COLOR.getGreen(), THUMB_COLOR.getBlue(), alpha));
            graphics2D.fillRoundRect(x, y, width, height, arc, arc);
            graphics2D.dispose();
        }
    }
    
    static public class CustomUI extends BasicComboBoxUI{
        
    
    
    public Color blue = new Color(0,94,159);
    
    public static ComboBoxUI createUI(JComponent cbxMoneda) {
        
         return new CustomUI();
     }
 
    @Override 
    public JButton createArrowButton() {        
        BasicArrowButton basicArrowButton = new BasicArrowButton(BasicArrowButton.SOUTH, //Direccion de la flecha
                Color.WHITE, //Color de fondo
                new Color(0,94,159),//sombra
                new Color(0,94,159),//darkShadow
                Color.WHITE //highlight
                );         
        //se quita el efecto 3d del boton, sombra y darkShadow no se aplican 
        basicArrowButton.setBorder(BorderFactory.createLineBorder(blue,2));
        basicArrowButton.setContentAreaFilled(false);        
        return basicArrowButton;
    }        
 
     //Se puede usar un JButton para usar un icono personalizado en lugar del arrow
     /* 
45  @Override 
46  protected JButton createArrowButton() { 
47  JButton button = new JButton(); 
48  //se quita el efecto 3d del boton, sombra y darkShadow no se aplican 
49  button.setText("");
50  button.setBorder(BorderFactory.createLineBorder(red,2));
51  button.setContentAreaFilled(false);
52  button.setIcon( new ImageIcon(getClass().getResource("/org/bolivia/res/estrella.png")) );
53  return button;
54  } 
55  */
     
    
    public void paintCurrentValueBackground(Graphics g, Rectangle bounds, boolean hasFocus)
    {
        
        g.setColor( blue );
        g.setFont(new Font("Tahoma", Font.BOLD, 14));
        g.fillRect(bounds.x, bounds.y, bounds.width, bounds.height);
    }
        
     //Pinta los items
    @Override
    public ListCellRenderer createRenderer()
    {
        return new DefaultListCellRenderer() {      
             
        @Override
        public Component getListCellRendererComponent(JList list,Object value,int index,
           boolean isSelected,boolean cellHasFocus) {
       
        super.getListCellRendererComponent(list,value,index,isSelected,cellHasFocus);
        list.setSelectionBackground(blue);
        list.setForeground(white);
        
        if (isSelected)
        {
             setBackground( blue );
             setForeground(new Color(255,255,255));
        }
        else
        {
             setBackground( Color.WHITE );            
             setForeground( new Color(0,94,159));
        }
            
            return this;
            }
        };
        }
    }
}
