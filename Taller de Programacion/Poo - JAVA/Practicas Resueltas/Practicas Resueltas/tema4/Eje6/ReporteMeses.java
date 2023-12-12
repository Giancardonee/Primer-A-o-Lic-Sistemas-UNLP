package tema4.Eje6;

/**
 *
 * @author Gianca
 */
public class ReporteMeses extends Estacion {
    private String promedio = " \n";

   public ReporteMeses (int añoInicial, int añosConsecutivos, String nombreEstacion, String unaLatitud, String unaLongitud){
       super(añoInicial,añosConsecutivos,nombreEstacion,unaLatitud,unaLongitud);  
   }
   
   private void setPromedio (String temperatura){
       this.promedio += temperatura +"\n"; 
       
   }
   
   private void agregarAlPromedio (int mesesRegistrados, int mes, double promedio){
      String agregar = "En el mes "+(mes+1)+ " ";
      if ( mesesRegistrados > 0 ) {
          agregar += ": "+promedio+ "ºC";
       }
       else {
           agregar += "no se registraron temperaturas.";
       }
        this.setPromedio(agregar);
   } 
    
   @Override 
   public void calcularPromedio (){
       
       int mesesRegistrados;
       double sumaTemperaturas,temperatura;
       int añoInicial = this.getAñoInicial();
       int cantAños = añoInicial + this.getAñosConsecutivos();
       for (int mes=0; mes <12; mes++){
           mesesRegistrados = 0;
           sumaTemperaturas=0;
           
           for (int año= añoInicial; año < cantAños; año++ ){
               temperatura = this.getTemperatura(mes, año); 
               
               if (temperatura !=999 ){ // 999 es el valor default de la temperatura en la matriz
                   mesesRegistrados++;
                   sumaTemperaturas+= temperatura;
                                
               }
               
           }
          // una vez que salgo del for de año, debo agregar el promedio 
            this.agregarAlPromedio(mesesRegistrados, mes, (sumaTemperaturas/mesesRegistrados));
       }
   }
   
   
   
   /* 
   
   
   @Override
   public void calcularPromedio (){
       final int meses = 12; 
       final int años = this.getAñosConsecutivos();
       double suma, temperaturaActual;
       int mesesRegistrados;
       System.out.println("ESTOY EN CLASE REPORTE MESES"); // debugging
       for (int mes=0; mes < meses; mes++ ){
           suma=0;
           mesesRegistrados=0;
           System.out.println("Entre aca"); // debugging
           for (int año=0; año< años; año++){
               temperaturaActual = this.getTemperatura(mes, año); 
               System.out.println(mes+ "" +año);
               System.out.println("Me traje la temperatura, y es: "+temperaturaActual); // debugging
               
               if (temperaturaActual != 999){
                    suma += temperaturaActual;
                    mesesRegistrados++;
                    System.out.println("Los meses registrados son: "+mesesRegistrados); // debugging
               }
            }
           this.agregarAlPromedio(mesesRegistrados, mes, suma);
       }
   } 
   */
   
     @Override
    public String toString (){
        String aux = super.toString() + this.promedio;
        return aux;
    }
}
