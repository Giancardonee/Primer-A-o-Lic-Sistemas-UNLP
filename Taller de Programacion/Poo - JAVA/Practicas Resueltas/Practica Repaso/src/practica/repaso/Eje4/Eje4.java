package eje4;
public class Eje4 {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Director director1 = new Director ("Violeta",5,34,5000);
        CoroCircular coroCir1 = new CoroCircular (5);
        Coro coro1 = new Coro ("nombreCoro1",director1,coroCir1); 
        Corista corista1 = new Corista (2, "corista1",3333,90);
        Corista corista2 = new Corista (4, "corista2",5555,60);
        coroCir1.agregarCorista(corista1);
        coroCir1.agregarCorista(corista2);
        System.out.println(coroCir1.estaLleno());
        System.out.println(coroCir1.estaOrdenado());
        System.out.println(coro1.toString());
        
        System.out.println("----------------------------------------------");
        
        Director director2 = new Director ("Gian",2,94,2222222);
        CoroPorHileras coroPorH1 = new CoroPorHileras (2); // 2 x 2 
        Coro coro2 = new Coro ("nombreCoro2",director2,coroPorH1);
        Corista corista3 = new Corista (9, "corista1",3333,90);// 0 0 
        Corista corista4 = new Corista (9, "corista2",5555,60);// 0 1 
        Corista corista5 = new Corista (7, "corista1",3333,90);// 1 0 
        Corista corista6 = new Corista (7, "corista2",5555,60);// 1 1 
        coroPorH1.agregarCorista(corista3);
        coroPorH1.agregarCorista(corista4);
        coroPorH1.agregarCorista(corista5);
        coroPorH1.agregarCorista(corista6);
        System.out.println(coroPorH1.estaLleno());
        
        
        
        // TODO code application logic here
    }
    
}
