/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Usuario
 */
public class EjePrueba {
    public static void main(String[] args) {
       Libro libro1 = new Libro (); 
       Autor autor = new Autor ("Gianca","bio","origen"); 
       libro1.setPrimerAutor(autor);
       
        System.out.println(libro1.getPrimerAutor().getNombre());
        libro1.getPrimerAutor().setNombre("Franco");
        System.out.println(libro1.getPrimerAutor().getNombre());
        
        
        Autor autor2 = new Autor ("nombre","bio","origen");
        Libro libro2 = new Libro ("unTitulo", "editorial", 2020, autor2, "ISBN", 3499); 
        
        
        
        
        
    }
}
