%此函数为大津法阈值分割函数
%image为输入图像 image_th为经阈值分割后的图像 th为分割阈值 
function [image_th,th]=otsu(image)
I=double(image);
[M, N]=size(I);
L=256;
n=zeros(L,1);
for i=1:M
    for j=1:N
        n(I(i,j)+1)=n(I(i,j)+1)+1;
    end
end
p=n/(M*N);
B=zeros(L,1);
u=0;
for i=0:L-1
    u=u+i*p(i+1);
end
for k=0:L-1
    w1=0;
    for i=0:k
        w1=w1+p(i+1);
    end
    w2=1-w1;
    u1=0;u2=0;
    for i=0:k
        u1=u1+i*p(i+1);
    end
    u1=u1/w1;
    for i=k+1:L-1
        u2=u2+i*p(i+1);
    end
    u2=u2/w2;
    B(k+1)=w1*(u1-u)^2+w2*(u2-u)^2;
end
th=find(B==max(B));
image_th=(I>th);
end