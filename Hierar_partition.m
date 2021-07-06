clc;clear;close all
N=90;width=20;
% mypool=parpool('local',24,'IdleTimeout',240);
path='E:\wujing_lin\sub';
for sub=1:18
     DataDir=strcat(path,num2str(sub),'_rest_dFC.mat');
     load(char(DataDir));
     Clus_num={};Clus_size={};
     parfor t=1:150-width
        [C_num,C_size] = Functional_HP(FC{t},N);
        Clus_num{t}=C_num;
        Clus_size{t}=C_size;   
     end
    filename =strcat('sub',num2str(sub),'_rest_dClus.mat');
    save(char(filename),'Clus_num','Clus_size')
    %%%%======================================================================================
     DataDir=strcat(path,num2str(sub),'_msit_dFC.mat');
     load(char(DataDir));
     Clus_num={};Clus_size={};
      parfor t=1:136-width
        [C_num,C_size] = Functional_HP(FC{t},N);
        Clus_num{t}=C_num;
        Clus_size{t}=C_size;   
     end
    filename =strcat('sub',num2str(sub),'_msit_dClus.mat');
    save(char(filename),'Clus_num','Clus_size')
end
