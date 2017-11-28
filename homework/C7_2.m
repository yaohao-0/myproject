clc,clear,close all;
I_A=[-3     0     3     3     0;
     -4     0     4     4     0;
     -4     0     4     4     0;
     -4     0     4     4     0;
     -3     0     3     3     0];
[M, N]=size(I_A);
th=2; %设定阈值
I_A_th=(I_A>th); %分割
subplot(1,2,1),imshow(I_A,[]),title('模板A');
subplot(1,2,2),imshow(I_A_th),title('阈值分割图'); 