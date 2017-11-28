clear,clc,close all;
f=rgb2gray(imread('1.jpg'));%读取图片
F=imnoise(f,'gaussian',0,0.02);%添加高斯噪声
h=fspecial('gaussian',9,2);%生成高斯滤波器
i=imfilter(F,h,'conv','replicate','same');%空域滤波

Fh=freqz2(h,size(F));
FF=fftshift(fft2(F));
FI=FF.*Fh;
I=ifft2(ifftshift(FI));%频域滤波

Ff=fftshift(fft2(f));
Fi=fftshift(fft2(i));

subplot(2,2,1),imshow(f);title('原图像');
subplot(2,2,2),imshow(mat2gray(abs(Ff),[0,100000]));title('原图像中心化频谱图');
subplot(2,2,3),imshow(mat2gray(F));title('加噪声图像');
subplot(2,2,4),imshow(mat2gray(abs(FF),[0,100000]));title('加噪声图像中心化频谱图');

figure;
subplot(2,2,1),imshow(mat2gray(h,[0,0.05]));title('空域H平面图');
subplot(2,2,2),imshow(mat2gray(abs(Fh)));title('中心化频域H平面图');
subplot(2,2,3),mesh(abs(Fh));title('H 3D图');

figure
subplot(2,2,1),imshow(mat2gray(i));title('空域滤波结果');
subplot(2,2,2),imshow(mat2gray(abs(Fi),[0,100000]));title('空域滤波结果中心化频谱图');
subplot(2,2,3),imshow(mat2gray(I));title('频域滤波结果');
subplot(2,2,4),imshow(mat2gray(abs(FI),[0,100000]));title('频域滤波结果中心化频谱图');