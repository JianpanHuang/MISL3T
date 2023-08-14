%% This is a demo of drawing brain tissue ROI in this study
clc, clear all, close all;
addpath(genpath(pwd));

%% load data
data_path = 'Data';
load([data_path,filesep,'Fig4_MT_Low.mat'])

%% load csf roi for excluding
load([data_path, filesep, 'Demo_CSF.mat']);
roi_csf = roi;
clear roi;

%% draw roi of CSF
roi_name = 'Demo_MT';  % rename the roi name or delete the roi mat file to redraw
roi = draw_load_roi(data_path, img_m0, roi_name, 'polygon');
roi(roi_csf==1) = 0;
h = figure; scr_sz = get(0,'ScreenSize');
set(h,'Position',[scr_sz(3)*0.3, scr_sz(4)*0.3, scr_sz(3)*0.4, scr_sz(4)*0.6]); 
imagesc(img_m0); hold on; colormap("gray");
contour(roi,1,'m-','LineWidth',2);title('ROI of brain tissue');