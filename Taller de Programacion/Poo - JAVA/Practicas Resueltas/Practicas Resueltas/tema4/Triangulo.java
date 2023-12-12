package tema4;
/**
 *
 * @author Gianca
 */
public class Triangulo extends Figura {
    private int lado1,lado2,lado3;

    public Triangulo() {
    
    }

    public Triangulo(String unCR, String unCL) {
        super(unCR, unCL);
    }
    
    public Triangulo(String unCR, String unCL, int lado1, int lado2, int lado3) {
        super(unCR, unCL);
        this.setLado1(lado1);
        this.setLado2(lado2); 
        this.setLado3(lado3);
    }
    
    public int getLado1() {
        return lado1;
    }

    public void setLado1(int lado1) {
        this.lado1 = lado1;
    }

    public int getLado2() {
        return lado2;
    }

    public void setLado2(int lado2) {
        this.lado2 = lado2;
    }
    
    
    public int getLado3() {
        return lado3;
    }

    public void setLado3(int lado3) {
        this.lado3 = lado3;
    }
    
    
    //  metodos abstractos de la clase Triangulo: 
    @Override
    public double calcularPerimetro (){
        double resultado = this.getLado1() + this.getLado2() + this.getLado3();
        return resultado; 
    }
    
    @Override
    public double calcularArea (){
       int a = this.getLado1();
       int b = this.getLado2();
       int c = this.getLado3();
        
        // Calcular el semiperímetro
        double s = (a + b + c) / 2;
       // Aplicar la fórmula de Herón para el área
        double area = Math.sqrt(s * (s - a) * (s - b) * (s - c));
        return area;
    }
    
    @Override
    public String toString (){
        String aux;
        aux = super.toString()+ ". Tiene lado1: "+this.getLado1()+ " lado 2: "+this.getLado2()+ " lado 3: "+this.getLado3();
        return aux; 
        
    }

        
}
