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
% A demo of how to use the Zernike moment function. 
%
% Example: 
%   1- calculate the Zernike moment (n,m) for an oval shape,
%   2- rotate the oval shape around its centeroid,
%   3- calculate the Zernike moment (n,m) again,
%   4- the amplitude of the moment (A) should be the same for both images
%   5- the phase (Phi) should be equal to the angle of rotation

clc; clear all; close all;

n = 4; m = 2;           % Define the order and the repetition of the moment

disp('------------------------------------------------');
disp(['Calculating Zernike moments ..., n = ' num2str(n) ', m = ' num2str(m)]);

%--------------------------------------------------------------------------
% row 1
p = rgb2gray(imread('Oval_H.png'));
figure(1);subplot(2,3,1);imshow(p);
title('Horizontal oval');
p = logical(not(p));
tic
[~, AOH, PhiOH] = Zernikmoment(p,n,m);      % Call Zernikemoment fuction
Elapsed_time = toc;
xlabel({['A = ' num2str(AOH)]; ['\phi = ' num2str(PhiOH)]});

p = rgb2gray(imread('Oval_45.png'));
figure(1);subplot(2,3,2);imshow(p);
title('-45 degree oval');
p = logical(not(p));
[~, AOH, PhiOH] = Zernikmoment(p,n,m);      % Call Zernikemoment fuction
xlabel({['A = ' num2str(AOH)]; ['\phi = ' num2str(PhiOH)]});

p = rgb2gray(imread('Oval_V.png'));
figure(1);subplot(2,3,3);imshow(p);
title('Vertical oval');
p = logical(not(p));
[~, AOH, PhiOH] = Zernikmoment(p,n,m);      % Call Zernikemoment fuction
xlabel({['A = ' num2str(AOH)]; ['\phi = ' num2str(PhiOH)]});

%--------------------------------------------------------------------------
% row 2
p = rgb2gray(imread('shape_0.png'));
figure(1);subplot(2,3,4);imshow(p);
title('Horizontal shape');
p = logical(not(p));
[~, AOH, PhiOH] = Zernikmoment(p,n,m);      % Call Zernikemoment fuction
xlabel({['A = ' num2str(AOH)]; ['\phi = ' num2str(PhiOH)]});

p = rgb2gray(imread('shape_90.png'));
figure(1);subplot(2,3,5);imshow(p);
title('Vertical shape');
p = logical(not(p));
[~, AOV, PhiOV] = Zernikmoment(p,n,m);      % Call Zernikemoment fuction
xlabel({['A = ' num2str(AOV)]; ['\phi = ' num2str(PhiOV)]});

p = rgb2gray(imread('Rectangular_H.png'));
figure(1);subplot(2,3,6);imshow(p);
title('Horizontal Rectangle');
p = logical(not(p));
[~, AOH, PhiOH] = Zernikmoment(p,n,m);      % Call Zernikemoment fuction
xlabel({['A = ' num2str(AOH)]; ['\phi = ' num2str(PhiOH)]});

%--------------------------------------------------------------------------
% show the elapsed time
disp('Calculation is complete.');
disp(['The elapsed time per image is ' num2str(Elapsed_time) ' seconds']);


