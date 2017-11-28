%显示彩色图像三通道图像
clear,clc,close all;
[image,map]=imread('art.jpg');
R=image;R(:,:,[2 3])=0;
G=image;G(:,:,[1 3])=0;
B=image;B(:,:,[1 2])=0;
subplot(2,2,1),imshow(image),title('原图');
subplot(2,2,2),imshow(R),title('红色');
subplot(2,2,3),imshow(G),title('绿色');
subplot(2,2,4),imshow(B),title('蓝色');