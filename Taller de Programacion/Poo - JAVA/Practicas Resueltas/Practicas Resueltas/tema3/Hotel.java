package tema3;

/**
 *
 * @author Gianca
 */

public class Hotel {
    private int dimF; 
    private Habitacion [] habitaciones; 
    
    public Hotel (int unaDimF){
        dimF = unaDimF; 
        habitaciones = new Habitacion [dimF]; 
        for (int i=0; i< dimF; i++){
            habitaciones[i] = new Habitacion () ;
        }   
    }

    public void aumentarPrecio (double unPrecio){
        for (int i=0; i < dimF; i++){
            double precioActual = habitaciones[i].getCostoPorNoche(); 
            double precioActualizado = precioActual + unPrecio;
            habitaciones[i].setCostoPorNoche(precioActualizado);
        }
    }
    
    // se asume que la habitacion esta libre, y que X es valido
    public void ingresarCliente (Cliente C, int X){
        
        habitaciones[X].setCliente(C);  
    }
    
    
    public String toString(){
        String aux = ""; 
        for (int i=0; i < dimF; i++){
           aux += "Habitacion "+(i+1)+ " "+ habitaciones[i].toString()+ " \n " ; 
        }
        return aux;
    }
    
}
