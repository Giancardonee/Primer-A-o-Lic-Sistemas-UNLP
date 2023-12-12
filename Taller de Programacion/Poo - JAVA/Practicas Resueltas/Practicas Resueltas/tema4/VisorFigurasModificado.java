package tema4;
/**
 *
 * @author Usuario
 */
public class VisorFigurasModificado {
 private int guardadas=0;
 private int capacidadMaxima=5;
 private Figura [] vector;
 
 public VisorFigurasModificado(){
     vector = new Figura [capacidadMaxima]; 
 }
 
 public void guardar(Figura f){
     vector[guardadas] = f;
     guardadas++;
 }
 
 //sigue a la derecha -> 
 public boolean quedaEspacio(){
     boolean estaLleno;
     if (guardadas < capacidadMaxima){
          estaLleno = false;
     }
     else{
         estaLleno = true; 
     }
   return estaLleno;      
 }
 
 public void mostrar(){
     for (int i=0; i<guardadas; i++){
         System.out.println("Figura "+(i+1)+ " "+this.vector[i].toString());
     }
 }
 
 /*
 public String mostrarV2(){
     String aux="";
      for (int i=0; i<guardadas; i++){
         aux+= " Figura "+i+ " "+this.vector[i].toString() + " \n";
     }
     return aux; 
 }
 */ 
  
 public int getGuardadas() {
 return guardadas;
 }
 
}

