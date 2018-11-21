subplot(2,2,1)
mask = zernike(100,2,2);
mesh(real(mask))
view(0,90)
axis off


subplot(2,2,2)
mask = zernike(100,4,0);
mask(mask==1)=NaN;
title('Z^2_2')
mesh(real(mask))
view(0,90)
axis off

subplot(2,2,3)
mask = zernike(100,4,2);
title('Z^2_4')
mesh(real(mask))
view(0,90)
axis off

subplot(2,2,4)
str = strcat('Z^',num2str(4),'_',num2str(4))
mask = zernike(100,4,4);
mesh(real(mask))
view(0,90)
axis off

function mask = zernike(N,n,m)
    x = 1:N; y = x;
    [X,Y] = meshgrid(x,y);
    R = sqrt((2.*X-N-1).^2+(2.*Y-N-1).^2)/N;
    R = (R<=1).*R;

    Rad = radialpoly(R,n,m);    % get the radial polynomial
    Theta = atan2((N-1-2.*Y+2),(2.*X-N+1-2));

    mask = Rad.*exp(-1i*m*Theta);
    mask(mask==0) = NaN;
%     mesh(real(mask))
end