clc;clear;close all
N_sub=18;N=90;Total=136;width=20;
Z=[];
group={'rest','msit'};
for g=1:2
    for sub=1:18
    DataDir=strcat('sub',num2str(sub),'_',group{g},'_dFC.mat');
    load(char(DataDir));
    path=strcat('sub',num2str(sub),'_',group{g},'_dClus.mat');
    load(char(path));
    IN=[];IM=[];
    parfor t=1:Total-width
         fc=FC{t};
         fc(fc<0)=0;
         fc=(fc+fc')/2;
         [Hin,Hse,HF] =Balance(FC{t},N,Clus_size{t},Clus_num{t});
         [FEC FE]=eig(fc);
         H1=(diag(HF)*flipud((FEC.^2)'));
         Hin=H1(1,:);
         Hse=sum(H1(2:N,:));
         IN=[IN;Hin];IM=[IM;Hse];
    end
     filename =strcat('sub',num2str(sub),'_',group{g},'_region_HF.mat');
     save(char(filename),'IN','IM')
    end
end
