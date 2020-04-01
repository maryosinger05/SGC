/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JOptionPane;
import vista.asambleas;
import vista.catalogoAsambleas;

/**
 *
 * @author rma
 */
public class controladorAsambleas implements ActionListener {

    private catalogoAsambleas cataa;
    private asambleas as;

    public controladorAsambleas(catalogoAsambleas cataa, asambleas as) {
        this.cataa = cataa;
        this.as = as;
        this.cataa.jButton1.addActionListener(this);
        this.cataa.jButton2.addActionListener(this);
        this.cataa.jButton4.addActionListener(this);
        this.cataa.jButton5.addActionListener(this);
        this.as.btnGuardar.addActionListener(this);

        this.as.btnModificar.addActionListener(this);
    }

    public void actionPerformed(ActionEvent e) {

        if (e.getSource() == cataa.jButton1) {
            int botonDialogo = JOptionPane.YES_NO_OPTION;
            int result = JOptionPane.showConfirmDialog(null, "ENCONTRO EL REGISTRO?", "REGISTRO", botonDialogo);
            if (result == 0) {

                this.cataa.jButton4.setEnabled(true);
                this.cataa.jButton5.setEnabled(true);
                this.cataa.jButton2.setEnabled(false);
                this.cataa.jButton2.setForeground(Color.gray);
                this.cataa.jButton4.setForeground(new java.awt.Color(0, 94, 159));
                this.cataa.jButton5.setForeground(new java.awt.Color(0, 94, 159));

            } else {
                this.cataa.jButton2.setEnabled(true);
                this.cataa.jButton2.setForeground(new java.awt.Color(0, 94, 159));
                this.cataa.jButton4.setEnabled(false);
                this.cataa.jButton5.setEnabled(false);
                this.cataa.jButton4.setForeground(Color.gray);
                this.cataa.jButton5.setForeground(Color.gray);

            }
        }

        if (e.getSource() == cataa.jButton2) {
            this.as.setVisible(true);
            this.as.btnModificar.setVisible(false);
            this.as.btnGuardar.setVisible(true);

        }

        if (e.getSource() == cataa.jButton4) {
            this.as.setVisible(true);
            this.as.btnGuardar.setVisible(false);
            this.as.btnModificar.setVisible(true);

        }

        if (e.getSource() == cataa.jButton5) {
            int botonDialogo = JOptionPane.YES_NO_OPTION;
            int result = JOptionPane.showConfirmDialog(null, "DESEA ELIMINAR EL REGISTRO?", "ELIMINAR", botonDialogo);
            if (result == 0) {
                JOptionPane.showMessageDialog(null, "REGISTRO ELIMINADO");
            } else {

            }

        }

        if (e.getSource() == as.btnGuardar) {
            JOptionPane.showMessageDialog(null, "registro guardado");

        }

        if (e.getSource() == as.btnModificar) {
            JOptionPane.showMessageDialog(null, "registro modificado");

        }
    }

}
