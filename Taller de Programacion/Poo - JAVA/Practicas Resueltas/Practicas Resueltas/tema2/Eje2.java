/*
 2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo 15 personas. 
   La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
    obtener edad 0. Luego de almacenar la información:
     - Informe la cantidad de personas mayores de 65 años.
    - Muestre la representación de la persona con menor DNI.

    **************************************************************************************
    PREGUNTAR SI EN ESTE CASO, PUEDO LEER LOS DATOS DENTRO DE LA CLASE PERSONA
    ES DECIR, USAR UN METODO QUE SEA LEERDATOS Y LEERLOS DESDE TECLADO. PERO SERIA UN METODO DE LA CLASE PERSONA
    **************************************************************************************
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author Gianca
 */
public class Eje2 {
     public static void main(String[] args) {
         GeneradorAleatorio.iniciar();
         final int cantPersonas = 1; 
         int dimL = 0; 
         Persona vecPersonas [] = new Persona [cantPersonas];  
          
         int edad; 
         edad = GeneradorAleatorio.generarInt(100); 
         while ( (dimL < (cantPersonas)  ) && (edad != 0 )) {
             Persona p = new Persona(); 
             p.setEdad(edad);
             p.setDNI(GeneradorAleatorio.generarInt(100)); 
             p.setNombre(GeneradorAleatorio.generarString(15));
             vecPersonas[dimL] = p;
             dimL++;
             // vuelvo a generar la edad aleatoriamente
             edad = GeneradorAleatorio.generarInt(100); 
             
         }
          
         int cantMayores65 = 0;
         int indiceMin=0,dniMin=99;  
        
        for (int i=0; i < dimL; i++){ 
            
            System.out.println(vecPersonas[i].toString());
            
            
             if (vecPersonas[i].getEdad() > 65) 
                 cantMayores65++;
             

             if (vecPersonas[i].getDNI() < dniMin){
                 dniMin = vecPersonas[i].getDNI(); 
                 indiceMin = i; 
             }
         }// termina el for
        
         System.out.println("La cantidad de personas mayores a 65 años son: "+cantMayores65);
         System.out.println("->>>Representacion de la persona con menor dni: ");  
         System.out.println(vecPersonas[indiceMin].toString());
            
      }
    }
