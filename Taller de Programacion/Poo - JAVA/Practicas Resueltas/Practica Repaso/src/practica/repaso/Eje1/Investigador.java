/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica.repaso.Eje1;

/**
 *
 * @author Usuario
 */
public class Investigador {
    private String nombreCompleto;
    private int categoria; 
    private String especialidad;
    private Subsidio subsidios []; 
    private int subsidiosTotales = 5; // se usa como dimF 
    private int dimL = 0; // se usa como dimL
    
    public Investigador (String unNombre, String unaEspecialidad, int unaCategoria){
        this.especialidad = unaEspecialidad; 
        this.nombreCompleto = unNombre; 
        this.categoria = unaCategoria;
        this.subsidios = new Subsidio [subsidiosTotales];
    }
    
    public void agregarSubsidio (Subsidio unSubsidio){
        if (this.dimL < subsidiosTotales){
            subsidios [this.dimL] = unSubsidio;
            this.dimL++; 
        }
        else{
            System.out.println("**Error en agregar investigador: "
                    + "No hay mas subsidios para el investigador "+this.getNombreCompleto());
        }
    }
    
    public void otorgar (){
        int cantSubsidios = this.getDimL();
        if (cantSubsidios > 0){
         for (int i=0; i <cantSubsidios; i++){
           if (subsidios[i].getOtorgado() == false) {
                 subsidios[i].otorgarSubsidio();   
           }
          }   
       }
    }
    
    public double devolverDineroPorInvestigador (){
        double suma=0;
        if (this.getDimL() > 0) {
              for (int i=0; i< this.dimL; i++){
                    suma += subsidios[i].getDineroOtorgado();
                }
    }
        
        return suma;
    }
   
    public int getCategoria (){
        return this.categoria;
    }
    
    public String getEspecialidad (){
        return this.especialidad;
    }
    
    public String getNombreCompleto (){
        return this.nombreCompleto;
    }
    
    private int getDimL (){
        return this.dimL;
    }

    private int getSubsidiosTotales(){
        return this.subsidiosTotales;
    }
    
    @Override
    public String toString (){
        String aux;
        aux = "Nombre del investigador: "+this.getNombreCompleto()+ " categoria "+this.getCategoria()+ " especialidad: "
                +this.getEspecialidad()+ " el total de dinero en subsidios otorgados es: "+this.devolverDineroPorInvestigador(); 
        return aux;
    }
    
}
