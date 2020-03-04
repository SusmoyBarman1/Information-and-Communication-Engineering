figure;

bits = [1 0 1 0 0 0 1 1 0];
n = 200;
bitrate = 1;
len = length(bits);

N = n*len;
T = len/bitrate;

dt = T/N;
state = int16(-5);

t = 0:dt:T;
x = zeros(1,length(t));

for i=0:len-1
  if bits(i+1) == 1
    state = -1 * state;
    x(i*n+1:(i+1)*n) = state;
  else
    x(i*n+1:(i+1)*n) = state
  endif
endfor

plot(t,x, 'LineWidth',3);
axis([0 t(end) -10 10]);
grid on;
