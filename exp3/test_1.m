clc,clear,close all;
image=imread('lena256.jpg');
image=double(image);
[M, N]=size(image);
% 求梯度图像
Sx=[-1 0 1;
    -2 0 2;
    -1 0 1];
Sy=[-1 -2 -1;
    0 0 0;
    1 2 1];
image_Sx=imfilter(image,Sx);
image_Sy=imfilter(image,Sy);
image_S=uint8(256*mat2gray(sqrt(image_Sx.^2+image_Sy.^2)));
% 阈值分割
D_t=otsu(image_S);
% sobel
BW=edge(image,'sobel');
% 画图
subplot(2,3,1),imshow(uint8(image)),title('原图');
subplot(2,3,2),imshow(uint8(image_Sx)),title('X方向梯度');
subplot(2,3,3),imshow(uint8(image_Sy)),title('Y方向梯度');
subplot(2,3,4),imshow(image_S),title('总梯度图像');
subplot(2,3,5),imshow(BW),title('sobel边缘检测');
subplot(2,3,6),imshow(D_t),title('阈值分割');