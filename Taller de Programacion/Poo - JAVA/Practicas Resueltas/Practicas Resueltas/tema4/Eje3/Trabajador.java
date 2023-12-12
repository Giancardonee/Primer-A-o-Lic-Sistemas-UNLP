/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4.Eje3;

/**
 *
 * @author Usuario
 */
public class Trabajador extends Persona {
     private String tareaRealizada;

     public Trabajador (){
         
     }
     
     public Trabajador (String unNombre, int unDni, int unaEdad, String unaTarea){
         super(unNombre,unDni,unaEdad);
         this.setTareaRealizada(unaTarea);
     }

    public String getTareaRealizada() {
        return tareaRealizada;
    }

    public void setTareaRealizada(String tareaRealizada) {
        this.tareaRealizada = tareaRealizada;
    }
        
}
