clc, clear all, close all;
addpath(genpath(pwd));

%% load data
load("Data/Fig5_MISL_TGN.mat")
for m = 1:size(img_misl,3)
    img_temp = img_misl(:,:,m);
    roi_temp = roi(:,:,m);
    dynamic(m) = mean(img_temp(roi_temp==1));
end

%% maps to display
disp_xrg = 6:60;
disp_yrg = 11:86;
img_base = mean(img_misl(disp_xrg,disp_yrg,1:2),3).*double(roi(disp_xrg,disp_yrg,1));
img_28min = img_misl(disp_xrg,disp_yrg,9).*double(roi(disp_xrg,disp_yrg,9));
img_60min = img_misl(disp_xrg,disp_yrg,17).*double(roi(disp_xrg,disp_yrg,17));
img_all = [img_base,img_28min,img_60min];

%% display dynamic curve and maps
t = -4:4:60; % in min
figure,set(gcf,'unit','normalized','position',[0.15,0.4,0.8,0.2],'color','w');
subplot(1,2,1),plot(t, dynamic,'-o',LineWidth=2,MarkerSize=8); set(gca,'fontsize',18);
xlabel("t (min)"); ylabel("MT"); xlim([min(t),max(t)]); ylim([0.1,0.3]);
subplot(1,2,2),imagesc(img_all); colorbar; caxis([0,0.3]); mycolormap(1);axis off; set(gca,'fontsize',18);


