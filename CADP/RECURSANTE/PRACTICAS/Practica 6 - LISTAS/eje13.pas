{
13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada
usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y
cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la
revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden
ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.
}

program eje13; 
const 
	cantUsuarios = 6; {poner 3600 para que vaya acorde al enunciado}
	cantRoles = 4; 
type
	rangoRol = 1..4; 
	str25  =  string[25]; 
	usuario = record
			email : str25; 
			rol : rangoRol; 
			revista : str25; 
			DiasUltAcceso : integer; 
	end; 
	
	 { revistaEconomica = record 
			email : str25; 
			DiasUltAcceso : integer; 
	end; } 
	 
	listaEconomica = ^nodo; 
	nodo = record
			//elemento: revistaEconomica; 
			elemento : usuario; 
			siguiente : listaEconomica; 
	end; 
	
	vUsuarios = array [1..cantUsuarios] of usuario; 
	vContador = array [1..cantRoles] of integer; 
	
	procedure LeerUsuario (var u : usuario); 
	begin
		write ('Ingrese el email: '); readln (u.email);
		write ('Ingrese el rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector):  '); readln (u.rol); 
		write ('Ingrese la revista en la que participa: '); readln (u.revista); 
		write ('Ingrese la cantidad de dias desde el ultimo acceso: '); readln (u.DiasUltAcceso);  
		writeln;  
	end; 
	
	procedure cargarVectorUser (var v: vUsuarios); 
	var
		user : usuario; 
		i : integer; 
	begin
			for i:= 1 to cantUsuarios do 
				begin
					LeerUsuario(user); 
					v[i]:= user; 
				end; 	
	end; 

	procedure inicializar_vContador ( var v : vContador); 
	var
		i : integer; 
	begin
		for i := 1 to cantRoles do 
			v[i]:= 0; 
	end; 

	function esRevistaEconomica (revista : str25): boolean; 
	begin
		esRevistaEconomica:= (revista = 'economica'); 
	end; 
	
	procedure crearListaEconomica (var pI : listaEconomica); 
	begin
		pI:= nil; 
	end; 

	procedure insertarOrdenado (var pI : listaEconomica; user: usuario); 
	var
		nuevo , anterior, actual : listaEconomica; 
	begin
		new (nuevo); 
		nuevo^.elemento:= user; 
		//nuevo^.siguiente:= nil; 
		actual:= pI; 
		anterior:= pI; 
		while ( (actual <> nil) and (user.DiasUltAcceso > pI^.elemento.DiasUltAcceso) ) do 
			begin
				anterior:= actual; 
				actual:= actual^.siguiente;
			end; 
					if (actual = pI) then
						pI:= nuevo
					else
						anterior^.siguiente:= nuevo;
				nuevo^.siguiente:= actual;  
end; 
	
	{ c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal. }
	procedure calcularDosMax (email : str25; diasAcceso: integer; var max1,max2 : integer; var email1,email2 : str25); 
	begin
			if (diasAcceso > max1) then 
				begin
					max2:= max1; 
					max1:= diasAcceso; 
					email2:= email1; 
					email1:= email; 
				end
			else
				if (diasAcceso > max2) then 
				begin
					max2:= diasAcceso; 
					email2:= email; 
				end ; 
	end; 
	
	
procedure procesarVector ( v : vUsuarios; var vCont : vContador; var listaEco: listaEconomica); 
var
	pos : integer; 
	max1,max2: integer; 
	email1,email2 : str25;
	user : usuario; 
begin
	max1:= -1; max2:= -1; 
	email1:= ' ' ; email2:= ' ' ; 
	pos:= 1; 
	while (pos <= cantUsuarios) do 
		begin
			user:= v[pos]; 
			
			{si es revista Economica, debo insertarlo de forma ordenada en una lista}
				if (esRevistaEconomica(user.revista)) then 
						insertarOrdenado(listaEco,user); 
		
			{incremento el rol por cada revista}
			vCont[user.rol] := vCont[user.rol] + 1;  
			
			{calculo los 2 email con usuarios mas dias del ult acceso}
			calcularDosMax(user.email,user.DiasUltAcceso,max1,max2,email1,email2); 
			
			pos:= pos + 1; {avanzo de posicion }
		end; 
		writeln  ('El emal de los dos usuarios con mas dias desde el ultimo acceso son: '); 
			writeln ('- ->  ',email1); 
			writeln ('- -> ',email2); 
			writeln; // salto de linea 
end;  
	
	procedure mostrarCantRoles ( v : vContador); 
	var 
		i : integer;
	begin 
			writeln (' - - - -> La cantidad de usuarios por cada rol son: '); 
			for i:= 1 to cantRoles do 
				begin
					writeln ('Del rol ',i, ' se leyeron ',v[i], ' usuarios. ' ); 
				
				end;
	end; 
	
	
	procedure imprimirListaEco ( pI : listaEconomica); 
	begin
		writeln ('Usuarios de la revista Economica: '); 
		writeln(' * - - - - - - - - - - - - - - - - - - - - - - - - * '); 
		while (pI <> nil) do 
			begin 
					writeln ('-- ',pI^.elemento.email); 
					writeln ('Su ultima conexion fue hace ',pI^.elemento.DiasUltAcceso, ' dias.'  ); 
					writeln ;  //salto de linea
				pi:= pI^.siguiente; 
			end; 
	end; 
	
{programa principal}
var 
	vUser : vUsuarios;
	vCont : vContador; 
	listaEco : listaEconomica; 
begin
	inicializar_vContador(vCont); 
	cargarVectorUser(vUser); 
	crearListaEconomica(listaEco); 
	procesarVector (vUser,vCont,listaEco); { aca proceso todo, y se encuentra el inciso c} 
	imprimirListaEco(listaEco);  {inciso a} 
	mostrarCantRoles(vCont);  {inciso b}
end.
