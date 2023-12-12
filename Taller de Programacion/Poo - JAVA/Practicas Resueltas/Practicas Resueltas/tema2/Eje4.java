/*
4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:

a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos
de casting.
Una vez finalizada la inscripción:

b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado.

 */
package tema2;
import PaqueteLectura.Lector;
/**
 *
 * @author Gianca
 */
public class Eje4 {
    public static void main(String[] args) {
    final int cantPersonas = 40; 
    int personasCargadas=0; 
    String nombre;
    final int cantDias = 5; 
    final int cantTurnos = 8; 
    int dia,turno;
    boolean estaLibre;
    Persona matriz [][] = new Persona [cantDias][cantTurnos]; 
    
        System.out.println("Ingrese el nombre: ");
        nombre = Lector.leerString(); 
        while ( (personasCargadas < cantPersonas) && (!nombre.equals("ZZZ"))  ){
            Persona p = new Persona();
            
            p.setNombre (nombre); // le asigno el nombre que lei al onjeto persona. 
            estaLibre= false;    
            System.out.println("Ingrese su dni: ");
            p.setDNI(Lector.leerInt()); 
            System.out.println("Ingrese su edad: ");
            p.setEdad(Lector.leerInt()); 
            System.out.println("Ingrese el dia que se quiera presentar al casting: ");
            dia = Lector.leerInt(); 
            turno=0;
            
            // en este while buscamos si hay un turno en el dia que se ingresó.
            while ( (!estaLibre) && (turno < ( cantTurnos) )){
                    if (matriz[(dia-1)][turno]== null){
                        estaLibre = true;  
                        matriz[(dia-1)][turno] = p;
                        personasCargadas++;
                    }
                    else
                    {
                        turno++; 
                    }
            }
            
                if (!estaLibre){
                    System.out.println("No quedaron mas turnos para el dia elegido");
                }
                else{
                    System.out.println("Se le asigno un turno correctamente. ");
                }

               if ( personasCargadas < cantPersonas){
                   System.out.println("Ingrese un nombre: ");
                   nombre = Lector.leerString(); 
               } 
            
            
        } // fin del 1er while
    
        
        int sumaPersonasDia; 
        // inciso B 
        for (dia=0; dia <cantDias; dia++){
            sumaPersonasDia=0;
            for (turno=0; turno < cantTurnos; turno++){
                    if (matriz[dia][turno]!= null){
                        System.out.println("En el dia ( "+(dia+1)+ " ) se debe presentar la persona "+matriz[dia][turno].getNombre() + ""
                            + " en el turno  ( "+(turno+1)+ " )");   
                             sumaPersonasDia++;    
                    }
             }      
        System.out.println(">>>La cantidad de personas del dia ( "+(dia+1)+" ) son: ( "+sumaPersonasDia+ " ) "); 
            System.out.println("**************************************************************");
          }   
     }
}