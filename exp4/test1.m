clc,close all,clear all;
path='image200s/';
for k=1:200
    name=num2str(k);
    if k<=9
        filename=strcat('0000000',name,'.bmp');
    elseif k<=99
        filename=strcat('000000',name,'.bmp');
    else
        filename=strcat('00000',name,'.bmp');
    end
    image=imread([path filename]);%读取图像
    [M,N]=size(image);
    image_th=(image>196);%阈值分割
    S=sum(sum(image_th(:,1:N-10)==0));%计算面积
    %计算形心      
    x=0;y=0;
    for i=1:M
        for j=1:N-10
            x=x+j*~image_th(i,j);
            y=y+i*~image_th(i,j);
        end
    end
    xc=x/S;yc=y/S;
    %画图
    imshow(image);
    hold on
    plot(xc,yc,'r+','markersize',3);%画出形心位置
    rectangle('Position',[xc-25,yc-8,64,16],'EdgeColor','r');%画出矩形框位置
    title(['Frame NO. ',num2str(k)]);
    pause(0.01)
    hold off
end