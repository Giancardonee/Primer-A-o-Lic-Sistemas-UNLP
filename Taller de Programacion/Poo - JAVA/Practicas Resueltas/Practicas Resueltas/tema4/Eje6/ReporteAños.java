package tema4.Eje6;

/**
 *
 * @author Gianca
 */
public class ReporteAños extends Estacion {
    private String promedio = "";
    
    public ReporteAños (int añoIni, int añoConse ,String nombreEstacion, String unaLatitud, String unaLongitud){
        super(añoIni,añoConse,nombreEstacion,unaLatitud,unaLongitud);
    }
    
    public void setPromedio (String promedio){
        promedio += promedio+"\n"; 
    }
    
    private void agregarAlPromedio (int año ,int cantRegistrados, double promedio){
        String agregar = "En el año "+año ;
        if ( cantRegistrados > 0 ){
            agregar += promedio+ " ºC"; 
        }
        else{
            agregar += " no se registro ninguna temperatura.";
        }
        this.setPromedio(agregar);
    }
    
   @Override 
    public void calcularPromedio (){
        int año = this.getAñoInicial(); 
        int cantRegistros; 
        double suma,temperaturaActual;
        for (int a=0;a <this.getAñosConsecutivos()+1; a++ ){
            suma = 0; 
            cantRegistros = 0;
            año ++; 
            for (int mes=0; mes<12; mes++){
                
                temperaturaActual = this.getTemperatura(año, mes);
                if (temperaturaActual != 999){
                    suma += temperaturaActual;
                    cantRegistros++;
                }
                
            }
            this.agregarAlPromedio(año, cantRegistros, (suma / cantRegistros ));
        }
    }
    
    @Override
    public String toString (){
        String aux = super.toString() + this.promedio;
        return aux;
    }
    
}
