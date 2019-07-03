clear all
close all
clc

x=[1 1 0 1 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0];

y=Codage_HDB3(x);
x
y
for i=1:1:length(y)  
    
    t=i:0.001:(i+1);
    
     subplot (2,1,2),plot(t,y(i),'g*'),title('Codage HDB3'),xlabel('temps'),ylabel('valeurs des bits')
    hold on
    grid on
    
end 
figure,stairs(x)
figure,stairs(y)

% Decoding
while (i<(length(y)+1) && i+3<=length(y))
    if(y(i)==0 && y(i+1)==0 && y(i+2)==0 && y(i+3)>0)
        z(i)=0;
        z(i+1)=0;
        z(i+2)=0;
        z(i+3)=0;
        i = i + 4;
    elseif (y(i)==0 && y(i+1)==0 && y(i+2)==0 && y(i+3)<0)
        z(i)=0;
        z(i+1)=0;
        z(i+2)=0;
        z(i+3)=0;
        i = i + 4;
    elseif (y(i)<0 && y(i+1)==0 && y(i+2)==0 && y(i+3)<0)
        z(i)=0;
        z(i+1)=0;
        z(i+2)=0;
        z(i+3)=0;
        i = i + 4;
    elseif (y(i)>0 && y(i+1)==0 && y(i+2)==0 && y(i+3)>0)
        z(i)=0;
        z(i+1)=0;
        z(i+2)=0;
        z(i+3)=0;
        i = i + 4;
    else
        if(y(i)>0 || y(i)<0)
            z(i) = 1;
            i = i+1;
        end
    end
end
z