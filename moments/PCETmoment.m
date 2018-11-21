function [M,A,Phi] = PCETmoment(p,n,m)
%     N= 20;
    N = size(p,1);
    x = 1:N; y = x;
    [X,Y] = meshgrid(x,y);
    R = sqrt((2.*X-N-1).^2+(2.*Y-N-1).^2)/N;
    R = (R<=1).*R;
    Theta = atan2((N-1-2.*Y+2),(2.*X-N+1-2));
    
    mask = exp(1i*2*pi*n.*R.^2).*exp(1i*m*Theta).*(R~=0); % just like a filter
    
    
    Product = p(x,y).*mask;
    M = sum(Product(:));
    A = abs(M);
    Phi = angle(M)*180/pi;
end
