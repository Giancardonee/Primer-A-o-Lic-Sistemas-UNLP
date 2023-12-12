package practica.repaso.Eje3;
/**
 *
 * @author Gianca
 */
public class Evento_Ocasional extends Recital{
    private String motivo;
    private String nombreContratante; 
    private String diaEvento; 
    
    public Evento_Ocasional (String nombreBanda, int cantTemas,String unDiaEvento, String unMotivo, String unNombreContratante){ 
        super(nombreBanda,cantTemas);
        this.setDiaEvento(unDiaEvento);
        this.setMotivo(unMotivo);
        this.setNombreContratante(unNombreContratante);
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public String getDiaEvento() {
        return diaEvento;
    }

    public void setDiaEvento(String diaEvento) {
        this.diaEvento = diaEvento;
    }
    
    private String msjShowBeneficiencia (){
        return "Recuerden colabirar con... "+this.getNombreContratante();
    }
    
    private String msjShowTv (){
        return "Saludos amigos televidentes"; 
    }
    
    private String msjShowPrivado (){
        return "Un feliz cumpleaños para... "+this.getNombreContratante();
    }
    
    private String buscarMsjEvento (String motivo){
        motivo.toLowerCase();
        String mensaje="#####";
        if (motivo.equals("show de beneficiencia")){
            mensaje = this.msjShowBeneficiencia();
        }
        else if (motivo.equals("show de tv")) {
            mensaje = this.msjShowTv();
        }
        else if (motivo.equals("show privado")){
            mensaje = this.msjShowPrivado();
        }
        return mensaje;
    }
    
    @Override  
    public double calcularCosto (){
        double gasto=0;
        String motivo = this.getMotivo().toLowerCase();
        if (motivo.equals("show de beneficiencia")){
            gasto=0;
        }
        else if (motivo.equals("show de tv")){
            gasto = 50000;
        }
        else if (motivo.equals("show privado")){
            gasto = 150000;
        }
        return gasto;
    }
    
    @Override
    public void actuar (){
        System.out.println(this.buscarMsjEvento(this.getMotivo()));
        super.actuar();
    }   
    
    
}
