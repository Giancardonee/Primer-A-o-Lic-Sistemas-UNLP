package eje4;
/**
 *
 * @author Usuario
 */
public class CoroPorHileras extends SerieDeCoristas {
    private Corista matriz[][]; 
    private int dimLFila;
    private int dimLColumna;

    public CoroPorHileras(int unaDimF) {
        super(unaDimF);
        dimLFila=0;
        dimLColumna=0;
        matriz = new Corista[unaDimF][unaDimF];
    }
    
    @Override
    public void agregarCorista (Corista unCorista){
        int dimF = super.getDimF();
        
        
        if ( (dimLFila < dimF)&& (dimLColumna < dimF) ){
             matriz[dimLFila][dimLColumna]= unCorista;  
             dimLColumna++;     
          if (dimLColumna == dimF) {//
              dimLFila++;
                if (dimLFila != dimF){
                   dimLColumna = 0; // Vuelve a la columna 0
                }

            }
        }     
   
    }
    
    
    
    private boolean cumpleTonoFundamental (){
        boolean ok=false;
        int primerTono;
        int c=0;
        int f=0;
                
        while ( (c<dimLColumna) && (ok == false)){
            primerTono = matriz[c][f].getTono();
            while ( (f< dimLFila ) && (ok == false )){
                
                if (matriz[c][f].getTono() != primerTono){
                    ok=true;
                }
                else{
                    f++;
                }        
            }
            
            c++;
            f=0;
        }
        return ok;
    }
    
    private int actualizarTono (int fila, int columna){
        return matriz[fila][columna].getTono();
    }
    
    private boolean estanOrdenados (){
        boolean ok=false;
        
        int f=0;
        int c=0;
        int tono;
        
        while ( ( f<dimLFila ) && (ok == false )){
            tono = matriz[f][c].getTono();
            while ( (c < dimLColumna) && ( ok == false )){
                
                if ( ( matriz[f][c+1]!= null ) && ( tono>= matriz[f][c+1].getTono() ) ){
                    tono = actualizarTono(f,(c+1)); 
                    c++;                                
                }
                else {
                    ok = true;
                }
            }               
            f++;
            c=0;
        }
         return ok;
    }
    
    @Override
    public boolean estaLleno (){
       int dimF = super.getDimF();
       
     
      //  System.out.println(dimLFila);
       // System.out.println(dimLColumna);
        return ( ( dimLFila == dimF ) && ( dimLColumna == dimF ) );
    }
    
    @Override
    public boolean estaOrdenado (){
       return ( (this.cumpleTonoFundamental() == true ) && ( this.estanOrdenados() == true));
    }
    
    @Override
    public String toString (){
        String aux="";
        for (int f=0; f < dimLFila; f++){
            for (int c=0; c < dimLColumna; c++){
                aux += matriz[f][c].toString();
            }
        }
        return aux;
    }
}
