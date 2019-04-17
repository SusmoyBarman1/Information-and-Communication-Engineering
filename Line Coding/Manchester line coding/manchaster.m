

clc;
clear;

X=[0 1 0 1 1 1 0 0 1 0 1 0 1];
T = length(X);

bitDuration=5;
%sampleRate=200;
N=2*bitDuration*T;
dt=T/N;

t=0:dt:T;

Y = zeros(1,length(t));

for i=0:1:(T-1);
    if X(i+1)==1
        Y(i*2*bitDuration+1 : (2*i+1)*bitDuration)=-1;
        Y((i*2+1)*bitDuration+1 : (2*i+2)*bitDuration)=1;
    else
        Y(i*2*bitDuration+1 : (2*i+1)*bitDuration)=1;
        Y((2*i+1)*bitDuration+1 : (2*i+2)*bitDuration)=-1;
    end;
end;

plot(t,Y);
axis([0 t(end) -2 2]);
grid on;
title('Manchester');

% Decoding
increment=(1/dt);
bitLength=length(Y);

j=1;
for i=1:increment:bitLength-increment;
    if(Y(i)==-1)
        bits(j)=1;
    else
        bits(j)=0;
    end;
    j=j+1;
end;
bits
