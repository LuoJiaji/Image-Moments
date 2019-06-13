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

function rad = radialpoly(r,n,m)
% -------------------------------------------------------------------------
% Copyright C 2014 Amir Tahmasbi
% Texas A&M University
% amir.tahmasbi@tamu.edu
% http://people.tamu.edu/~amir.tahmasbi/index.html
%
% License Agreement: To acknowledge the use of the code please cite the 
%                    following papers:
%
% [1] A. Tahmasbi, F. Saki, S. B. Shokouhi, 
%     Classification of Benign and Malignant Masses Based on Zernike Moments, 
%     Comput. Biol. Med., vol. 41, no. 8, pp. 726-735, 2011.
%
% [2] F. Saki, A. Tahmasbi, H. Soltanian-Zadeh, S. B. Shokouhi,
%     Fast opposite weight learning rules with application in breast cancer 
%     diagnosis, Comput. Biol. Med., vol. 43, no. 1, pp. 32-41, 2013.
%
% -------------------------------------------------------------------------
% Function to compute Zernike Polynomials:
%
% f = radialpoly(r,n,m)
% where
%   r = radius
%   n = the order of Zernike polynomial
%   m = the repetition of Zernike moment

rad = zeros(size(r));                     % Initilization
for s = 0:(n-abs(m))/2
  c = (-1)^s*factorial(n-s)/(factorial(s)*factorial((n+abs(m))/2-s)*...
      factorial((n-abs(m))/2-s));
  rad = rad + c*r.^(n-2*s);
end

end