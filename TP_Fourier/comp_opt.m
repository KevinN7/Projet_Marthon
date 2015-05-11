% Compression par annulation des coefficients de Fourier de plus faibles poids
%

eps=10;

temp=imfc(:);
[V,I]=sort(abs(temp),'descend');
coeford = temp(I);

%h=zeros(nlig*ncol);
h=coeford;
h(1:end)=0;
i=1;
h(I(i)) = temp(I(i));
comp = ifft2(reshape(h,nlig,ncol));
erreur = abs(norm(im)-norm(comp));

figure;
colormap(gray);
while(erreur>eps)
    i=i+1;
    h(I(i)) = temp(I(i));
    
    comp = abs(ifft2(reshape(h,nlig,ncol)));
    %imagesc(comp);
    erreur = abs(norm(im-comp));
end;
imagesc(comp);
i
