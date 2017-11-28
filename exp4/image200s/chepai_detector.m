function chepai_detector
clc
clear all
%  for i=1:200
%  I=tu(i);
I=tu(1);
% figure
% imshow(I)
J=edge(I,'sobel',0.02);
figure
imshow(J);hold on
%%%%%ÐÍÐÄ¼ì²â%%%%%%%%%%%
[m,n]=size(J);
% [K,M]=find(J~=0);
for i=1:m
     for j=1:n
         if J(i,j)~=0
           K(i,j)=K
size(K)
% end

function  I=read_seqim(i)
for i=1:200
    name=num2str(i)
    if i<=9
        min=strcat('0000000',name,'.bmp');
    elseif i<=99
        min=strcat('000000',name,'.bmp');
    elseif i<=199
        min=strcat('00000',name,'.bmp');
        I=imread(min);
        return 
%     figure
%     imshow(I)
    end
 end
