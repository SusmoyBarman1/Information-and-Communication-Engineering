clear all
close all
clc

x=[1 1 0 1 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0];
 
 
for i=1:1:length(x)
    
    t=i:0.001:(i+1);
    
    subplot (2,1,1),plot(t,x(i),'r*'),xlabel('temps'),ylabel('valeurs des bits'),title('X(t)')
    hold on
    grid on
    
end

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