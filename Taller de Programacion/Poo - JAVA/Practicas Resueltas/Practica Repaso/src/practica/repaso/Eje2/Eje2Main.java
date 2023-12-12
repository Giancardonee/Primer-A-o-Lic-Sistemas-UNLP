/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica.repaso.Eje2;
import PaqueteLectura.Lector; 
/**
 *
 * @author Gianca
 */
public class Eje2Main {
         public static void main(String[] args) {
        //instancie un estacionamiento con 3 pisos y 3 plazas por piso.
          Estacionamiento estacionamiento1 = new Estacionamiento ("NombreEstacionamiento","La Plata, 7 y 50", "8:45", "23:00",3,3);   
          
          
          Auto auto1 = new Auto ("nombreDueñoAuto1", "PatenteAuto1"); 
          estacionamiento1.agregarAuto(auto1, 1, 1); 
          
          Auto auto2 = new Auto ("nombreDueñoAuto2", "PatenteAuto2"); 
          estacionamiento1.agregarAuto(auto2, 1, 2); 
                    
          Auto auto3 = new Auto ("nombreDueñoAuto3", "PatenteAuto3"); 
          estacionamiento1.agregarAuto(auto3, 1, 1); // deberia tirar msj error 
                    
          Auto auto4 = new Auto ("nombreDueñoAuto4", "PatenteAuto4"); 
          estacionamiento1.agregarAuto(auto4, 2, 1); 
          
          Auto auto5 = new Auto ("nombreDueñoAuto5", "PatenteAuto5"); 
          estacionamiento1.agregarAuto(auto5, 2,3 );           
          
          Auto auto6 = new Auto ("nombreDueñoAuto6", "PatenteAuto6"); 
          estacionamiento1.agregarAuto(auto6, 3, 1); 
          
          System.out.println(estacionamiento1.toString());
          System.out.println("La cantidad de autos en la plaza 1 son: "+estacionamiento1.contarAutosEnPlaza(1));
          
          System.out.print("Ingrese una patente para buscar en el estacionamiento: ");
          String patente_A_Buscar = Lector.leerString();
          
          System.out.println(estacionamiento1.buscarAuto(patente_A_Buscar));
          
         }
}
