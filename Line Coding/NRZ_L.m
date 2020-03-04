figure;

bits = [1 0 1 0 0 0 1 1 0];
n = 200;
N = n*length(bits)
bitrate = 1
T = length(bits)/bitrate

dt = T/N
t = 0:dt:T
x = zeros(1,length(t))

for i=0:length(bits)-1
  if bits(i+1) == 0
    x(i*n+1: (i+1)*n) = 5;
  else
    x(i*n+1: (i+1)*n) = -5;  
  endif
endfor

plot(t,x, 'LineWidth',3);
axis([0 t(end) -10 10]);
