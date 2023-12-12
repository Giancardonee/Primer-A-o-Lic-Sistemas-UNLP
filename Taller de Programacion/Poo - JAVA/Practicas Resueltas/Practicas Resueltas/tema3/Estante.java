package tema3;
/**
 *
 * @author Gianca
 */
public class Estante {
    private final int dimF = 20; 
    private int librosAlmacenados; // dimL 
    private Libro estante[]; 
    
    public Estante (){
        librosAlmacenados=0;
        estante = new Libro [dimF]; 
        for (int i=0; i<dimF; i++){
            estante[i] = null;
        }
    }
    
   //---------------------------------------

   public void agregarAlEstante (Libro libro){
       if (librosAlmacenados < dimF) {
           estante[librosAlmacenados] = libro;
           librosAlmacenados++;
       }
   } 
    
    public int getLibrosAlmacenados() {
        return librosAlmacenados;
    }

    public boolean estaLleno (){ 
        return (librosAlmacenados == dimF); 
    }
    
    public Libro devolverLibro (String unTitulo){
        Libro libroReturn = null;
        boolean encontre = false;
        int i = 0;
        while ( (i < librosAlmacenados) && (!encontre)){
            if (estante[i].getTitulo().equals(unTitulo)) {
                encontre = true;
                libroReturn = estante[i]; 
            }
            else{
                i ++;
            }
        }
        
        return libroReturn;
    }
}
