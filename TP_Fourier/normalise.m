% Normalisation de l'image:
%  Moyenne des niveaux de gris = 0
%  Energie = 1

A=im;
[i,j,~]=size(A);

A = A - repmat(mean(mean(A)),i,j);
%B=A.^2;
%energie = sum(sum(B));
energie = norm(A,'fro')^2 ;
imn=A/energie;
%imn(:,:) = A(:,:)/energie;

