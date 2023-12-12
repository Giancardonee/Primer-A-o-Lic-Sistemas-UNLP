/*
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
 */
package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author Gianca
 */
public class Eje1 {
        public static void main(String[] args) {
            
            System.out.println("->>Ingrese los siguientes datos para el triangulo");
            /*
            Almaceno cada dato en una variable, para poder usar el constructor con 
            todos los datos necesarios. ( inicializar el objeto con todos sus datos )
            */
            
            System.out.println("Ingrese el lado 1: ");
            double lado1 = Lector.leerDouble(); 
            System.out.println("Ingrese el lado 2: ");
            double lado2 = Lector.leerDouble();
            System.out.println("Ingrese el lado 3: ");
            double lado3 = Lector.leerDouble(); 
            
            System.out.println("Ingrese el color de relleno: ");
            String colorRelleno = Lector.leerString();
            System.out.println("Ingrese el color de linea: ");
            String colorLinea = Lector.leerString();
        
            Triangulo triangulo1 = new Triangulo (lado1,lado2,lado3,colorRelleno,colorLinea);
            
            System.out.println("El perimetro del triangulo es: "+triangulo1.calcularPerimetro());
            System.out.println("El area del triangulo es: "+triangulo1.calcularArea());
     
      }
}
