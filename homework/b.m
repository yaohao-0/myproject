clc,clear all,close all;
I=imread('tank.jpg');
I=double(I);
[M,N]=size(I);
I_max=max(max(I));I_min=min(min(I));
I_new=zeros(M,N);
for i=1:M
    for j=1:N
        I_new(i,j)=(I(i,j)-I_min)/(I_max-I_min);
    end
end
subplot(1,2,1),imshow(uint8(I)),title('Original');
subplot(1,2,2),imshow(I_new),title('Normalized');