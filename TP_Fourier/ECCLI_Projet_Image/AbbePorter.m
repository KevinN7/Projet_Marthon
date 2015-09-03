% 1. Lecture du chier grillec.tri
% 2. Calcul de la transform�e de Fourier centr�e
% 3. Construction d'une fente horizontale de hauteur 10 pixels et de largeur 250 pixels (par exemple)
% 4. Filtrage par la fente horizontale : les coecients de Fourier en dehors de la fente sont mis � 0
% 5. Calcul de l'image ltr�e
% 6. Rotation de 90de la fente pour la rendre verticale
% 7. Filtrage par la fente verticale
% 8. Calcul de l'image ltr�e
% 9. Achage des r�sultats de l'exp�rience dans une m�me gure avec de haut en bas et de gauche � droite :
% (a) Affichage de l'image de la grille
% (b) Affichage des intensit�s (amplitudes au carr�) des coecients de Fourier
% (c) Affichage de l'image ltr�e par la fente horizontale
% (d) Affichage du spectre de la grille ltr�e par la fente horizontale
% (e) Affichage de l'image ltr�e par la fente verticale
% (f) Affichage du spectre de la grille ltr�e par la fente verticale


lecshowtrimago
fft2n
imfc = fftshift(imf);

fentehoriz = zeros(nlig,ncol);
h=10;
l=250;
fentehoriz(floor(nlig/2)-(h/2):floor(nlig/2)+(h/2),floor(ncol/2)-(l/2):floor(ncol/2)+(l/2)) =1;
imffiltre = imfc.*fentehoriz;

imfiltre = abs(ifft2(imffiltre));


fenteverti = fentehoriz';
imffiltre2 = imfc.*fenteverti;

imfiltre2 = abs(ifft2(imffiltre2));


subplot(2,3,1);
imagesc(im);
subplot(2,3,2);
colormap(hot);
imagesc(abs(imfc).^1);
subplot(2,3,3);
colormap(gray);
imagesc(abs(imfiltre));
subplot(2,3,4);
imagesc(abs(imffiltre));
subplot(2,3,5);
colormap(gray);
imagesc(imfiltre2);
subplot(2,3,6);
colormap(hot);
imagesc(abs(imffiltre2));
