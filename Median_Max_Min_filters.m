% Max and Min filters
% Read a gray scale image and add salt & pepper noise and remove the same
% with min filter and max filter.
clear all; close all; clc;
f = imread('cameraman.tif');
f = imnoise(f,'salt & pepper',0.01);
f = im2double(f);
subplot(2,2,1),imshow(f),title('Original Image');
% figure,imshow(f),title('Noisy Image');
[m, n]=size(f);
b1=f;b2=f;b3=f;
for i = 2:m-1
    for j = 2:n-1        
        con=0; s1=zeros(9,1);
        for k1 = i-1:i+1
            for p1 = j-1:j+1               
                    con = con+1;
                    s1(con)=(f(k1,p1));                                    
            end
        end
        b1(i,j)=min(s1);
        b2(i,j)=max(s1);
        b3(i,j)=median(s1);
    end    
end
subplot(2,2,2),imshow(b1),title('Min filter');
subplot(2,2,3),imshow(b2),title('Max filter');
subplot(2,2,4),imshow(b3),title('Median filter');




