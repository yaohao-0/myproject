% Geometric mean filter
% Read a gray scale image and add a noise to it and filter it using
% Geometric mean filter.

clear all; close all; clc;

%% 几何均值滤波器
f = imread('Fig0507(b)(ckt-board-gauss-var-400).tif');
f = im2double(f);
subplot(1,2,1),imshow(f),title('Original Image');
[m, n]=size(f);
b1=f;
for i = 2:m-1
    for j = 2:n-1        
        con=0; s1=1;
        for k1 = i-1:i+1  % Sxy---矩形子图像窗口
            for p1 = j-1:j+1               
                    con = con+1;
                    s1=s1*f(k1,p1);              
            end
        end        
        b1(i,j)=s1^(1/con); % mn--size of moving window
    end    
end
subplot(1,2,2),imshow(b1),title('Geometric mean filtered');