package tema3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Gianca
 */
public class Habitacion {
    private double costoPorNoche ; 
    private boolean estaOcupada; 
    private Cliente cliente;
    
    
    public Habitacion (){
       costoPorNoche = (GeneradorAleatorio.generarDouble(6000)+2000);
       cliente = null;
       estaOcupada  = false; 
    }
    
    public double getCostoPorNoche() {
        return costoPorNoche;
    }

    public void setCostoPorNoche(double costoPorNoche) {
        this.costoPorNoche = costoPorNoche;
    }

    public boolean isEstaOcupada() {
        return estaOcupada;
    }

    public void setEstaOcupada(boolean estaOcupada) {
        this.estaOcupada = estaOcupada;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
        estaOcupada = true; 
    }
    
    public String toString (){
        String aux;    
        if (estaOcupada == true){
                aux = "La habitacion esta ocupada. Su costo por noche es $"+costoPorNoche+ " "+this.cliente.toString();
            }
        else{
            aux = "La habitacion esta desocupada. Su costo por noche es $"+costoPorNoche+".";
        }
        return aux;
   
    }
 
}
