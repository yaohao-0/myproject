clear,clc,close all;
I=im2double(rgb2gray(imread('art.jpg')));
[M,N]=size(I);
PSF=fspecial('motion',100,45);%生成点扩展函数
%空域滤波
I1=imfilter(I,PSF,'conv','replicate','same');
%频域滤波
OTF=fftshift(fft2(PSF,M,N));
fft_I=fftshift(fft2(I));
fft_I2=OTF.*fft_I;
I2=ifft2(fftshift(fft_I2));
%画图
subplot(2,3,1),imshow(I),title('原图');
subplot(2,3,2),imshow(mat2gray(PSF)),title('PSF');
subplot(2,3,3),imshow(I1),title('空域滤波结果');
subplot(2,3,4),imshow(I),title('原图');
subplot(2,3,5),imshow(mat2gray(abs(OTF))),title('OTF');
subplot(2,3,6),imshow(I2),title('频域滤波结果');