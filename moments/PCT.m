function mask = PCT(N,n,m)
    x = 1:N; y = x;
    [X,Y] = meshgrid(x,y);
    R = sqrt((2.*X-N-1).^2+(2.*Y-N-1).^2)/N;
    R = (R<=1).*R;
    Theta = atan2((N-1-2.*Y+2),(2.*X-N+1-2));
    
    if n == 0
%     mask = exp(1i*m*Theta).*(R~=0).*(R~=0);
        mask = exp(1i*m*Theta).*(R~=0);
    else
        mask = sqrt(2)*cos(pi*n*R.^2).*exp(1i*m*Theta).*(R~=0);
    end
    mask(mask==0) = NaN;
    mask(mask==1) = NaN;
    
end