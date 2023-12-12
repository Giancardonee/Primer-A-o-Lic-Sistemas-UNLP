package tema4.Eje6;

/**
 *
 * @author Gianca
 */
public class Eje6Main {
    public static void main(String[] args) {
        ReporteMeses LaPlata = new ReporteMeses(2010,5,"La Plata","34,921 S","-57 ,995 0");
        
        LaPlata.setTemperatura(2010, 1,40);
        LaPlata.setTemperatura(2012, 2,34);
        LaPlata.setTemperatura(2013, 3,100);
        LaPlata.setTemperatura(2014, 3,300);
        
        LaPlata.calcularPromedio();
        System.out.println(LaPlata.datosDeTemperaturaMaxima()); 
        
        int mes= 3; 
        //System.out.println("La temperatura del mes "+LaPlata.getTemperatura((mes-1), 2014));
        
        
        
        System.out.println(LaPlata.toString());
    }
}
