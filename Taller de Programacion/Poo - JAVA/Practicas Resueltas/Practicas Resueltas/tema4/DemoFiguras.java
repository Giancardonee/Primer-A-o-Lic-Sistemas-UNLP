/*
- Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la
representación String de cada uno. Pruebe el funcionamiento del método despintar.


 */
package tema4;


public class DemoFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado cuad = new Cuadrado(10,"Rojo", "Negro");
        System.out.println("Color linea: " + cuad.getColorLinea()); 
        System.out.println("Area: " + cuad.calcularArea()); 
        System.out.println("Representacion del cuadrado: " + cuad.toString()); 
       
        
        Triangulo tri = new Triangulo ("Amarillo","Violeta",8,10,8);
        System.out.println("Representacion del triangulo: "+tri.toString());
        tri.despintar();
        System.out.println("Se despinto el triangulo.");
        System.out.println("El color de relleno del triangulo es "+tri.getColorRelleno());
        System.out.println("El color de linea del triangulo es "+tri.getColorLinea());
        
        
        Circulo cir = new Circulo ("Rojo", "Naranja", 5); 
        System.out.println("Representacion del circulo: "+cir.toString()) ;
        cir.despintar();
        System.out.println("Se despinto el circulo.");
        System.out.println("El color de relleno del circulo es "+cir.getColorRelleno());;
        System.out.println("El color de linea del cirulo es "+cir.getColorLinea());
    }
    
    
    
}
