%Probabilit� Percolazione
%bwconncomp funzione gi� impolementata in image toolbox matlab 
%N=50 t=180; N=100 t=760
clear; clc;
N=75; N_storie=60; %ripetizioni per ogni p
p=[0.01:0.01:0.50, 0.51:0.005:0.60, 0.61:0.01:1];     len=length(p);

s=zeros(N,N,len);

ip(1:N-1)=2:N; ip(N)=1;
im(2:N)=1:N-1; im(1)=N;
jp(1:N-1)=2:N; jp(N)=1;
jm(2:N)=1:N-1; jm(1)=N;

percolazione=zeros(N_storie,len);  strength=zeros(N_storie,len);
S=zeros(N_storie,len); RACS=zeros(N_storie,len); dim=zeros(N_storie,len);

for b=1:N_storie
    s=genera_griglie(N,p); %genera un insieme di griglie s(N,N,len)
    b   %per tenere conto dei progressi
    for z=1:len    
        [dim,perc ]=analizza_griglia( s(:,:,z) ) ;
        percolazione(b,z)=perc;
        S(b,z)=sum( dim .^2 )/sum(dim); %Mean cluster size
        RACS(b,z)= ( sum( dim.^2 )- max( dim.^2 ) )/sum(dim); %Reduced S
        strength(b,z)= max( dim)/sum(dim); %Probabilit� che un sito occupato
                                    %appartenga al cluster massimo
    end
end

S=mean( S );
RACS= mean( RACS );
strength=mean(strength);   %strength of infinite network
percolazione=mean ( percolazione );

%%%FIT RACS%%%
x=p(find( p>0.5 & p<0.6)); y=RACS(find( p>0.5 & p<0.6)); %cerco gli indici delle ascisse intorno al picco
f=polyfit(x,y,2);
f1=polyval(f,x);
P_crit=-f(2)/(2*f(1));

%%%ESPONENTI CRITICI%%%
x_fit=find( p>P_crit & p<0.7);

Fit_Str=polyfit(log(p(x_fit)-P_crit),log( strength(x_fit) ),1);
Fit_S= polyfit( log(p(x_fit)-P_crit), log( S(x_fit) ),1)


str=sprintf('Reticolo di lato %i',N);

subplot(2,2,1)
plot(p,S,'-d')
title('Mean Cluster Size')
xlabel('p')
grid on

subplot(2,2,2)
hold on
plot(p,RACS,'-d')
plot(x,f1,'red')
title('Reduced Average Cluster Size')
legend('Data','Fit')
text(0.3,70,['P_c=' num2str(P_crit)])
xlabel('p')
grid on

subplot(2,2,3)
plot(p,strength,'-dr')
title('Strenght of the infinite network')
xlabel('p')
grid on

subplot(2,2, 4 )
plot(p,percolazione,'-dr')
title('Probabilit� di percolazione')
xlabel('p')
grid on
