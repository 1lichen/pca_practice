%读取的是多个村庄居民收入、产业发展、居住环境、文化教育、基础设施五个方面的评分数据
X=xlsread('PCAlx\cunz.xlsx');
X=X';
X=X(:,1:5000)
[a,b]=size(X)% a=5,b=5000
m=mean(X,2);
Xcen=X-m*ones(1,b);
c=(1/b)*Xcen*Xcen';
[V,D]=eig(c);
[~,inx]=sort(diag(D),'descend');
%前两个主成分的贡献率已经大于85%，将五个数据简化成了两个特征
Wpca=V(:,inx(1:2));
Xdim=Wpca'*X;
figure;
plot(Xdim(1,:),Xdim(2,:),'+')
