% 参考：http://muchong.com/t-2013959-1-authorid-1019062
%作图
% c=[];x=1:100;
% for i=x;
%     y=Kraw(2,i,0.5,100);
%     c=[c y];
% end
% line(x,c)
n = 2;
m = 2;
p1 = 0.5;
p2 = 0.8;

N = 100;
x = 1:N;
y = 1:N;

K_x = zeros(size(x));
for i =x
    K_x(i) = Kraw(n,i,p1,N);
end

K_y = zeros(size(y));
for i =x
    K_y(i) = Kraw(m,i,p2,N);
end

[K_X,K_Y] = meshgrid(K_x,K_y);

M = K_X .* K_Y;

mesh(M);

%关于不动点Krawtchouk
%2010-06-05 by lijinfeng042

%hypergeometric functions (2F1)
%hypergeom([a,b],c,z) is the Gauss hypergeometric function 2F1(a,b;c;z).
%K1=Kn(x;p,N)=hypergeom([-n,-x],-N,1/p)
%p1=ρn(n;p,N)=((p-1)/p)^n*n!/(gamma(-N+n)/gamma(-N))
%w1=ωn(x;p,N)=binomial(N,x)*p^x*(1-q)^(N-x))
%K=Kn(x;p,N)*sqrt(ωn(x;p,N)/ρn(n;p,N))
%  warming;0 
function K=Kraw(n,x,p,N)
if x> N 
     error('MATLAB:nchoosek:KOutOfRange','Kraw(n,x,p,N) x must be an integer between 0 and N.'); 
end 
    K1=hypergeom([-n,-x],-N,1/p);% 高斯超几何函数
    p1=gamma(n+1)*((p-1)/p)^n/proohc(-N,n);
    w1=nchoosek(N,x)*p^x*(1-p)^(N-x);
    K=K1*sqrt(w1/p1);
end

function prooh=proohc(a,n)
%给出 Pochhammer 符号函数 (a)_n。
%只针对a,n是整数的情形 
%2010-06-05 by lijinfeng042

    if a+n>a
      prooh=prod(a:a+n-1);
    else
      prooh=prod(a+n,a);
    end

end