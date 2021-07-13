function [Hin,Hse,HF] =Balance(FC,N,Clus_size,Clus_num)  
FC=(FC+FC')/2;
FC(FC<0)=0;
[FEC FE]=eig(FC);
FE(FE<0)=0;
%%======================
p=zeros(1,N);
for i=1:length(find(Clus_num<1))
      p(i)=sum(abs(Clus_size{i}-1/Clus_num(i)))/N;
end
HF=fliplr(diag(FE)').*Clus_num.*(1-p);
Hin=sum(HF(1))/N; 
Hse=sum(HF(2:N))/N;
end

