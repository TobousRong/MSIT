clc;clear;close all
ROI=textread('E:\Data\UCLA\AAL_ROI_list.txt','%s');
N_sub=18;width=20;
% myPool = parpool('local',24);
path='E:\wujing_lin\Out_data\AAL90\BOLD\sub';
for sub=1:N_sub;
    DataDir=strcat(path,int2str(sub),'_rest_fMRI.mat');
    load(char(DataDir));
    FC={};
    parfor t=1:150-width
        FC{t}=corr(BOLD(t:t+width,:));
    end
    filename =strcat('sub',int2str(sub),'_rest_dFC.mat');
    save(char(filename),'FC')
    %%%==============================================================
    DataDir=strcat(path,int2str(sub),'_msit_fMRI.mat');
    load(char(DataDir));
    BOLD(149:160,:)=[];
    BOLD(1:12,:)=[];
    FC={};
    parfor t=1:136-width
        FC{t}=corr(BOLD(t:t+width,:));
    end
    filename =strcat('sub',int2str(sub),'_msit_dFC.mat');
    save(char(filename),'FC')
end

