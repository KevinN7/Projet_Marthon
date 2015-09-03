% Comparaisons compressions 0 et opt
%
%% Compression par annulation des coecients de Fourier de plus faibles poids (compression opt)
%
imfc1 = imf ;
energie = norm(imf,'fro')^2 ; % somme des modules au carre des coecients de Fourier non normalises
pourcentage = str2double(input('pourcentage de conservation de l energie de l image :','s')) ;
seuilerreur = (1 - pourcentage/100)*energie ;
%
[imftri,index] = sort(abs(imf( :))) ; % on trie les modules des coecients par ordre croissant
%
% attention sort(imf( :)) est erronné car on trie alors selon la partie
% réelle (cf. doc)

%
erreur2 = 0 ;
i = 1;
erreur2 = erreur2 + abs(imftri(i))^2 ;
while erreur2 <= seuilerreur
k=rem(index(i)-1,nlig)+1 ;
l=floor((index(i)-1)/ncol)+1 ;
imfc1(k,l)=0 ;
i=i+1 ;
erreur2=erreur2 + abs(imftri(i))^2 ;
end
nombrea0=i-1 ; % nombre de coecients mis a 0
cprintf('blue',['Nombre de cofficients mis a 0 : ',num2str(nombrea0)]) ;
disp(' ') ;
pourcent0 = 100*nombrea0/(nlig*ncol) ;
cprintf('blue',['Pourcentage de cofficients mis a 0 : ',num2str(pourcent0)]) ;
disp(' ') ;
%
imc1 = ifft2(imfc1) ;
imc1 = abs(imc1) ; % imc1 est l'image comprimée par annulation des coecients de plus faibles poids
%
%% Compression par annulation des coecients de hautes fréquences spatiales (compression 0)
% Construction du masque
hauteur = round(sqrt(nlig*ncol - nombrea0)) ;
largeur = hauteur ;

    l = zeros(nlig,1);
    c = zeros(ncol,1);

    l(floor(nlig/2)-floor(hauteur/2)+1:floor(nlig/2)+floor(hauteur/2))=1;
    c(floor(ncol/2)-floor(hauteur/2)+1:floor(ncol/2)+floor(hauteur/2))=1;

mask = l*c' ;
% Visualisation du masque
xori = (9*ncol)/4 ;
yori = 0 ;
hmask = figure ('BackingStore', 'on' ,'Color','k','Colormap',gray(256),...
'Name','Masque','Units','pixels',...
'Position', [xori , yori , ncol , nlig ]);
imagesc(mask) ;
%
% Filtrage par le masque mask : les coecients en dehors du masque sont
% mis a 0.
%
imfc0=imfc.*mask ; % imfc est la transformee de Fourier centree
%
imc0 = ifft2(imfc0) ;
imc0 = abs(imc0) ; % imc0 est l'image comprimee par annulation des coecients de hautes frequences spatiales
%
%% Achage des deux images comprimees au meme taux (meme nombre de coécients de Fourier mis a 0)
xori = 0 ;
yori=0 ;
h2 = figure ('BackingStore','on' ,'Color','k','Colormap',gray(256),...
'Name',['imc0 et imc1 nombre de 0 : ',num2str(nombrea0)],'Units','pixels',...
'Position', [xori , yori , round(2.8*ncol) , nlig ]) ;

subplot(1,2,1) ;
imagesc(imc0) ;
subplot(1,2,2) ;
imagesc(imc1) ;


