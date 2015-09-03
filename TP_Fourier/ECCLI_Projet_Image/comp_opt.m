% Compression par annulation des coefficients de Fourier de plus faibles poids
%

imfc1 = imf ;
energie = norm(imf,'fro')^2 ; % somme des modules au carre des coecients de Fourier non normalises
pourcentage = str2double(input('pourcentage de conservation de l energie de l image :','s')) ;
seuilerreur = (1 - pourcentage/100)*energie ;
[imftri,index] = sort(abs(imf( :))) ; % on trie les modules des coecients par ordre croissant


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
cprintf('blue',['Nombre de coecients mis a 0 : ',num2str(nombrea0)]) ;
disp(' ') ;
pourcent0 = 100*nombrea0/(nlig*ncol) ;
cprintf('blue',['Pourcentage de coecients mis a 0 : ',num2str(pourcent0)]) ;
disp(' ') ;
imc1 = ifft2(imfc1) ;
imc1 = abs(imc1) ; % imc1 est l'image comprimée par annulation des coecients de plus faibles poids

figure;
colormap(gray);
imagesc(imc1) ;




% eps=10;
% 
% temp=imfc(:);
% [V,I]=sort(abs(temp),'descend');
% coeford = temp(I);
% 
% %h=zeros(nlig*ncol);
% h=coeford;
% h(1:end)=0;
% i=1;
% h(I(i)) = temp(I(i));
% comp = ifft2(reshape(h,nlig,ncol));
% erreur = abs(norm(im)-norm(comp));
% 
% figure;
% colormap(gray);
% while(erreur>eps)
%     i=i+1;
%     h(I(i)) = temp(I(i));
%     
%     comp = abs(ifft2(reshape(h,nlig,ncol)));
%     %imagesc(comp);
%     erreur = abs(norm(im-comp));
% end;
% imagesc(comp);
% i
