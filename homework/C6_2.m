%霍夫曼编码
clc,clear,close all;
image=imread('lena512.jpg'); %读取图像
I=image(:); %将图像矩阵转换为向量
[M, N]=size(image);

%% 统计图像各像素值的概率
probability=zeros(256,1);
for i=1:M
    for j=1:N
        probability(image(i,j)+1)=probability(image(i,j)+1)+1;
    end
end
probability=probability/(M*N); 
x=0:255;bar(x,probability(x+1)),xlim([0, 255]);%画出概率直方图

%% 计算图像的熵
entropy=0;
for i=1:256
    if probability(i)~=0
        entropy=entropy-probability(i)*log2(probability(i));
    end
end

%% 进行霍夫曼编码
symbols=0:255;
[dict,avglen]=huffmandict(symbols,probability); %生成字典
enco=huffmanenco(I,dict); %编码
%deco=huffmandeco(enco,dict); %解码
%image_deco=col2im(deco,[M N],[M N],'distinct'); %将解码的向量转换为矩阵

%% 计算压缩率
image_len=length(image);
comp_rat=image_len/avglen;

%% 计算效率
efficiency=entropy/avglen;

%% 计算冗余度
redundancy=1-efficiency;