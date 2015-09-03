
%tr=zeros
img=imresize(im,0.5);

[nlig2,ncol2] = size(img);
tr=zeros(nlig2,ncol2);
for u=1:nlig2
    u/nlig2
    for v=1:ncol2
        pulsationc=(2*pi)/u;
        pulsations=(2*pi)/v;
        for h=1:nlig2
            for j=1:ncol2
                tr(u,v) = tr(u,v) + img(h,j)*(cos(pulsationc*h)+i*sin( pulsations*j));
            end;
        end;
    end;
end;

figure;

imagesc(abs(tr));