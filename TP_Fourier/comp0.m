% Compression par annulation des coefficients de hautes fréquences
% spatiales
% Construction du masque

figure;
for tmask=1:min(nlig,ncol)
    l = zeros(nlig,1);
    c = zeros(ncol,1);

    l(floor(nlig/2)-tmask+1:floor(nlig/2)+tmask)=1;
    c(floor(ncol/2)-tmask+1:floor(ncol/2)+tmask)=1;

    mask = l*c';

    imfc0 = mask.*imfc;
    subplot(1,2,1);
    imagesc(abs(imfc0));
    subplot(1,2,2);
    colormap(gray);
    imagesc(abs(ifft2(imfc0)));
    pause
end;