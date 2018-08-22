                %%% Suscettività e Calore Specifico ISING 2D %%%
clear;
N=16;
% J_c = 0.44 
%A basse temperature serve N_iter molto grande per l'equilibrio >10^6
J=[0.5,0.46,0.45, 0.44,0.43,0.42,0.4,0.38,0.35];  
len=length(J);   T=1./J;

N_iter=10000;
N_storie=5;
mag=zeros(N_storie,len);
energia=zeros(N_storie,len);

for i=1:len
    for k=1:N_storie
        s=ising2Df(N,J(i),N_iter);
        mag(k,i)=abs(ising_magnetization_old(s));
        energia(k,i)=ising_energy_old(s,J(i));
    end
end

suscettivita=var(mag)./T;      calore_specifico=var(energia)./T.^2;
%%%FIT%%%
x=find(J<0.50 & J>0.40);
y=suscettivita(x);
f=polyfit(x,y,2);
f1=polyval(f,x);
J_crit=-f(2)/(2*f(1));

str=sprintf('Magnetizzazione (Reticolo di lato %i)',N);

subplot(2,2,1)
plot(T,mean(mag),'-d')
title(str)
xlabel('Temperatura (J/k)')

subplot(2,2,3)
plot(T,suscettivita,'-d')
title('Suscettività')
xlabel('Temperatura (J/k)')


subplot(2,2,4)
plot(T,calore_specifico,'red-d')
title('Calore Specifico')
xlabel('Temperatura (J/k)')

subplot(2,2,2)
plot(T,mean(energia),'red-d')
title('Energia')
xlabel('J')

%raffreddamento ising, beta grande: calcolare la frazione di spin che non
%hanno flippato al tempo t --> va come t^-1/2
%Trova anche la fase ferromagnetica con J negativi




