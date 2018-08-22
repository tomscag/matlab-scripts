% Andamento (medio) del numero di passi necessari per uscire da una
% circonferenza tramite random walk al variare del raggio
clear; clc;
rmax=10;    M=350;

for i=1:rmax
    for j=1:M
        y(j)=contapassi(i);
    end;
    
    a(i)=mean(y);
    b(i)=std(y)/sqrt(M);
    
end;

errorbar( 1:rmax, a,b)
xlabel('Raggio')
ylabel('Numero passi medi')
title('Random Walk')