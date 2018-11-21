m = 2;
n = 2;

N= 20;
x = 1:N; y = x;
[X,Y] = meshgrid(x,y);
R = sqrt((2.*X-N-1).^2+(2.*Y-N-1).^2)/N;
R = (R<=1).*R;
Theta = atan2((N-1-2.*Y+2),(2.*X-N+1-2));

Rad = radialpoly(R,n,m);    % get the radial polynomial


%% PCET algrithom
% mask = exp(1i*2*pi*n.*R.^2).*exp(1i*m*Theta).*(R~=0);
% mask(mask==0) = NaN;
% mesh(real(mask))


%% PST algrithom
% mask = sin(pi*n.*R.^2).*exp(1i*m*Theta);
% mask(mask==0) = NaN;
% mesh(real(mask))
% axis off


%% PCT algrithom
if n == 0
%     mask = exp(1i*m*Theta).*(R~=0).*(R~=0);
    mask = exp(1i*m*Theta).*(R~=0);
else
    mask = sqrt(2)*cos(pi*n*R.^2).*exp(1i*m*Theta).*(R~=0);
end

% mask = sqrt(2)*cos(pi*n.*R.^2).*exp(1i*m*Theta);
mask(mask==0) = NaN;
mesh(real(mask))
axis off