package tema3;
/**
 *
 * @author Gianca
 */
public class Circulo {
    private double radio; 
    private String colorRelleno; 
    private String colorLinea; 

    public Circulo (double unRadio, String unColorRelleno, String unColorLinea){
        radio = unRadio; 
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea; 
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro (){
        return (2 * Math.PI * radio);
    }
    
    public double calcularArea (){ 
        return ( Math.PI* (radio*radio));
    }

    public String toString (){
       String aux = "El color de relleno es "+colorRelleno+ ". El color de linea es "+colorLinea+ ". El radio es "+radio;
        return aux;
    }
    
}
