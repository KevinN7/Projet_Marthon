% Verification de la relation de conjugaison
%

if all(abs(imfn(1,2 :1+ncol/2)-conj(imfn(1,ncol :-1 :1+ncol/2))) == zeros(1,ncol/2))
    disp('Relation de conjugaison verifiee sur (1,2 :1+ncol/2)');
else
    disp('ATTENTION Relation de conjugaison NON veriee sur (1,2 :1+ncol/2)');
end
%
if all(abs(imfn(2 :1+nlig/2,1)-conj(imfn(ncol :-1 :1+ncol/2,1))) == zeros(ncol/2,1))
    disp('Relation de conjugaison verifiee sur (2 :1+nlig/2,1)');
else
    disp('ATTENTION Relation de conjugaison NON veriee sur (2 :1+nlig/2,1)');
end
%
if all(abs(imfn(2 :1+nlig/2,2 :1+ncol/2)-conj(imfn(ncol :-1 :1+ncol/2,ncol :-1 :1+ncol/2))) == zeros(ncol/2,ncol/2))
    disp('Relation de conjugaison verifiee sur (2 :1+nlig/2,2 :1+ncol/2)');
else
    disp('ATTENTION Relation de conjugaison NON veriee sur (2 :1+nlig/2,2 :1+ncol/2)');
end
