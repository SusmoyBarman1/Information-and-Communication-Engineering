N= 300;

bits = [1 1 0 0 1 0 1 0 1 0 1 1];

upVoltage = 5;
downVoltage = -5;
bitrate=5;

bitLength = length(bits);
t = 1:1/N:bitLength;

streamLength = length(t);


signal = zeros(1,bitrate);


increment = streamLength/(2*bitLength);

incrementLength = int16(increment);

k = 1;
temp = 0;
for i=1:bitLength
    if(bits(i)==1);
        for j=1:incrementLength
            signal(k) = upVoltage; 
            k = k + 1;
        end;
        k = k + incrementLength;
    else
        for j=1:incrementLength
            signal(k) = downVoltage;
            k = k + 1;
        end;
        k = k + incrementLength;
    end;
    
end;

signalLength = length(signal);

plot(t,signal);