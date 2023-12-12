/*
1- Se dispone de la clase Persona (en la carpeta tema2). Un objeto persona puede crearse
sin valores iniciales o enviando en el mensaje de creación el nombre, DNI y edad (en ese orden).

Un objeto persona responde a los siguientes mensajes:
getNombre() retorna el nombre (String) de la persona
getDNI() retorna el dni (int) de la persona
getEdad() retorna la edad (int) de la persona
setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
setDNI(X) modifica el DNI de la persona al “int” pasado por parámetro (X)
setEdad(X) modifica la edad de la persona al “int” pasado por parámetro (X)
toString() retorna un String que representa al objeto. Ej: “Mi nombre es Mauro,
mi DNI es 11203737 y tengo 70 años”

Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
muestre en consola la representación de ese objeto en formato String. 
 */
package tema2;
import PaqueteLectura.Lector; 
/**
 *
 * @author Gianca
 */
public class Eje1 {
    public static void main(String[] args) {
       
      //Usando variables 
        int dni,edad; 
        String nombre;
        
        System.out.println("->> Estas cargando la primer persona usando variables. ");
        
        System.out.println("Ingrese el nombre: ");
        nombre = Lector.leerString();
        System.out.println("Ingrese el dni: ");
        dni = Lector.leerInt(); 
        System.out.println("Ingrese la edad: ");
        edad = Lector.leerInt(); 
        Persona persona1 = new Persona (nombre,dni,edad);
        System.out.println(persona1.toString());
        
        
       
       //Sin usar variables adicionales [ creo que este ejemplo seria el correcto ]
        System.out.println("->> Estas cargando la segunda persona sin usar variables. ");
       
       Persona persona2 = new Persona(); //  inicializamos el objeto sin valores
       // Leemos sus datos, y lo mandamos con el set
        System.out.println("Ingrese el nombre: ");
        persona2.setNombre(Lector.leerString());
        System.out.println("Ingrese el dni: "); 
        persona2.setDNI(Lector.leerInt()); 
        System.out.println("Ingrese la edad: ");
        persona2.setEdad(Lector.leerInt());
       System.out.println(persona2.toString());
       
       
    }    
}
