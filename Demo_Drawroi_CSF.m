%% This is a demo of drawing CSF ROI in this study
clc, clear all, close all;
addpath(genpath(pwd));

%% load data
data_path = 'Data';
load([data_path,filesep,'Fig4_MISL_Low.mat'])

%% draw roi of CSF
roi_name = 'Demo_CSF'; % rename the roi name or delete the roi mat file to redraw
bcg_thres = 1.5;
roi = draw_load_roi(data_path, img_m0, roi_name, 'free', bcg_thres);
h = figure; scr_sz = get(0,'ScreenSize');
set(h,'Position',[scr_sz(3)*0.3, scr_sz(4)*0.3, scr_sz(3)*0.4, scr_sz(4)*0.6]); 
imagesc(img_m0); hold on; colormap("gray");
contour(roi,1,'m-','LineWidth',2);title('ROI of CSF')