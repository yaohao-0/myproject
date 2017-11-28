 clear,clc,close all;
i=im2double(rgb2gray(imread('image.jpg')));
[M,N]=size(i);

%加入运动模糊
[u,v]=meshgrid(1:N,1:M);
u=u-M/2;
v=v-N/2;
T=1.0;a=0.05;b=0.05;
z=pi*(u*a+v*b)+eps;
H=T./z.*sin(z).*exp(-1j*z);
fft_i=fftshift(fft2(i));
fft_i1=H.*fft_i;
i1=abs(ifft2(fftshift(fft_i1)));

%加入高斯噪声
i2=imnoise(i1,'gaussian',0.01,0.002);

fft_i2=fftshift(fft2(i2));

%全逆滤波
F1=1./H;
fft_I1=F1.*fft_i2;
I1=abs(ifft2(fftshift(fft_I1)));

%半径限制的逆滤波
F2=zeros(M,N);
for m=1:M
    for n=1:N
        if sqrt((m-M/2)^2+(n-N/2)^2)<=14
            F2(m,n)=1./H(m,n);
        else
            F2(m,n)=0;
        end
    end
end
fft_I2=F2.*fft_i2;
I2=abs(ifft2(fftshift(fft_I2)));

%维纳滤波
k=0.1;
F3=(1./H).*(abs(H).^2)./((abs(H).^2)+k);
fft_I3=F3.*fft_i2;
I3=abs(ifft2(fftshift(fft_I3)));

%画图
subplot(2,3,1),imshow(i),title('原图');
subplot(2,3,2),imshow(i1),title('模糊图像');
subplot(2,3,3),imshow(i2),title('加噪图像');
subplot(2,3,4),imshow(I1,[]),title('全逆滤波复原图像');
subplot(2,3,5),imshow(I2,[]),title('半径限制的逆滤波复原图像');
subplot(2,3,6),imshow(I3,[]),title('维纳滤波复原图像');