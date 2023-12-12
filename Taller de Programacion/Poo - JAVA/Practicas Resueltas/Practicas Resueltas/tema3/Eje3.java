/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros. 
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para: 

(i) devolver la cantidad de libros que almacenados
(ii) devolver si el estante está lleno 
(iii) agregar un libro al estante 
(iv) devolver el libro con un título particular que se recibe.

B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante, 
busque e informe el autor del libro “Mujercitas”.

C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que 
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author Gianca
*/
public class Eje3 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estante estante1 = new Estante ();
        
         System.out.println("Ingresa 1 si queres agregar un libro al estante. Caso contrario ingrese 0");
        int seguir = Lector.leerInt(); 
        while ( ( (estante1.estaLleno())==false) && (seguir == 1)) { // usamos el metodo estaLleno
            Libro libro = new Libro (); 
            libro.setAñoEdicion(GeneradorAleatorio.generarInt(23)+2000); // ( le asigna un año entre 2000 y 2023 ) 
            libro.setEditorial(GeneradorAleatorio.generarString(5));
            libro.setISBN(GeneradorAleatorio.generarString(10));
            libro.setPrecio(GeneradorAleatorio.generarDouble(500));
            System.out.println("Ingrese el titulo del libro: ");
            libro.setTitulo(Lector.leerString()); 
            
            Autor autor = new Autor (GeneradorAleatorio.generarString(10),"aaa","Argentina"); // lo unico que cambia en cada autor es el nombre
            libro.setPrimerAutor(autor);
            estante1.agregarAlEstante(libro);
            
            System.out.println("La cantidad de libros almacenados son: "+estante1.getLibrosAlmacenados());
            
            if (estante1.estaLleno()==false){
                System.out.println("Todavia hay lugar en el estante.");
                System.out.println("Ingresa 1 si queres seguir cargando libros.");
                System.out.println("Ingresa 0 si queres dejar de cargar libros");
                seguir = Lector.leerInt(); 
            }
            else {
                System.out.println("Esta lleno el estante pa.");
            }
              
        }
        
      Libro libroBuscado = estante1.devolverLibro("Mujercitas");
        if (libroBuscado != null){
            System.out.println("Se encontro el libro.");
            System.out.println("Datos del autor: "+
                   libroBuscado.getPrimerAutor().toString()); 
        }
        else{
            if (estante1.getLibrosAlmacenados()>0){
                  System.out.println("El libro con titulo  ( Mujercitas )  no se encuentra en el estante.");
            }
            else{
                System.out.println("El estante esta vacio.");
            }
        }  
        
    }
}
