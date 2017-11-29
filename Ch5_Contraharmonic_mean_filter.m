% Contraharmonic mean filter
% Read a gray scale image and applay contraharmonic filter for verious Q
% values. prove that for negative values of Q salt noise is removed, for
% positive values of Q pepper noise is removed. check that 
% for Q=0 it becomes mean filter and for Q=-1 it becomes harmonic filter. 

clear all; close all; clc;

%% 逆谐波均值滤波器-----Q--阶数，为正可以消除胡椒噪声，为负可以消除盐粒噪声。

f = imread('Fig0508(b)(circuit-board-salt-prob-pt1).tif');
% f = imread('Fig0508(a)(circuit-board-pepper-prob-pt1).tif');
f = im2double(f);
subplot(1,2,1),imshow(f),title('Original Image');

[m n]=size(f);
b1=f;
Q=-1;  % 当 Q>0，用于消除“胡椒”噪声;当 Q<0，用于消除“盐”噪声;但不能同时消除这两种噪声

for i = 2:m-1
    for j = 2:n-1        
        con=0; s1=0; s2=0;
        for k1 = i-1:i+1
            for p1 = j-1:j+1
                    con = con+1;
                    s1=s1+(f(k1,p1)^Q);
                    s2=s2+(f(k1,p1)^(Q+1));               
            end
        end
        b1(i,j)=s2/s1;
    end    
end
subplot(1,2,2),imshow(b1),title('Cantraharmonic mean filtered');
% figure,imshow(b1),title('Contraharmonic mean filtered');
