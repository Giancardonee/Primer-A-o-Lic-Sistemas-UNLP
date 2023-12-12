
package practica.repaso.Eje2;

/**
 *
 * @author Gianca
 */
public class Auto {
    private String nombreDueño;
    private String patente; 
    
    public Auto (){
        
    }
    
    public Auto (String unNombreDueño, String unaPatente){
        this.setNombreDueño(unNombreDueño);
        this.setPatente(unaPatente);
    }

    public String getNombreDueño() {
        return nombreDueño;
    }

    public void setNombreDueño(String nombreDueño) {
        this.nombreDueño = nombreDueño;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    
    public String toString (){
        String aux;
        aux = "->>> Nombre del dueño: "+this.getNombreDueño()+". Patente: "+this.getPatente();
        return aux;
    }
    
    
}
