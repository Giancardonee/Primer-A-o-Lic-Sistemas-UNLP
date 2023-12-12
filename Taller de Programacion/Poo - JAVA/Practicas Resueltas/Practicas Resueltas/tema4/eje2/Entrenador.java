/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.eje2;

/**
 *
 * @author Gianca
 */
public class Entrenador extends Empleado {
    private int campeonatosGanados; 

    public Entrenador (){
        
    }
    
    public Entrenador(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }

    public Entrenador(int campeonatosGanados, String unNombre, double unSueldoBasico, int unaAntiguedad) {
        super(unNombre, unSueldoBasico, unaAntiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    @Override
    public double calcularEfectividad (){
        int campeonatos,antiguedad; 
        campeonatos = this.getCampeonatosGanados(); 
        antiguedad = this.getAntiguedad(); 
        return ( (double)campeonatos / antiguedad ); 
    }
    
    
    @Override
    public double calcularPlus (){         
        int campGanados = this.getCampeonatosGanados(); 
        double plus = 0 ;  
        if ( (campGanados >=1 ) && (campGanados <=4) ){
            plus = 5000; 
        }
        else if ( (campGanados >= 5) && (campGanados <= 10)){
            plus = 30000;
        }
        else if ( campGanados >10 ){
            plus = 50000;
        }
        
        return (plus);
    }
    
    @Override
    public String toString (){
        String aux;
        aux = super.toString(); 
        return aux;
    }
    
    
}
