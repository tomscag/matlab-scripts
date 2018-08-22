                        %%%Distribuzione Uniforme%%%
clear; clc;

N=1200; %numero tempi
M=25000;
lambda=1;
x=zeros(M,N);
r=zeros(M,N);
mask=zeros(M,N);   
Nbin=50; %bins istogramma

for i=1:M
    record=-inf;
    for t=1:N
        
        x(i,t)=rand;
        if x(i,t)>record
            record=x(i,t); %record al tempo t
            mask(i,t)=1;
        else
            r(i,t)=r(i,t-1);
            mask(i,t)=0;
        end
        r(i,t)=record;
    end
end

%%%Record medio al tempo t   ~
rmedio= mean(r); %(la media e' sulle colonne)


%%% Distribuzione vita media dei record, ovvero la probabilita' che un record
%%% sopravviva per un tempo m

%non so a priori quanto sara' lungo a
r=1; 
s=0; %segnaposto per terzo esercizio

for i=1:M
    for j=1:N
        if mask(i,j)==1
            a(r)=1; %appena trova un record segna uno su un elemento di a
            r=r+1;  % e si sposta sul successivo
            s=s+1;  % cos� sapr� quanti record ci sono per ogni storia
        else
            a(r-1)=a(r-1)+1;   % se non trovo un record
            % aggiungo uno sullo stesso di prima (che ora � r-1),
            %cos� hist(a) mi d� la probabilit� che duri m
        end
    end
    
    d(i)= a( s ); % cos� estrapolo da a quanto durano gli ultimi record
end

T=1:100;
subplot(2,2,1)
plot(T,rmedio(T),'d',T,T./(1+T),'-') % Retta per l'esponenziale; logaritmo per uniforme
title('Record medio - Distribuzione uniforme')
h=legend('Simulazione','$\frac{T}{1+T}$','Location','southeast');
set(h,'Interpreter','latex','FontSize',12)
ylabel('<R(t)>')
xlabel('Tempo')
grid on

subplot(2,2,2)
j=histogram(a)
title('Distribuzione lunghezza dei record, uniforme')
xlabel('T')

subplot(2,2,3)
bin=j.Values; num=j.NumBins;
semilogy(1:num,bin,'d',1:num,1./(1:num)*M,'-') %1/1:num � quella teorica
title('Universal lifetime record distribution')
h=legend('Simulazione','$\frac{1}{T}$');
set(h,'Interpreter','latex','FontSize',12);
xlabel('T');
grid on

subplot(2,2,4)
histogram(d,Nbin,'Normalization','probability');
hold on
plot(1:N,1/Nbin*ones(N,1),'LineWidth',1.5);
h=legend('Sperimentale','Uniforme')
set(h,'Interpreter','latex')
title('Distribuzione ultimo record - Normalizzato')
xlabel('T');

       
       
            
            