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
public class Jugador extends Empleado {
    private int partidosJugados; 
    private int golesAnotados; 

    public Jugador (){
        
    }
    
    public Jugador(int partidosJugados, int golesAnotados) {
        this.partidosJugados = partidosJugados;
        this.golesAnotados = golesAnotados;
    }

    public Jugador(int partidosJugados, int golesAnotados, String unNombre, double unSueldoBasico, int unaAntiguedad) {
        super(unNombre, unSueldoBasico, unaAntiguedad);
        this.partidosJugados = partidosJugados;
        this.golesAnotados = golesAnotados;
    }

    public int getPartidosJugados() {
        return partidosJugados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    
    public String toString (){
        String aux; 
        aux = super.toString();
        return aux; 
    }
    
    @Override
    public double calcularEfectividad (){
        int partidos = this.getPartidosJugados();
        int goles = this.getGolesAnotados();
        return ((double)partidos/goles ); 
    }
    
    @Override 
    public double calcularPlus (){
        double plus=0;
        double promedio = this.calcularEfectividad(); 
        if (promedio > 0.5){ 
            plus = this.getSueldoBasico(); 
        }
        return plus;
    }
}
