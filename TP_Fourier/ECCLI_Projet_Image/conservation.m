% Verification de la conservation de l'energie par fft2n

lecshowtrimago
normalise
fft2n

%if(norm(imfn-imn,'fro')<10^-6)
e1=sum(sum(imfn.^2));
e2=sum(sum(imn.^2));
if(abs(e1-e2)<10^-6)
    disp('OK');
else
   disp('NOK');
end;