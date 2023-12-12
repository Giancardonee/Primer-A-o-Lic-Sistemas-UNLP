/*
Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad.
 */
package tema4.eje2;

/**
 *
 * @author Usuario
 */
public abstract class Empleado {
    private String nombre; 
    private double sueldoBasico; 
    private int antiguedad; 
    
    public Empleado (){
    
    }
    
    public Empleado (String unNombre, double unSueldoBasico, int unaAntiguedad){
     this.setNombre (unNombre); 
     this.setAntiguedad (unaAntiguedad); 
     this.setSueldoBasico(unSueldoBasico);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
     public double calcularSueldoACobrar (){
         double sueldoBasic = this.getSueldoBasico(); 
         double sueldoACobrar = sueldoBasic + (sueldoBasic*0.10)*(this.getAntiguedad()); 
         double plus = this.calcularPlus();
         
         return (sueldoACobrar+plus);
     } 
    
    @Override
    public String toString (){
        String aux;
        aux = "El nombre es "+this.getNombre() + " ,el sueldo a cobrar es: "+this.calcularSueldoACobrar()+
                "s. Su efectividad es: "+this.calcularEfectividad();
        return aux;
    }
    
    public abstract double calcularEfectividad ();
    public abstract double calcularPlus(); 
   
    
}
