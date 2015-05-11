%% Affichage des principaux résultats de l'étude de la transformée de Fourier
%
xori = 0 ;
yori= 0 ;
h1 = figure ('BackingStore','on' ,'Color','k', 'Colormap',gray(256),...
'Name','Resultats sur l etude de la Transformee de Fourier','Units','pixels',...
'Position', [xori , yori , 2*ncol , 2*nlig ]) ;
%
a(1) = subplot(3,3,1) ;
image(ind2rgb(im,jet(256))) ;
%
a(2) = subplot(3,3,2) ;
imfa = abs(imf) ;
ecart_type=std(std(imfa)) ;
imfa = round((imfa/ecart_type)*256) ;
image(imfa) ;
%
a(3) = subplot(3,3,3) ;
imfa = abs(imfc) ;
ecart_type=std(std(imfa)) ;
imfa = round((imfa/ecart_type)*256) ;
image(imfa) ;
%
a(4) = subplot(3,3,4) ;
imagesc(mask) ;
%

a(5) = subplot(3,3,5) ;
image(ind2rgb(round(imc0),jet(256))) ;
%
a(6)= subplot(3,3,6) ;
image(ind2rgb(round(imc1),jet(256))) ;
%
sincos3 ; % calcule sin30 , cos30 et cosphi30 21
%
a(7) = subplot(3,3,7) ;
imagesc(sin30) ;
%
a(8) = subplot(3,3,8) ;
imagesc(cos30) ;
%
a(9) = subplot(3,3,9) ;
imagesc(cosphi30) ;
%
ht1 = title(a(1),'image initiale') ;
set(ht1,'Color','white') ;
ht2 = title(a(2),'TF') ;
set(ht2,'Color','white') ;
ht3 = title(a(3),'TF centrée') ;
set(ht3,'Color','white') ;
ht4 = title(a(4),'masque') ;
set(ht4,'Color','white') ;
ht5 = title(a(5),'compression par masque') ;
set(ht5,'Color','white') ;
ht6 = title(a(6),'compression optimale') ;
set(ht6,'Color','white') ;
ht7 = title(a(7),'sin(3,0)') ;
set(ht7,'Color','white') ;
ht8 = title(a(8),'cos(3,0)') ;
set(ht8,'Color','white') ;
ht9 = title(a(9),'cosinus phase (3,0)') ;
set(ht9,'Color','white') ;
%