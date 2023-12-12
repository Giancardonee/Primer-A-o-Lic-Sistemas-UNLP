/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica.repaso.Eje1;

/**
 *
 * @author Usuario
 */
public class Eje1Main {
     public static void main(String[] args) {
         Proyecto proyecto1 = new Proyecto ("UN_NOMBRE_PROYECTO",34884, "UN_NOMBRE_DIRECTOR"); 
         Investigador investigador1 = new Investigador("NOMBRE1","ESPECIALIDAD1",1); 
         Investigador investigador2 = new Investigador("NOMBRE2","ESPECIALIDAD2",2);
         Investigador investigador3 = new Investigador("NOMBRE3","ESPECIALIDAD3",3); 
         
         proyecto1.agregarInvestigador(investigador1);
         proyecto1.agregarInvestigador(investigador2);
         proyecto1.agregarInvestigador(investigador3);
         
         Subsidio subsidio1 = new Subsidio (3500, "UnMotivo1"); 
         Subsidio subsidio2 = new Subsidio (1500, "UnMotivo2"); 
         investigador1.agregarSubsidio(subsidio1);
         investigador1.agregarSubsidio(subsidio2);
         
         Subsidio subsidio3 = new Subsidio (5000, "UnMotivo3"); 
         Subsidio subsidio4 = new Subsidio (1500, "UnMotivo4"); 
         investigador2.agregarSubsidio(subsidio3);
         investigador2.agregarSubsidio(subsidio4);
         
         Subsidio subsidio5 = new Subsidio (2000, "UnMotivo5"); 
         Subsidio subsidio6 = new Subsidio (500, "UnMotivo6"); 
         investigador3.agregarSubsidio(subsidio5);
         investigador3.agregarSubsidio(subsidio6);
         
         proyecto1.otorgarTodos("NOMBRE3");
         proyecto1.otorgarTodos("NOMBRE1");
         System.out.println(proyecto1.toString());    
     }
     
}
