
% N = [2,4,4,4,5,5,5,5];
% M = [2,0,2,4,1,2,3,5];

N = [1,3,3,4,4,5,5,6];
M = [1,1,3,2,4,3,5,6];


figure
colormap(parula)
for i = 1:length(N)
    subplot(2,4,i)
    
    mask = zernike(100,N(i),M(i));
    
    mesh(real(mask))
    str = strcat('Z^',num2str(N(i)),'_',num2str(M(i)));
    title(str)

    view(0,90)
%     axis off
end


function mask = zernike(N,n,m)
    x = 1:N; y = x;
    [X,Y] = meshgrid(x,y);
    R = sqrt((2.*X-N-1).^2+(2.*Y-N-1).^2)/N;
    R = (R<=1).*R;

    Rad = radialpoly(R,n,m);    % get the radial polynomial
    Theta = atan2((N-1-2.*Y+2),(2.*X-N+1-2));

    mask = Rad.*exp(-1i*m*Theta);
    mask(mask==0) = NaN;
    mask(mask==1) = NaN;
%     mesh(real(mask))
end


function mask = PCET(N,n,m)
    x = 1:N; y = x;
    [X,Y] = meshgrid(x,y);
    R = sqrt((2.*X-N-1).^2+(2.*Y-N-1).^2)/N;
    R = (R<=1).*R;
    Theta = atan2((N-1-2.*Y+2),(2.*X-N+1-2));
    
    mask = exp(1i*2*pi*n.*R.^2).*exp(1i*m*Theta).*(R~=0); % just like a filter
    mask(mask==0) = NaN;
    mask(mask==1) = NaN;
   
end

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

function mask = PST(N,n,m)
    x = 1:N; y = x;
    [X,Y] = meshgrid(x,y);
    R = sqrt((2.*X-N-1).^2+(2.*Y-N-1).^2)/N;
    R = (R<=1).*R;
    Theta = atan2((N-1-2.*Y+2),(2.*X-N+1-2));
    
    mask = sin(pi*n.*R.^2).*exp(1i*m*Theta); % just like a filter
    mask(mask==0) = NaN;
    mask(mask==1) = NaN;
    
end