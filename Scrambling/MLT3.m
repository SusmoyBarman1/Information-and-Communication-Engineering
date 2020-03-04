figure;

bits = [0 1 0 1 1 0 1 1 1 0 1 1 0];

n=200;
len = length(bits);
bitrate = 1;

N = n*len;
T = len/bitrate;

dt = T/N;

t = 0:dt:T;
x = zeros(1,length(t));

state = 0;
reverse = 0;

stateValue = [5 0 -5];

for i=0:len-1
  
  if bits(i+1)==1
    if state == 3
      reverse = 1;
    elseif state == 1
      reverse = 0;
    endif
    
    if reverse == 1
      state = state - 1;
    elseif reverse == 0
      state = state + 1;
    endif
    
    x(i*n+1:(i+1)*n) = stateValue(state);
    
  else
    if state == 0
      x(i*n+1:(i+1)*n) = 0;
    elseif state>0
      x(i*n+1:(i+1)*n) = stateValue(state);
    endif
  endif
endfor

plot(t,x,'LineWidth',3);
axis([0 t(end) -10 10]);
grid on;
