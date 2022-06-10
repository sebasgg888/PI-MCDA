clear all
clc

%% Análisis de la distancia entre las imágenes generadas por cada modelo y
 % la clasificación del QP

 % Las normas usadas fueron la 1,2, infinito y la distancia de Frobenius

%PREPARACION DE IMAGENES
QP_or = imread('QP.png');  % importar (imagen a color)
QP_gris = rgb2gray(QP_or);  % fotografia en escala de grises (0-255)
QP = im2double(QP_gris); % conversion a double para operar con las fotografias
%------
Logit_or = imread('Logit.png'); 
Logit_gris = rgb2gray(Logit_or); 
Logit = im2double(Logit_gris);
%-------------
KNN_or = imread('KNN.png'); 
KNN_gris = rgb2gray(KNN_or); 
KNN = im2double(KNN_gris);
%-------------

DT_or = imread('DT_KNN.png'); 
DT_gris = rgb2gray(DT_or); 
DT = im2double(DT_gris);

%-------------

KNN_DT_or = imread('KNN_DT_Final.png'); 
KNN_DT_gris = rgb2gray(KNN_DT_or); 
KNN_DT = im2double(KNN_DT_gris);

%ESCOGER DIMENSION DE REFERENCIA DE IMAGENES Y CONVERTIR LAS RESTANTES

sizeref=size(QP);

%%

QP_final = imresize(QP,[sizeref(1,1) sizeref(1,2)]);
%-----
Logit_final = imresize(Logit,[sizeref(1,1) sizeref(1,2)]);
%-----
KNN_final = imresize(KNN,[sizeref(1,1) sizeref(1,2)]);
%-----
DT_final = imresize(DT,[sizeref(1,1) sizeref(1,2)]);

KNN_DT_final= imresize(KNN_DT,[sizeref(1,1) sizeref(1,2)]);

%%

% QP - Logit
resQP_logit=QP_final-Logit_final;
QP_logit=[norm(resQP_logit,1);norm(resQP_logit, 2);norm(resQP_logit, inf);norm(resQP_logit, 'fro')]; %Vector de resultado de normas

% QP - KNN
resQP_KNN=QP_final-KNN_final;
QP_KNN=[norm(resQP_KNN,1);norm(resQP_KNN, 2);norm(resQP_KNN, inf);norm(resQP_KNN, 'fro')]; %Vector de resultado de normas

% QP - DT
resQP_DT=QP_final-DT_final;
QP_DT=[norm(resQP_DT,1);norm(resQP_DT, 2);norm(resQP_DT, inf);norm(resQP_DT, 'fro')]; %Vector de resultado de normas

% KNN - DT
resKNN_DT=KNN_final-DT_final;
KNN_DT=[norm(resKNN_DT,1);norm(resKNN_DT, 2);norm(resKNN_DT, inf);norm(resKNN_DT, 'fro')]; %Vector de resultado de normas

% KNN - DT_Final

resKNN_DT_30=QP_final-KNN_DT_final;
QP_KNN_DT_30=[norm(resKNN_DT_30,1);norm(resKNN_DT_30, 2);norm(resKNN_DT_30, inf);norm(resKNN_DT_30, 'fro')]; %Vector de resultado de normas

% Ver las distancias entre las imagenes

QP_KNN
QP_DT
QP_logit
KNN_DT
QP_KNN_DT_30
