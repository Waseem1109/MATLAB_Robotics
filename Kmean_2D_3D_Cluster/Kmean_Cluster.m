function result=Kmean_Cluster(data,Ncluster)
result=[data randi([1 Ncluster],length(data(:,1)),1)];
c=hsv(Ncluster);
dataAxis=length(data(1,:));
means=ones(Ncluster,dataAxis);
while 1
    Update=0;
    hold off
    for i=1:Ncluster
        data_A=result((result(:,dataAxis+1)==i),1:dataAxis);
        means(i,:)=mean(data_A);
        if dataAxis==2
            plot(data_A(:,1),data_A(:,2),'+','Color',c(i,:));
            hold on
            plot(means(i,1),means(i,2),'*','Color',c(i,:));
        else
            plot3(data_A(:,1),data_A(:,2),data_A(:,3),'+','Color',c(i,:));
            hold on
            plot3(means(i,1),means(i,2),means(i,3),'*','Color',c(i,:));
        end
    end
    for j=1:length(data(:,1))
        for i=1:Ncluster
            d(i)=norm(means(i,:)-data(j,:));
        end
        [~,i]=min(d);
        if result(j,dataAxis+1)~=i
            result(j,dataAxis+1)=i;
            Update=1;
        end
    end
    pause(2);
    if Update==0
        break;
    end
end
end