figure;

bits = [1 0 0 1 1 1 0 0];

n = 200;
len = length(bits);
bitrate = 1

N = n*len;
T = len/bitrate

dt = T/N;

t = 0:dt:T;
x = zeros(1,length(t))

state = int16(5)

for i=0:len-1
  if bits(i+1) == 1
    x(i*n+1:(i+1)*n) = state;
    state = -state;
  endif
endfor

plot(t,x,'LineWidth',3);
axis([0 t(end) -10 10]);
grid on;
