/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.Lector;

/**
 *
 * @author Gianca
 */
public class Eje5v2 {
        public static void main(String[] args) {
        final int cantPartidos = 20 ; 
        Partido partidos [] = new Partido [cantPartidos]; 
        int dimL = 0; 
        String nombreVisitante;
        
        
        // Carga de partidos :  
        System.out.println("Ingrese el equipo Visitante: ");
        nombreVisitante = Lector.leerString();   
        while ( ( dimL < (cantPartidos) ) && (!nombreVisitante.equals("ZZZ")) )  {
            
            
                Partido partido  = new Partido (); 
                // seteamos el nombre que leimos antes.
                partido.setVisitante(nombreVisitante);
                
                System.out.println("Ingrese los goles del equipo Visitante: ");
                partido.setGolesVisitante(Lector.leerInt());
                System.out.println("Ingrese el equipo Local: ");
                partido.setLocal(Lector.leerString()); 
                System.out.println("Ingrese los goles del equipo Local:  ");
                partido.setGolesLocal (Lector.leerInt()); 
                
                // agrego el partido al vector, e incremento la dimL 
                partidos [dimL] = partido;
                dimL ++; 
                
                
                System.out.println("Ingrese el equipo Visitante: ");
                nombreVisitante = Lector.leerString(); 
           
        } 

        // Hacmoes los incisos: 
        int cantGanoRiver=0;
        int golesBocaLocal=0;
        
         for (int i=0; i< (dimL); i++){
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
            
            System.out.println("Datos del primer partido: ");
            System.out.println("Hay ganador? "+partidos[0].hayGanador());
            
        }
}
