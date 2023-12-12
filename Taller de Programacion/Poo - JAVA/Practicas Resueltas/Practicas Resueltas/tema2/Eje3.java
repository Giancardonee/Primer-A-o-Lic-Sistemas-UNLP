/*
3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.

a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:

b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.

 */

/*
    Planteo del ejercicio: Matriz de 5 x 8 
    5 (filas) representa los dias
    8 (columnas) representa los turnos y tambien a las personas entrevistadas
    
    sabemos que como maximo podemos tener 40 personas, pero pueden ser menos
    se me ocurre llevar dos variables: 1 para la columna y otra para la fila
    o una sola variable donde cuente la cantidad de personas cargadas.
*/
package tema2;
import PaqueteLectura.Lector; 
/**
 *
 * @author Gianca
 */
public class Eje3 {
    public static void main(String[] args) {
    final int cantDias = 5; 
    final int cantTurnos = 8; 
    int fila=0,columna=0, cantPersonas = 40,personasCargadas=0; 
    String nombre;
    Persona matriz [][] = new Persona [cantDias][cantTurnos]; 
    
        System.out.println("Ingrese el nombre: ");
        nombre = Lector.leerString(); 
        while ( (fila < cantDias) && (!nombre.equals("ZZZ"))  ){
            columna=0;
            while ( (columna < cantTurnos) &&(!nombre.equals("ZZZ"))  ){
                Persona p = new Persona(); 
                p.setNombre(nombre); 
                System.out.println("Ingrese el dni: ");
                p.setDNI(Lector.leerInt());
                System.out.println("Ingrese la edad: ");
                p.setEdad(Lector.leerInt());

                matriz[fila][columna] = p;
                columna++;  
             
                    if ( (fila < cantDias) && (columna < cantTurnos) ){
                       System.out.println("Ingrese el nombre: ");
                       nombre = Lector.leerString();    
                    }
                    else{
                        System.out.println("Se llenaron los cupos.");
                    }
             
            }
            
           fila++;  
        }
    
            // inciso B 
              
                for (int f=0; f< fila; f++){
                for (int c=0; c< columna; c++){
                    System.out.println("La persona "+matriz[f][c].getNombre()+ " debera ir "
                            + "el dia "+(f+1)+ " en el turno "+(c+1));   
                 }
               }
                
             
    }
}
