clear,clc,close all;
f=importdata('seismic_251_301_2ms.txt');%读取数据
s=f(:,1);%取第一列数据
l=length(s);
t0=1800;%开始时间
dt=2;
t1=1800+(l-1)*dt;%结束时间
t=t0:dt:t1;
plot(t,s),xlabel('t/ms'),ylabel('振幅'),title('第一列振幅随时间变化曲线');

y=abs(fftshift(fft(s)));%快速傅里叶变换
f=(0:l-1)/(l*dt)*1000;
f=f-f((l+1)/2);

figure;
subplot(2,1,1),plot(f,y),xlabel('频率/Hz'),ylabel('振幅'),title('中心化对称频谱图');
subplot(2,1,2),plot(f((l+1)/2:l),y((l+1)/2:l)),xlabel('频率/Hz'),ylabel('振幅'),title('只含正半轴的频谱图'); 

H=zeros(3,l);
D0=100;
for n=1:l
    H(1,n)=1/(1+((n-(l)/2)/D0)^(2*1));      %一阶Butterworth滤波器
    H(2,n)=1/(1+((n-(l)/2)/D0)^(2*10));      %二阶Butterworth滤波器
    H(3,n)=1/(1+((n-(l)/2)/D0)^(2*4));      %四阶Butterworth滤波器
end

figure;
plot(f,abs(H(1,:)),'');hold on
plot(f,abs(H(2,:)),'.');hold on
plot(f,abs(H(3,:)),'-.');
xlabel('f/Hz');

z=y'.*H(2,:);
figure;
plot(f,abs(z)),xlabel('频率/Hz'),ylabel('振幅'),title('过滤后的频谱图');