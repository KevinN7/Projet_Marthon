% TP pour 2ème année info
% L'image Lena.jpg fait 43.169 octets
% L'image initiale non comprimée fait 512 x 512 = 262.144 octets
% Taux de compression = (43149 /262144) * 8 = 1,3174 bit par pixel
%
% Premier décodage de l'image JPEG : on utilise seulement la composante
% continue
% En entrée jobj est une structure comportant 14 champs décrivant l'image
% jpeg (non décodée) (jobj = jpeg_read(path))
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

%jobj = jpeg_read('Images/Lena.jpg');
load jobj;
coefscell=jobj.coef_arrays;
coefs = coefscell{1,1};
indices = 1:8:512;
for i=indices
    for j=indices
        dec0(i:i+7,j:j+7)= coefs(i,j)+128;
    end;
end;
%dec0 = coefs(indices,indices)
%img = abs(dec0+255);
figure;
colormap(gray);
imagesc(dec0);