clear all, close all;
addpath(genpath(pwd));

%% load data
% lower signal
load('Data/Fig4_MT_Low.mat');
roi1 = roi;
img1 = img_mt.*roi1;
clear img roi;
% higher signal
load('Data/Fig4_MT_High.mat');
roi2 = roi;
img2 = img_mt.*roi2;
clear img roi;

%% display results
disp_xrg = 7:61;
disp_yrg = 11:86;
img = [img1(disp_xrg-1,disp_yrg), img2(disp_xrg-1,disp_yrg)];
scrsz = get(0,'ScreenSize');
figure('Position',[scrsz(3)*0.2, scrsz(4)*0.4, scrsz(3)*0.5, scrsz(4)*0.25]);
imagesc(img), axis off; clim([0,0.6]), mycolormap(1);
colorbar('FontName','Arial','FontSize', 25, 'LineWidth', 3);


