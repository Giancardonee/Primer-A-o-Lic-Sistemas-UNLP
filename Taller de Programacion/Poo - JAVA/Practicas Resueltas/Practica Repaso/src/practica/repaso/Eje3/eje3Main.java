/*
 */
package practica.repaso.Eje3;

/**
 *
 * @author Usuario
 */
public class eje3Main {
             public static void main(String[] args) {
             
           Evento_Ocasional showTV = new Evento_Ocasional ("La jerga",5,"28 de agosto","show de tv","Gianca");
           showTV.agregarTema("She dont give a fo");
           showTV.agregarTema("Givenchy");
           showTV.agregarTema("Detras del humo no se ve");
           showTV.agregarTema("Jagger");
           showTV.actuar();
           System.out.println("El costo de este show fue de "+showTV.calcularCosto()+" pesos.");
   
                 System.out.println("***********************************************");
           
           Gira gira1 = new Gira ("nombreBanda",3,"aaa",3);
           gira1.agregarTema("Ya no");
           gira1.agregarTema("Rapido lento");
           gira1.agregarTema("Dispara");
           Fecha fecha1 = new Fecha ("4 de Junio","Santiago del Estero");
           gira1.agregarFecha(fecha1);
           Fecha fecha2 = new Fecha ("14 de Septiempre", "La Plata");
           gira1.agregarFecha(fecha2);
           
           gira1.actuar();
           System.out.println("El costo de esta gira fue de: "+gira1.calcularCosto()+" pesos.");
             }
}
