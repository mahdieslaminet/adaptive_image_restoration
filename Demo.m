clc;
close all;

% Call function I_out = ATVBH(I_noise, k);
% where k is a balancing parameter for smoothness and artifact removal.
% by default, k = 1 if you call I_out = ATVBH(I_noise);

I = imread('cameraman.tif');
In = imnoise(I, 'gaussian', 0.1);
Iout1 = ATVBH(In);
Iout2 = ATVBH(In, 2);
Iout1p2 = ATVBH(In, 1/2);
imshow([I In Iout1 Iout2 Iout1p2]);

%k=1
psnr(I, Iout1)
ssim(I, Iout1)

%k=2
psnr(I, Iout2)
ssim(I, Iout2)

%k=1/2
psnr(I, Iout1p2)
ssim(I, Iout1p2)

title('Original | Noisy | Denoise with k=1 | Denoise with k=2 | Denoise with k=1/2');