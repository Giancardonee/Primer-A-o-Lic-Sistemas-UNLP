package tema4.Eje6;

/**
 *
 * @author Gianca
 */
public abstract class Estacion {
    private String nombre; 
    private String latitud,longitud;
    private double temperaturas[][];
    final private int añoInicial, añosConsecutivos;
        
    public Estacion (int unAño, int añosConsec, String nombreEstacion, String unaLatitud, String unaLongitud){
        final int meses = 12; 
        int añosTotales = añosConsec+1;
        this.añosConsecutivos = añosConsec;
        this.añoInicial = unAño;
        this.temperaturas = new double [añosTotales][meses];
        this.setNombre(nombreEstacion);
        this.setLongitud(unaLongitud);
        this.setLatitud(unaLatitud);
        this.inicializarMatriz();
    }

    
    private void inicializarMatriz (){
        final double valor_Alto = 999;
        int cantAños = this.getAñosConsecutivos() + 1;
        for (int a=0; a < cantAños; a++){
            for (int mes=0; mes < 12; mes++){
                this.temperaturas[a][mes]= valor_Alto;
            }
        }
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public int getAñoInicial() {
        return añoInicial;
    }

    public int getAñosConsecutivos() {
        return añosConsecutivos;
    }
   
    private boolean validarRango (int unMes, int unAño){
        boolean ok= false; 
        int añoAGuardar = unAño - this.getAñoInicial();
        if ( (unAño-this.getAñoInicial()>=0 ) && (añoAGuardar <= this.getAñosConsecutivos()) ){ // chequeo si es un año valido
            if ( (unMes>=0) && ( (unMes-1)<12) ) { // chequeo que este en rango el mes.
                ok= true;
            }
        }
        return ok; 
    }
    
    public void setTemperatura (int unAño, int unMes, double unaTemperatura){
            if ( validarRango (unMes-1,unAño) ){
                int añoAGuardar = unAño - this.getAñoInicial();
                this.temperaturas[añoAGuardar][unMes-1] = unaTemperatura;     
                System.out.println("Se seteo la temperatura correcto."); // debugg
                System.out.println(this.temperaturas[añoAGuardar][unMes-1]) ; // debugg    
            }
    }
   
    public double getTemperatura (int unMes, int unAño){
      double temperatura=0; // poner en 0
       if ( validarRango (unMes,unAño)){
        int añoBuscado = unAño - this.getAñoInicial(); // saco indice del año en matriz
        temperatura =this.temperaturas[añoBuscado][unMes];       
       }
       return temperatura;
    }
    
   private boolean esTemperaturaMax (double temperaturaAct, double temperaturaMax){
       return (temperaturaAct > temperaturaMax); 
   }
  
   public boolean noEsTemperaturaDefault (double temperaturaAct){
       return temperaturaAct!=999;
   }
   
    public String datosDeTemperaturaMaxima (){
        //int i_mesMax, i_añoMax;
        int añoIni = this.getAñoInicial();
        double temperaturaMax= -100;
        String aux= "No se encontraron temperaturas cargadas.";
        for (int a=0; a < this.añosConsecutivos; a++){
            for (int m=0; m< 12; m++){
                if (noEsTemperaturaDefault(this.temperaturas[a][m])){
                  if ( this.esTemperaturaMax(this.temperaturas[a][m],temperaturaMax)== true){
                    temperaturaMax = this.temperaturas[a][m];
                    aux=("En el año "+(añoIni+a)+ " y en el mes "+(m+1)+" se registro la temperatura maxima."
                            + "Con un total de "+temperaturaMax+" grados.");
                }   
                }
            }
        }
        return aux;
    }
    
    
    
    
    
    public String toString (){
        String aux = this.getNombre() + " ( "+this.getLatitud()+ " "+this.getLongitud()+ " )"; 
        return aux;
    }
    
    public abstract void calcularPromedio ();
    
}
