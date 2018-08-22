% Random Walk su un segmento di lunghezza 2L
clear; clc;
L= 10:10:200; len=length(L);
n_storie=200;

for j=1:len  
    y=0;
    for i=1:n_storie        
        Y=0; t=0;               
        while Y<L(j) & Y>-L(j)          
            f=rand;            
            if f>0.5
                moneta=1;
            else
                moneta=-1;
            end
            
            Y=Y+moneta;
            t=t+1;            
        end    
        y(i)=t;
    end
   
    Passi(j)=mean(y);
    
end

Passi

plot(L,Passi)
xlabel('L')
title('Numero di passi per uscire dal segmento 2L')


    