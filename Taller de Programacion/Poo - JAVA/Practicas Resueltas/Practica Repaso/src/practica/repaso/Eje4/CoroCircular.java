package eje4;
/**
 *
 * @author Usuario
 */
public class CoroCircular extends SerieDeCoristas {
    private int dimL;
    private Corista vecCoristas[];

    public CoroCircular(int unaDimF) {
        super(unaDimF);
        this.dimL = 0;
        vecCoristas = new Corista [unaDimF];
    }

    @Override
    public void agregarCorista (Corista unCorista){
        if (dimL < super.getDimF()) {
            vecCoristas[dimL] = unCorista;
            dimL++;
        }
    }
    
    @Override
    public boolean estaLleno (){ 
        return ( dimL == super.getDimF() );
    }
    
     @Override
    public boolean estaOrdenado (){
        int i=0;
        boolean ok = true;
        int tono;
        
        tono= vecCoristas[i].getTono();
        
        while ( (i < dimL) && (ok == true)) {
            if (vecCoristas[i+1] != null){
                if ( tono >= vecCoristas[i+1].getTono()) {
                    tono=vecCoristas[i+1].getTono();
                }
                else{
                    ok=false;
                }
            }
                i++;
        }
        return ok;
    }
    
    @Override
   public String toString (){
       String aux="";
       for (int i=0; i < dimL; i++){
           aux += vecCoristas[i].toString() +" \n";
       }
       return aux;
   }
    
}
