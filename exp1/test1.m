close all;clear all;clc;
f=imread('art.jpg');
f=im2double(f);
f=rgb2gray(f);
b=max(max(f));
a=min(min(f));
[m,n]=size(f);
g=zeros(m,n);
for i = 1:m
    for j = 1:n
        g(i,j)=(0.78/(b-a))*(f(i,j)-a)+0;
    end
end
subplot(2,2,1);imshow(f)
subplot(2,2,2);imshow(g)
subplot(2,2,3);imhist(g)
subplot(2,2,4)
x=0:0.0005:1;
y=0.78.*(x>=a)+0.78./(b-a).*(x-a).*(x>=a&b>=x)+0.*(a>=x);
plot(x,y)
imwrite(g,'image','jpg');