/*
4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está 
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.

(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre, 
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/ 
2000 y 8000.

(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está 
en el rango 1..N) y que la habitación está libre. 
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato: 

{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada} 
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}

B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones, 
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Gianca
 */
public class Eje4 {
     public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
         System.out.println("Ingrese la cantidad de habitaciones del Hotel: ");
         Hotel hotel1 = new Hotel (Lector.leerInt());
         int valor,nroPieza; 
         
         System.out.println("Ingrese 1 si quiere ingresar un cliente: ");
         valor = Lector.leerInt();
         while (valor ==1){
             Cliente cliente = new Cliente ();
             System.out.println("Ingrese el dni del cliente: ");
             cliente.setDni(Lector.leerInt());
             System.out.println("Ingrese el nombre del cliente: ");
             cliente.setNombre(Lector.leerString());
             System.out.println("Ingrese la edad del cliente: ");
             cliente.setEdad(Lector.leerInt());
             
             System.out.println("<<-------------------------->>");
             System.out.println("Ingrese un numero de pieza: ");
             nroPieza = (Lector.leerInt());
             
             hotel1.ingresarCliente(cliente, (nroPieza-1));
              
             System.out.println("Ingrese 1 si quiere ingresar un cliente: ");
             valor = Lector.leerInt();
         }
         System.out.println("Representacion de hotel: ");
         System.out.println(hotel1.toString());
         
         System.out.println("Ingrese un precio para aumentar en todas las habitaciones: ");
         double valorAumento = Lector.leerDouble();
         
         hotel1.aumentarPrecio(valorAumento);
         
         System.out.println("El hotel con los precios actualizados queda: ");
         System.out.println(hotel1.toString());
         
     }
}
