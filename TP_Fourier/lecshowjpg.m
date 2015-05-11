% Lecture d'une image JPEG 
%

% Lecture d'une image JPEG
%
NOMFIC = uigetfile('Images/*.jpg') ;
%
NOMFIC = ['Images/' NOMFIC] ;
im = imread(NOMFIC) ;
pas = str2double(input('Pas dechantillonnage:','s')) ; % pas d'échantillonnage de im
im = double(im(1 :pas :end,1 :pas :end,1 :end)) ; %sous-échantillonnage de l'image et transformation en double
%
nlig = size(im,1) ;
ncol = size(im,2) ;
%
% Achage de l'image
him = figure ('Name','Image JPEG','Units','pixels') ;
if ismatrix(im)
% L'image JPEG est monochrome
typeimage = 'IMON' ;
ncan = 1 ;
colormap(gray(256)) ;
imshow(im,[0,255]) ;
else if ndims(im) == 3
% L'image JPEG est en couleur
typeimage = 'ITRI' ;
ncan = 3 ;

imshow(im/255) ;
else
disp('ERREUR') ;
end
end
