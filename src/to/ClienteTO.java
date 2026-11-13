/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package to;

/**
 *
 * @author Kevin La Cruz
 */
public class ClienteTO {

    private int id_cliente;
    private String ruc_clie;
    private String nomb_clie;
    private String dire_clie;
    private int id_distrito;
    private String telf_clie;
    private String celu_clie;
    private String obsv_clie;

    public ClienteTO() {
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getRuc_clie() {
        return ruc_clie;
    }

    public void setRuc_clie(String ruc_clie) {
        this.ruc_clie = ruc_clie;
    }

    public String getNomb_clie() {
        return nomb_clie;
    }

    public void setNomb_clie(String nomb_clie) {
        this.nomb_clie = nomb_clie;
    }

    public String getDire_clie() {
        return dire_clie;
    }

    public void setDire_clie(String dire_clie) {
        this.dire_clie = dire_clie;
    }

    public int getId_distrito() {
        return id_distrito;
    }

    public void setId_distrito(int id_distrito) {
        this.id_distrito = id_distrito;
    }

    public String getTelf_clie() {
        return telf_clie;
    }

    public void setTelf_clie(String telf_clie) {
        this.telf_clie = telf_clie;
    }

    public String getCelu_clie() {
        return celu_clie;
    }

    public void setCelu_clie(String celu_clie) {
        this.celu_clie = celu_clie;
    }

    public String getObsv_clie() {
        return obsv_clie;
    }

    public void setObsv_clie(String obsv_clie) {
        this.obsv_clie = obsv_clie;
    }

}
