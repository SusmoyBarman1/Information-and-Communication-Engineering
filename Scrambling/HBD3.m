figure;

bits = [1 1 1 0 0 0 0 1];

n=200;
bitrate=1;
len = length(bits);

N = n*len;
T = len/bitrate;

dt = T/N;

t = 0:dt:T;
x = zeros(1,length(t));

count = int16(0);
state = int16(-5);

%AMI
for i=0:len-1
  if bits(i+1)==1
    state = -state;
    x(i*n+1:(i+1)*n) = state;
  endif
endfor

%HBD3
for i=0:len-1
  
  if bits(i+1)==0
    count = count + 1;
    if count == 4
      check = int16(0);
      if x((i-3.5)*n)>0
        state = 5;
      elseif x((i-3.5)*n)<0
        state = -5;
      endif
      
      count1 = int16(0);
      for j=1:i-2
        if bits(j)==1
          count1 = count1+1;
        endif
      endfor
      value = mod(count1,2)
      state
      if value==0 && state>0
        state = -state
        x((i-3)*n+1:(i-3+1)*n) = state;
        x((i-2)*n+1:(i-2+1)*n) = 0;
        x((i-1)*n+1:(i-1+1)*n) = 0;
        x(i*n+1:(i+1)*n) = state;
      elseif value==0 && state<0
        state = -state
        x((i-3)*n+1:(i-3+1)*n) = state;
        x((i-2)*n+1:(i-2+1)*n) = 0;
        x((i-1)*n+1:(i-1+1)*n) = 0;
        x(i*n+1:(i+1)*n) = state;
      elseif value!=0 && state>0
        x((i-3)*n+1:(i-3+1)*n) = 0;
        x((i-2)*n+1:(i-2+1)*n) = 0;
        x((i-1)*n+1:(i-1+1)*n) = 0;
        x(i*n+1:(i+1)*n) = state;
      elseif value!=0 && state<0
        x((i-3)*n+1:(i-3+1)*n) = 0;
        x((i-2)*n+1:(i-2+1)*n) = 0;
        x((i-1)*n+1:(i-1+1)*n) = 0;
        x(i*n+1:(i+1)*n) = -state;
      endif
      count = 0;
    endif
  endif
endfor

plot(t,x,'LineWidth',3);
axis([0 t(end) -10 10]);
grid on;
