% Decodage d'une image d'intensité JPEG SANS utiliser la table de
% quantification
%
% En entrée jobj est une structure comportant 14 champs décrivant l'image
% jpeg (non décodée)
%
%jobj.image_width,
%jobj.image_height,
%jobj.image_components,
%jobj.image_color_space,
%jobj.jpeg_components,
%jobj.jpeg_color_space,
%jobj.comments,
%jobj.coef_arrays,
%jobj.quant_tables,
%jobj.ac_huff_tables,
%jobj.dc_huff_tables,
%jobj.optimize_coding,
%jobj.comp_info,
%jobj.progressive_mode
%

jobj = jpeg_read('Images/Lena.jpg');
coefscell=jobj.coef_arrays;
coefs = coefscell{1,1}

indices = 1:8:512;
for i=indices
    for j=indices
        M=coefs(i:i+7,j:j+7);
        dec1(i:i+7,j:j+7)=ifft2(M);
    end;
end;

img = abs(dec1+255);
figure;
colormap(gray);
imagesc(img);