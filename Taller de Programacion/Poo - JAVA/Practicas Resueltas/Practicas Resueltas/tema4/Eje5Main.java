/*
Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el 
visor y por último haga que el visor muestre sus figuras almacenadas.
 */
package tema4;

/**
 *
 * @author Usuario
 */

public class Eje5Main {
    public static void main(String[] args) {
        VisorFigurasModificado visor = new VisorFigurasModificado (); 
        int dimF = visor.getGuardadas(); 
        Cuadrado cuadr1 = new Cuadrado (5,"Rojo","Amarillo"); 
        visor.guardar(cuadr1);
        Cuadrado cuadr2 = new Cuadrado (23,"Violeta","Verde"); 
        visor.guardar(cuadr2);
        Rectangulo rect1 = new Rectangulo (25,10,"Gris","Azul");
        visor.guardar(rect1);
                
        visor.mostrar(); 
        
        
        
    }
}
