/*
3-A- Implemente las clases para el siguiente problema. Una garita de seguridad quiere 
identificar los distintos tipos de personas que entran a un barrio cerrado.

Al barrio pueden entrar: personas, que se caracterizan por nombre, DNI y edad; y trabajadores,
estos son personas que se caracterizan además por la tarea realizada en el predio. 
Implemente constructores, getters y setters para las clases. Además tanto las personas 
como los trabajadores deben responder al mensaje toString siguiendo el formato:

 Personas “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
 Trabajadores “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy jardinero.”

B- Realice un programa que instancie una persona y un trabajador y muestre la 
representación de cada uno en consola.
 */
package tema4.Eje3;

/**
 *
 * @author Usuario
 */
public class Eje3Main {
     public static void main(String[] args) {
         Persona perso1 = new Persona ("Gianluca",45200602,28); 
         System.out.println(perso1.toString());
         
         Trabajador trab1 = new Trabajador ("Franco",45244862,19,"Podador"); 
         System.out.println(trab1.toString());
         System.out.println("La tarea que realiza Franco es "+trab1.getTareaRealizada());
         
         
     }
         
    
    
}
