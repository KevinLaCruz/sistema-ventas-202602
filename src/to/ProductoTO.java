/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package to;

/**
 *
 * @author Kevin La Cruz
 */
public class ProductoTO {

    private int id_producto;
    private String nomb_prod;
    private double prec_prod;
    private String obsv_prod;

    public ProductoTO() {
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNomb_prod() {
        return nomb_prod;
    }

    public void setNomb_prod(String nomb_prod) {
        this.nomb_prod = nomb_prod;
    }

    public double getPrec_prod() {
        return prec_prod;
    }

    public void setPrec_prod(double prec_prod) {
        this.prec_prod = prec_prod;
    }

    public String getObsv_prod() {
        return obsv_prod;
    }

    public void setObsv_prod(String obsv_prod) {
        this.obsv_prod = obsv_prod;
    }

}
