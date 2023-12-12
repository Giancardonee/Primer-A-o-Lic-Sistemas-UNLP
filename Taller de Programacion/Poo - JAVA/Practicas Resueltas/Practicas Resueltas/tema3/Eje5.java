package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author Gianca
 */
public class Eje5 {
     public static void main(String[] args) {
         System.out.println("Ingrese el radio del circulo: ");
         double radio = Lector.leerDouble();
         System.out.println("Ingrese el color de relleno del circulo: ");
         String colorRelleno = Lector.leerString();
         System.out.println("Ingrese el color de linea del circulo: ");
         String colorLinea = Lector.leerString();
         Circulo circulo1 = new Circulo (radio,colorRelleno,colorLinea);
         
         
         System.out.println("La representacion del circulo es: "+circulo1.toString());
         System.out.println("El area del circulo es: "+circulo1.calcularArea());
         System.out.println("El perimetro del circulo es: "+circulo1.calcularPerimetro());
         
         
     }
}
