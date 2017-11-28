clc,close all,clear all;
path='f16takeoff_396s/';
I=zeros(240,360,396);
[M, N, P]=size(I);
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
wx=90;wy=130;lx=40;ly=90;%模板位置与大小
Dx=10;Dy=10;%搜索范围
for k=1:P-1
    MAD=zeros(2*Dx+1,2*Dy+1);
    for dx=-Dx:Dx
        for dy=-Dy:Dy
            for i=wx:wx+lx
                for j=wy:wy+ly
                    MAD(dx+Dx+1,dy+Dy+1)=MAD(dx+Dx+1,dy+Dy+1)+abs(I(i,j,k)-I(i+dx,j+dy,k+1));
                end
            end
        end
    end
    [x,y]=find(MAD==min(min(MAD)));
    imshow(I(:,:,k),[]);
    hold on
    rectangle('Position',[wy,wx,ly,lx]);
    title(['Frame NO. ',num2str(k)]);
    pause(0.2)
    hold off
    wx=wx+x-Dx-1;wy=wy+y-Dy-1;
end