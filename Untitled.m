% Max and Min filters
% Read a gray scale image and add salt & pepper noise and remove the same
% with min filter and max filter.
clear all; close all; clc;
f = imread('cameraman.tif');
f = imnoise(f,'salt & pepper',0.01);
f = imnoise(f,'gaussian',0.01);
f = im2double(f);
subplot(1,2,1),imshow(f),title('Original Image');
% figure,imshow(f),title('Noisy Image');
[m, n]=size(f);
b=f;d=2;
for i = 2:m-1
    for j = 2:n-1        
        con=0; s=0;
        for k1 = i-1:i+1
            for p1 = j-1:j+1               
                    con = con+1;
                    s=s+f(k1,p1);                                    
            end
        end
        b(i,j)=1/(con-d)*s;
    end    
end
subplot(1,2,2),imshow(b),title('Alpha-trimmed Mean filter');