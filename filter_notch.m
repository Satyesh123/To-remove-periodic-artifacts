
% Design a frequency-domain filter to remove periodic artifacts, such as power-line interference.

clc;
clear all;
close all;

fs=1000;   %sampling freq.
t=[1/fs:1/fs:4];  %time duration
x0=reshape(load('C:\Users\HP\Desktop\notch filter.dat'),1,4000)-2000;

fr=60;    
x1=500*sin(2*pi*fr*t);  %sinusoidal
x=x0+x1;

figure(1);
subplot(2,2,1);
plot(x0);
title('Original Signal');

subplot(2,2,2);
plot(x1);
title('Sine ');

subplot(2,2,3);
plot(x);
title('Original+Sine');

fm=fs/2;     %Nyquist
f1=60;       %Notch freq.
fc=f1/fm;    %Normalized
bw=(f1/fs);  

%Notch filter
[num,den]=iirnotch(fc,0.0377);
h=dfilt.df2(num,den);
y=filter(h,x);

subplot(2,2,4);
plot(y);
title('Filtered Output');