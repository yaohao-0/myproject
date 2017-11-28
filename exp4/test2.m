clc,close all,clear all;
path='f16takeoff_396s/';
I=zeros(240,360,396);
[M, N, P]=size(I);
%% 读取图像
fprintf('Reading the images...\n');
for k=1:P
    name=num2str(k);
    if k<=9
        filename=strcat('00',name,'.jpg');
    elseif k<=99
        filename=strcat('0',name,'.jpg');
    else
        filename=strcat(name,'.jpg');
    end
    image=imread([path filename]);%读取图像
    I(:,:,k)=double(rgb2gray(image));
end
fprintf('DONE!press Enter to the next step\n');
pause
%% 处理图像
clc
wx=zeros(P,1);wy=zeros(P,1);
wx(1)=90;wy(1)=130;lx=40;ly=90;%模板位置与大小
Dx=10;Dy=10;%搜索范围
for k=1:P-1
    fprintf('Processing the NO.%d image\n',k);
    MAD=zeros(2*Dx+1,2*Dy+1);
    for dx=-Dx:Dx
        for dy=-Dy:Dy
            for i=wx(k):wx(k)+lx
                for j=wy(k):wy(k)+ly
                    MAD(dx+Dx+1,dy+Dy+1)=MAD(dx+Dx+1,dy+Dy+1)+abs(I(i,j,k)-I(i+dx,j+dy,k+1));
                end
            end
        end
    end
    MAD_min=min(min(MAD));
%     mesh(MAD)
%     title(['Frame NO. ',num2str(k)]);
%     pause(0.01)
    [x,y]=find(MAD==MAD_min);
    wx(k+1)=wx(k)+x-Dx-1;wy(k+1)=wy(k)+y-Dy-1;
    clc
end
%% 显示结果
fprintf('DONE!press Enter to show the result\n');
pause  
for k=1:P
    name=num2str(k);
    if k<=9
        filename=strcat('00',name,'.jpg');
    elseif k<=99
        filename=strcat('0',name,'.jpg');
    else
        filename=strcat(name,'.jpg');
    end
    image=imread([path filename]);%读取图像
    imshow(image);
    hold on
    rectangle('Position',[wy(k),wx(k),ly,lx],'EdgeColor','r');
    title(['Frame NO. ',num2str(k)]);
    pause(0.01)
    hold off
end