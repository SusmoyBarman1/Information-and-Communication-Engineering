function [y]=Codage_HDB3(x)
    v = -12;
    b=0;
    i=1;
    while (i<(length(x)+1))
            if  ((x(i)==1)&&(b==0))
                v=-v;
                y(i)=v;
                i=i+1;
            elseif  ((x(i)==1)&&((b<0)||(b>0)))
                y(i)=v;
                i=i+1;
            elseif ((i<(length(x)-3))&&(x(i)==0 && x(i+1)==0 && x(i+2)==0 && x(i+3)==0)) 
                    if b==0
                        y(i)=0;
                        y(i+1)=0;
                        y(i+2)=0;
                        y(i+3)=v;
                        i=i+4;
                        b=v;
                    else %(b>j)
                        if ((b>0) && (v>0))
                            y(i)=-v;
                            y(i+1)=0;
                            y(i+2)=0;
                            y(i+3)=-v;
                            i=i+4;
                            b=v;
                        elseif ((b<0) && (v<0))
                            y(i)=-v;
                            y(i+1)=0;
                            y(i+2)=0;
                            y(i+3)=-v;
                            i=i+4;
                            b=v;
                        elseif ((b>0) && (v<0))
                            y(i)=0;
                            y(i+1)=0;
                            y(i+2)=0;
                            y(i+3)=v;
                            i=i+4;
                            b=v;
                        else%((b==-12) && (v==12))
                            y(i)=0;
                            y(i+1)=0;
                            y(i+2)=0;
                            y(i+3)=v;
                            i=i+4;
                            b=v;
                        end                
                    end            
            else%x(i)==0
              y(i)=0;
              i=i+1;
            end
    end
end