clc,clear,close all;
image=imread('starshape.jpg');
[M,N]=size(image);
% 阈值分割
image_t=otsu(image);
% 计算面积
S=sum(sum(image_t==0));
% 计算形心
x=0;y=0;
for i=1:M
    for j=1:N
        x=x+j*~image_t(i,j);
        y=y+i*~image_t(i,j);
    end
end
xc=x/S;yc=y/S;
% 画图
subplot(1,2,1),imshow(image),title('原图（含形心)'),hold on,plot(xc,yc,'ro','markersize',2);
subplot(1,2,2),imshow(image_t),title('阈值分割图');
disp(['目标区域面积为',num2str(S)]);