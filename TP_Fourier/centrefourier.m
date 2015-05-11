imfc = fftshift(imf);

%imfnca=imfca/norm(imfca);

figure;
imagesc(abs(imfc));

imtilde = ifft2(imfc);   

figure;
colormap(gray);
imagesc(abs(imtilde));