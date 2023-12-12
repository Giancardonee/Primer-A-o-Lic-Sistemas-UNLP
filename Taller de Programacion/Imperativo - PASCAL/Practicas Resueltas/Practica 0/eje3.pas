program eje3; 
const
	cantProductos = 1000;
type
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	
	rDispone = record
		stock : integer;
		precio: real;
	end;
	
	vDispone = array [1..cantProductos] of rDispone; 
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	
	producto = record
		codProducto: 1..cantProductos;
		unidadesSolicitadas: integer;
	end;
	
	productosVendidos = record
		codProducto : 1..cantProductos;
		unidadesVendidas : integer;
		precioUnitario : real; 
	end;

	listaProductosV = ^nodoP;
	
	nodoP = record
		dato : productosVendidos;
		sig : listaProductosV;
	end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -	
	rTicket = record
		codVenta : integer;
		detalle : listaProductosV; 
		montoTotal : real;
	end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	ventas = record
		codVenta: integer;
		ticket : rTicket;
	end;
	
	listaVentas = ^nodoV;
	nodoV = record
		dato : ventas;
		sig : listaVentas;
	end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	{modulos}
	
procedure inicializarListaV (var listaV : listaVentas); 
begin
	listaV:= nil;
end;	
	
procedure inicializarListaP (var listaP : listaProductosV); 
begin
	listaP:= nil; 
end;	
	
procedure ingresarCodVenta (var codVenta : integer); 
begin
		write ('Ingrese el codigo de venta: ');
		readln (codVenta); 
end;
	
procedure leerProducto (var p : producto); 
begin
	write ('Ingrese las unidades solicitadas: '); 
	readln (p.unidadesSolicitadas);
	if (p.unidadesSolicitadas >0) then 
		begin
				write ('Ingrese el codigo del producto (entre 1 y 100): '); 
				readln (p.codProducto);
		end; 
end;	
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


function hayStock (p : producto; vD : vDispone): boolean;
var
	ok : boolean;
begin
		if (vD[p.codProducto].stock <= p.unidadesSolicitadas) then 
			ok:= True
		else 
			ok:= False ;
		hayStock:= ok;	
end;

procedure restarStock (var vD : vDispone; p : productosVendidos);
begin
		vD[p.codProducto].stock:= vD[p.codProducto].stock - p.unidadesVendidas;
end;

procedure agregarVenta (var pI : listaVentas; dato : ventas);
var
	nuevo : listaVentas; 
begin
	new (nuevo);
	nuevo^.dato:= dato;
	nuevo^.sig:= pI;
	pI:= nuevo;
end;


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure agregarProductos (var pI: listaProductosV; dato : productosVendidos); 
var
	nuevo : listaProductosV; 
begin
	new (nuevo);
	nuevo^.dato:= dato;
	nuevo^.sig:= pI;
	pI:= nuevo; 
end;

procedure asignarDetalles (var prodV : productosVendidos; precio : real; p : producto); 
begin
		prodV.codProducto:= p.codProducto; 
		prodV.unidadesVendidas:= p.unidadesSolicitadas;
		prodV.precioUnitario:= precio;
end; 

procedure asignarDetalles2 (var prodV : productosVendidos; precio : real; codProducto : integer; stock : integer); 
begin
	prodV.codProducto:= codProducto;
	prodV.unidadesVendidas:= stock;
	prodV.precioUnitario:= precio; 
end;

procedure procesarVenta (var listaP : listaProductosV; var vD : vDispone; p : producto; pV : productosVendidos); 
begin
	asignarDetalles(pV,vD[p.codProducto].precio,p);
	agregarProductos(listaP,pV); 
	restarStock(vD,pV); 
end;

function stockMax(vD : vDispone; codProducto : integer) : integer;
begin
	stockMax:= vD[codProducto].stock;
end;

procedure cheaquearStock (var listaP : listaProductosV; var vD : vDispone; p : producto ; pV : productosVendidos); 
var
	stock : integer;
begin
	if (vD[p.codProducto].stock > 0) then 
		begin
					stock:= stockMax (vD,p.codProducto); 
					asignarDetalles2(pV,vD[p.codProducto].precio,p.codProducto,stock); 
					restarStock(vD,pV); 
		end; 
end;


procedure cargarVentas (var pI : listaVentas; var vD : vDispone); 
var
	codVenta: integer;
	p: producto;
	pV : productosVendidos; 
begin
	ingresarCodVenta (codVenta);
		while (codVenta <> -1) do 
			begin
				leerProducto(p); 
					while (( codVenta<>-1) and (p.unidadesSolicitadas > 0) ) do 
						begin
									if (hayStock (p,vD)) then 
									begin
											
											procesarVenta (listaVentas,vD, p, pV);
									end
									else 								
										chequearStock (listaProductos, vD, p, pV);
								leerProducto(p); 
						end;
					agregarVenta (pI,p^.elem); 
			ingresarCodVenta (codVenta);
			end;
end;



{programa principal}
var
	ListaProductos : listaProductosV;
	ListaVentas : listaVentas; 
	vD : vDispone;
begin
	inicializarListaP(ListaProductos); 
	inicializarListaV(ListaVentas);
	cargarVentas (ListaVentas, vD); 
end.














