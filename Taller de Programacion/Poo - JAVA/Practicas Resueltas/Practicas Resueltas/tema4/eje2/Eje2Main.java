/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.eje2;

/**
 *
 * @author Usuario
 */
public class Eje2Main {
    public static void main(String[] args) {
        Entrenador entrenador1 = new Entrenador (1, "Gianluca",5000,1); // campeonatos ganados, nombre, sueldoBasico, antiguedad 
        System.out.println("Datos del entrenador: "+entrenador1.toString()); 
        
        Jugador jugador1 = new Jugador (10,10,"Nahuel",5600,30); //partidos, goles, nombre, sueldoBasico, antiguedad 
        System.out.println("Datos del jugador: "+jugador1.toString());
        
    }
}
