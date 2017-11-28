%彩色图像运动模糊
clear,clc,close all;
image=imread('art.jpg');
R=image(:,:,1);G=image(:,:,2);B=image(:,:,3);
f=fspecial('motion',50,45);
blurred_R=imfilter(R,f,'conv','replicate','same');
blurred_G=imfilter(G,f,'conv','replicate','same');
blurred_B=imfilter(B,f,'conv','replicate','same');
blurred_image(:,:,1)=blurred_R;
blurred_image(:,:,2)=blurred_G;
blurred_image(:,:,3)=blurred_B;
imshow(blurred_image);