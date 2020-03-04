bits = [1 0 1 0 0 0 1 1 0];


bitrate = 1;
figure;

n = 200;
T = length(bits)/bitrate;
N = n*length(bits);

dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));

for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*n+1: (i+0.5)*n) = 5;
  else
    x(i*n+1: (i+0.5)*n) = -5;
  end
end

plot(t,x,'LineWidth',3);
axis([0 t(end) -10 10])
grid on;
title(['Polar RZ: [' num2str(bits) ']']);