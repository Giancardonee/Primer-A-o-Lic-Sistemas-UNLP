/*
 Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
 */
package tema2;
import PaqueteLectura.Lector;
/**
 *
 * @author Gianca 
 */
public class Eje5 {
    public static void main(String[] args) {
        final int cantPartidos = 2 ; 
        Partido partidos [] = new Partido [cantPartidos]; 
        int dimL = -1; 
        String nombreVisitante;
        
        // Carga de partidos :  
        System.out.println("Ingrese el equipo Visitante: ");
        nombreVisitante = Lector.leerString(); 
        
        while ( ( dimL < ( cantPartidos-1) ) && (!nombreVisitante.equals("ZZZ")) ) {
        
            Partido partido  = new Partido (); 
            partido.setVisitante(nombreVisitante);
            System.out.println("Ingrese los goles del equipo Visitante: ");
            partido.setGolesVisitante(Lector.leerInt());
            System.out.println("Ingrese el equipo Local: ");
            partido.setLocal(Lector.leerString()); 
            System.out.println("Ingrese los goles del equipo Local:  ");
            partido.setGolesLocal (Lector.leerInt()); 
            
            dimL++; 
            partidos[dimL] = partido;
            
            if (dimL < ( cantPartidos -1) ){
                System.out.println("Ingrese el nombre del equipo Visitante: ");
                nombreVisitante = Lector.leerString(); 
            }
            
        } 
        
        // Hacmoes los incisos: 
        int cantGanoRiver=0;
        int golesBocaLocal=0;
        
        if (dimL >=-0){
         for (int i=0; i<= dimL ; i++){
            // Informamos cada partido en representacion toString
            System.out.println(partidos[i].toString()); 
            
            // Calculamos la cantidad de partidos que gano River
            if (partidos[i].getGanador().equals("River")){
                cantGanoRiver++; 
            }
            // Calculamos los goles que hizo Boca jugando de local
            if (  partidos[i].getLocal().equals("Boca")  ){
                golesBocaLocal += partidos[i].getGolesLocal() ; 
            }
                
         }
            System.out.println("La cantidad de goles de Boca jugando de local son: "+golesBocaLocal);
            System.out.println("La cantidad de partidos que gano River son: "+cantGanoRiver);
           
            
        }
    }
}
