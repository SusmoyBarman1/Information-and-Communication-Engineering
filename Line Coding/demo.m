bits = [1 0 1 0 1 1 0 0 1];

bitrate = 1;
n = 200;
figure;

T = length(bits)/bitrate; % full time of bit sequence
n = 200;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t)); % output signal
for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*n+1:(i+0.5)*n) = 1;
    x((i+0.5)*n+1:(i+1)*n) = 0;
  else
    x(i*n+1:(i+0.5)*n) = -1;
    x((i+0.5)*n+1:(i+1)*n) = 0;
  end
end

plot(t,x,'LineWidth',3);
axis([0 t(end) -10 10])
grid on;
title(['Unipolar NRZ: [' num2str(bits) ']']);
