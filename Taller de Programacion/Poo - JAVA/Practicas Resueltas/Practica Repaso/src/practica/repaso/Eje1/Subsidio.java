/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica.repaso.Eje1;
/**
 *
 * @author Usuario
 */
public class Subsidio {
    private double montoPedido; 
    private String motivo; 
    private boolean otorgado; 
    
    
    public Subsidio (double unMontoPedido, String unMotivo){
        this.motivo = unMotivo;
        this.montoPedido = unMontoPedido;
        this.otorgado= false;
    }
    
    public double getMontoPedido (){
        return this.montoPedido;
    }
    
    public void otorgarSubsidio (){
        this.otorgado = true;
    }
    
    public boolean getOtorgado (){
        return this.otorgado;
    }
    
    public double getDineroOtorgado(){
        double res=0;
        if (this.getOtorgado() == true){
            res = this.getMontoPedido();
        }
        
        return res;
    }
}
