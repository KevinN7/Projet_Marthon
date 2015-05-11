% Calcul et affichage d'une image de base reelle de la transformee de
% Fourier d'une image reelle
% on supose que nlig == ncol ! !
%
rep='t' ;
n = nlig ;
while rep == 's' && rep == 'c'
    rep = input ('Desirez-vous afficher un sinus ou un cosinus (s/c) ?', 's') ;
end
u = str2double(input ('n * frequence en x ? ','s')) ;
v = str2double(input ('n * frequence en y ? ','s')) ;
%
% mise a zero de imf
basef = zeros(n,n) ;
%
if rep == 'c'
    if u == 0 && v == 0
        basef(u+1,v+1)= ' ? ?' ;
        basef(n+1-u,n+1-v)= ' ? ?' ;
    elseif u == 0
        basef(1,v+1)= ' ? ?' ;
        basef(1, n+1-v)= ' ? ?' ;
    else
        basef(u+1,1)= ' ? ?' ;
        basef(n+1-u,1)= ' ? ?' ;
    end
else
    %rep == 's'

    if u == 0 && v == 0
        basef(u+1,v+1)= ' ? ?' ;
        basef(n+1-u,n+1-v)= ' ? ?' ;
    elseif u == 0
        basef(1,v+1)= ' ? ?' ;
        basef(1, n+1-v)= ' ? ?' ;
    else
        basef(u+1,1)= ' ? ?' ;
        basef(n+1-u,1)= ' ? ?' ;
    end
end
%
base=ifft2(basef)*n ;
base = 10000 * real(base) ;
base = base -min(base( :)) ;
%
map = exp(1.*gray(63))-1 ;
map = map/max(max(map)) ;
hbase = figure('BackingStore','on','Colormap', map, 'Units', 'pixels') ;
imagesc(base) ;
axis('square') ;
% Tracer un prol ligne de base
profimfunct(base) ;

