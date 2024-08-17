function JM=Jac_f(fun,x0,e)
%求解函数fun在x0点的Jacobian矩阵
if nargin<3
    e=1e-8;
end
m=length(feval(fun,x0));
n=length(x0);
JM=zeros(m,n);
for i=1:n
    ex=zeros(n,1);
    ex(i)=e;
    JM(:,i)=(feval(fun,x0+ex)-feval(fun,x0))/e;
end