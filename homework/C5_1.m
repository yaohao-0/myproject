clear,clc,close all;
i=zeros(250,239);
i(21:230,[21:27 45:51 69:75 93:99 117:123 141:147 165:171 189:195 213:219])=1;%生成图像
%生成均值滤波器
f1=ones(3,3)/9;
f2=ones(5,5)/25;
f3=ones(9,9)/81;
%滤波
I1=imfilter(i,f1,'conv','replicate','same');
I2=imfilter(i,f2,'conv','replicate','same');
I3=imfilter(i,f3,'conv','replicate','same');
%画图
subplot(2,2,1),imshow(i),title('原图');
subplot(2,2,2),imshow(I1),title('3X3均值滤波');
subplot(2,2,3),imshow(I2),title('5X5均值滤波');
subplot(2,2,4),imshow(I3),title('9X9均值滤波');
%保存图像
imwrite(i,'2.jpg');