close all;clear all;clc;
f=imread('lux.jpg');
subplot(2,2,1);imshow(f)
subplot(2,2,2);imhist(f)
f=double(f);
[m,n]=size(f);
N=zeros(1,256);
P=zeros(1,256);
C=zeros(1,256);
for i = 1:m
    for j = 1:n
N(f(i,j)+1)=N(f(i,j)+1)+1;
    end
end
for i = 1:256
P(i)=N(i)/(m*n*1.0);
end
for i = 1:256
    if i == 1
        C(i)=P(i);
    else
        C(i)=P(i)+C(i-1);
    end
end
C=255.*C+0.5;
for i = 1:m
    for j = 1:n
        f(i,j)=C(f(i,j));
    end
end
f=uint8(f);
subplot(2,2,3);imshow(f)
subplot(2,2,4);imhist(f)