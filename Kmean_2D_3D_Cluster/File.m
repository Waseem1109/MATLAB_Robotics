clc
clear
Ndata= 100;
data=[];
for i=1:Ndata
    data=[data;randi([0 20],1,3)];
end
Ncluster=4;
result=Kmean_Cluster(data,Ncluster)