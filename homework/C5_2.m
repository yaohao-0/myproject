clear,clc,close all;
h=im2double(imread('2.jpg'));
[M, N]=size(h);
h1=zeros(M,N);h2=zeros(M,N);h3=zeros(M,N);h4=zeros(M,N);
%谐波均值滤波
for x=2:M-1
    for y=2:N-1
        g=0;
        for i=x-1:x+1
            for j=y-1:y+1
                g=g+1/h(i,j);
            end
        end
        h1(x,y)=9/g;
    end
end
%逆谐波均值滤波
Q=-1.5;
for x=2:M-1
    for y=2:N-1
        g=0;G=0;
        for i=x-1:x+1
            for j=y-1:y+1
                g=g+h(i,j)^(Q+1);
                G=G+h(i,j)^Q;
            end
        end
        h2(x,y)=g/G;
    end
end
%最大值滤波
for x=2:M-1
    for y=2:N-1
        g=[];
        for i=x-1:x+1
            for j=y-1:y+1
                g=[g,h(i,j)];
            end
        end
        h3(x,y)=max(g);
    end
end
%中值滤波
for x=2:M-1
    for y=2:N-1
        g=[];
        for i=x-1:x+1
            for j=y-1:y+1 
                g=[g,h(i,j)];
            end
        end
        g=sort(g);
        h4(x,y)=g(5);
    end
end
%画图
subplot(2,3,1),imshow(h),title('原图');
subplot(2,3,2),imshow(h1),title('谐波均值滤波');
subplot(2,3,3),imshow(h2),title('逆谐波均值滤波');
subplot(2,3,4),imshow(h3),title('最大值滤波');
subplot(2,3,5),imshow(h4),title('中值滤波');