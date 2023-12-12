package practica.repaso.Eje2;

/**
 *
 * @author Gianca
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura,horaCierre;
    private Auto autos[][]; 
    private int cantPisos, cantPlazas;
    
    /*
    Un constructor debe recibir nombre y dirección, e iniciar el estacionamiento 
    con hora de apertura “8:00”, hora de cierre “21:00”, y para 5 pisos y 10 plazas 
    por piso. El estacionamiento inicialmente no tiene autos.
    */
    public Estacionamiento (String unNombre, String unaDireccion){
        this.setDireccion(unaDireccion);
        this.setNombre(unNombre);
        this.setHoraApertura("8:00");
        this.setHoraCierre("21:00");
        this.setCantPisos(5);
        this.setCantPlazas(10);
        autos = new Auto [5][10];
    }

    /*
    Otro constructor debe recibir nombre, dirección, hora de apertura, hora de 
    cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el 
    estacionamiento con los datos recibidos y sin autos.
    */
    
    public Estacionamiento (String unNombre, String unaDirec, String unaHoraApertura, String unaHoraCierre, int dimF_pisos, int dimF_plazas){
        this.setNombre(unNombre);
        this.setDireccion(unaDirec);
        this.setHoraApertura(unaHoraApertura);
        this.setHoraCierre(unaHoraCierre);
        this.setCantPisos(dimF_pisos);
        this.setCantPlazas(dimF_plazas);
        autos = new Auto [dimF_pisos][dimF_plazas];
    }
    
    private boolean lugarValido (int nroPiso, int nroPlaza){
        return ( (nroPiso < this.getCantPisos()) && (nroPlaza < this.getCantPlazas()) );
    }
    
    private boolean lugarDesocupado (int nroPiso, int nroPlaza){
        return autos[nroPiso] [nroPlaza] == null;
    }
    
    public void agregarAuto (Auto auto, int nroPiso, int nroPlaza){
        // Para que tengan el valor del indice.
        nroPiso--;
        nroPlaza--;
        
        if ( (this.lugarValido(nroPiso, nroPlaza)) && (this.lugarDesocupado(nroPiso, nroPlaza)) )  {
            autos[nroPiso][nroPlaza] = auto;
        }
        else{
            System.out.println("**ERROR. No es posible agregar el auto en el piso ("+(nroPiso+1)+ ") plaza ("+(nroPlaza+1)+")");
        }
    }
    
    private boolean coincidePatente (String patenteBuscada, String patenteActual){
        return ( patenteBuscada.equals(patenteActual));
    }
    
    private String lugarEstacionado (int plaza, int piso){
        return "El auto esta en el piso "+(piso+1)+ ".Plaza "+(plaza+1);
    }
    
    public String buscarAuto (String patenteBuscada){
        boolean encontre= false;
        int piso=0,plaza;
        String resultado="Auto Inexistente";  
        while ( (piso < this.getCantPisos()) && (encontre == false) ){
            plaza=0;
            while ( (plaza < this.getCantPlazas()) && (encontre == false ) ) {
                // IMPORTANTISIMO PREGUNTAR PRIMERO SI LA POSICION NO ES NULL, O SI ESTA OCUPADA
                // PORQUE ME TIRABA ERROR POR ACCEDER A UNA POS QUE ERA NULA 
                if ( (this.lugarDesocupado(piso, plaza) == false) && (coincidePatente(patenteBuscada,autos[piso][plaza].getPatente()) == true) ){
                    encontre=true;
                    resultado = this.lugarEstacionado(plaza, piso);
                }
                else{
                    plaza++;
                }    
            }
            piso++;
        }
        return resultado;
    }
    
    
    private String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    private void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    private String getHoraApertura() {
        return horaApertura;
    }

    private void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    private String getHoraCierre() {
        return horaCierre;
    }

    private void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }


    private int getCantPisos() {
        return cantPisos;
    }

    private void setCantPisos(int piso) {
        this.cantPisos = piso;
    }

    private int getCantPlazas() {
        return cantPlazas;
    }

    private void setCantPlazas(int plaza) {
        this.cantPlazas = plaza;
    }

    private String representacionEstacionamiento (){
        String devolver="";
        int cantPisos = this.getCantPisos();
        int cantPlazas = this.getCantPlazas();
        for (int pisos=0; pisos < cantPisos; pisos++){
            for (int plazas=0; plazas< cantPlazas; plazas++){
                devolver+= "Piso "+(pisos+1)+" Plaza "+(plazas+1)+": ";
                if (this.lugarDesocupado(pisos, plazas) == true ){
                    devolver+= "Libre \n";
                } 
                else {
                    devolver += autos[pisos][plazas].toString()+ " \n";
                }
            }
        }
        return devolver;
    }
    
    public int contarAutosEnPlaza (int nroPlaza){
        int cant=0;
        nroPlaza--; // para que corresponda con el indice
        for (int pisos=0; pisos< this.getCantPisos(); pisos++){
           if ( this.lugarDesocupado(pisos, nroPlaza) == false ){
               cant++;
           }
       }
       return cant;
    }
    
    
    public String toString (){
        String aux;
            aux=this.representacionEstacionamiento();
        return aux;
    }
    
    
    
}
