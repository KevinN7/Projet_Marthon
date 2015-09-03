% Normalisation de l'image:
%  Moyenne des niveaux de gris = 0
%  Energie = 1

A=im;
imn=A;
[i,j,ncan]=size(A);

for p=1:ncan
    %moyenne nvg = 0
    A(:,:,p) = A(:,:,p) - repmat(mean(mean(A(:,:,p))),i,j,1);
    
    B=A(:,:,p).^2;
    energie = sum(sum(B));
    %energie = norm(A(:,:,p),'fro')^2 ;
    imn(:,:,p)=A(:,:,p)/sqrt(energie);
end;



