clc,clear,close all;
image=imread('C7_4.jpg');
image_th=(image>80); %设定阈值为80
[x, y]=find(image_th==1); %找出物体在图像中的位置
subplot(2,2,1),imshow(image),title('原图');
subplot(2,2,2),imshow(image_th),title('阈值分割图');
subplot(2,2,3),imshow(image(min(x):max(x),min(y):max(y))),title('原图局部放大');
subplot(2,2,4),imshow(image_th(min(x):max(x),min(y):max(y))),title('阈值分割图局部放大');