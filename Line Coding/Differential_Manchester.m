figure;

bits = [1 0 1 1 1 0 0 1];

n=200;
bitrate = 1;
len = length(bits);

N = n*len;
T = len/bitrate;

dt = T/N;

t = 0:dt:T;
x = zeros(1,length(t));

state = int16(5);

for i=0:len-1
  if bits(i+1)==1
    x(i*n+1:(i+0.5)*n) = state;
    state = -state;
    x((i+0.5)*n+1:(i+1)*n) = state
  else
    demoState = -state
    x(i*n+1:(i+0.5)*n) = demoState;
    demoState = -demoState;
    x((i+0.5)*n+1:(i+1)*n) = demoState
  endif
endfor

plot(t,x,'LineWidth',3);
axis([0 t(end) -10 10]);
grid on;
