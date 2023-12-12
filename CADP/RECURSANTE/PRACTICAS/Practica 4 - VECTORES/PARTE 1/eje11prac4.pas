{ 11 El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics
 y cantidad de comentarios de usuarios. Realizar un programa que lea y almacene esta información.
  Una vez finalizada la lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

program once; 
const 
    cantFotos = 5; {poner 200 para que vaya acorde al enunciado}
type
    str20 = string[20];
    foto = record
        Titulo : str20;
        Autor : str20;  
        cantMG : integer;
        cantClicks : integer;
        cantComentarios: integer; 
    end;     
vFotos = array [1..cantFotos] of foto;

procedure cargarVector (var v : vFotos);
var
i:integer;
begin
    for i:= 1 to cantFotos do 
        begin
          write('Ingrese el titulo de la foto: '); readln(v[i].Titulo);
          write('Ingrese el autor de la foto: '); readln(v[i].Autor);
          write('Ingrese la cantidad de Likes / Me gusta: '); readln(v[i].cantMG);
          write('Ingrese la cantidad de clicks: '); readln(v[i].cantClicks);
          write('Ingrese la cantiad de comentarios: '); readln(v[i].cantComentarios); 
        end;
end;

function esAutorVandelay (nombreAutor:str20):boolean; 
begin
  esAutorVandelay:= (nombreAutor = 'Art Vandelay'); 
end;

procedure recorrerVector (v : vFotos); 
var
Titulo_ft_MasVista : str20; 
cantMgVandelay,i,maxClicks : integer;
begin
  maxClicks:= -1 ;
  Titulo_ft_MasVista:='...'; 
  cantMgVandelay:= 0;
    for i:= 1 to cantFotos do 
        begin
            if (v[i].cantClicks > maxClicks) then 
                begin
                    maxClicks:= v[i].cantClicks;
                    Titulo_ft_MasVista:= v[i].Titulo;  
                end;
            if (esAutorVandelay(v[i].Autor)) then
                    cantMgVandelay:= cantMgVandelay + v[i].cantMG;           
            writeln('La foto ',i, ' tiene ',v[i].cantComentarios, ' comentarios');
        end;
    writeln ('El titulo de la foto mas vista es: ',Titulo_ft_MasVista);
    writeln ('La cantidad total de Me gusta a las fotos del autor Art Vandelay son:',cantMgVandelay);
end;

var
v:vFotos; 
begin
cargarVector(v);
recorrerVector(v); 
end.