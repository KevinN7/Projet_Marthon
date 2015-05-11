% Verification de la conservation de l'energie par fft2n

lecshowtrimago
%normalise
fft2n

if(norm(imfn-imn)<10^-6)
    disp('OK');
else
   disp('NOK');
end;