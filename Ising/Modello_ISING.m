                            %%%%%%%%%%%%%%%%%%%%%%
                            %%% ISING MODEL 2D %%%
                            %%%%%%%%%%%%%%%%%%%%%%
                            
clear; clc;
N=10;
T=[1.2,1.5,1.8,1.9, 2.05:0.025:2.6, 2.75, 3,3.5,4,5]; %Temperature 
%J=[1.2,0.8,0.7,0.6,0.5,0.46,0.45, 0.44,0.43,0.42,0.4,0.38,0.35,0.30, 0.20];  
J=1./T;   len=length(J);   

N_equi=1500000;   %Iterazioni per raggiungere l'equilibrio
N_storie=10;    N_medie=50;   
k_0=50;   %Dopo k_0 iterazioni si perde memoria della configurazione preced
mag=zeros(N_storie,len);
energia=zeros(N_storie,len);

%Dobbiamo prima raggiungere l'equilibrio, poi campionare ogni tot passi
%(tali che il sistema perda memoria)

for i=1:len
    T(i)
    for k=1:N_storie
        
        s=ising2Df(N,J(i),N_equi);
        mag(k,i)=abs( ising_magnetization(s,N_medie,J(i),k_0) );
        energia(k,i)= ising_energy( s,N_medie,J(i),k_0);
    end
end

suscettivita=var(mag)./T;      calore_specifico=var(energia)./T.^2;
%%%FIT SUSCETTIVITA%%%
x=find(T<2.7 & T>2.1);  % x dà gli indici
y=suscettivita(x);
f=polyfit(T(x),y,2);   %trova i coefficienti di un polinomio di grado 2
fit=polyval(f,T(x));
T_crit=-f(2)/(2*f(1));      J_crit=1/T_crit;

%%%FIT CALORE SPECIFICO%%%
y2=calore_specifico(x);
f2=polyfit(T(x),y2,2);   
fit2=polyval(f2,T(x));
T_crit2=-f2(2)/(2*f2(1));   J_crit2=1/T_crit2;

str=sprintf('Magnetizzazione - Reticolo di lato %i',N);

subplot(2,2,1)
plot(T,mean(mag),'-d')
title(str)
xlabel('Temperatura (K)')
grid on

str1=sprintf('Suscettività');
subplot(2,2,3)
hold on
plot(T,suscettivita,'-d',T(x),fit,'-red')
title(str1)
xlabel('Temperatura (K)')
legend('Simulazione','Fit')
text(4,3000,{['T_c=' num2str(T_crit)]})
text(4,2000,{['J_c=' num2str(J_crit)]})
grid on


subplot(2,2,4)
hold on
plot(T,calore_specifico,'red-d')
plot(T(x),fit2,'-black')
title('Calore Specifico')
xlabel('Temperatura (K)')
legend('Simulazione','Fit')
text(4,65,{['T_c=' num2str(T_crit2)]})
text(4,45,{['J_c=' num2str(J_crit2)]})
grid on

subplot(2,2,2)
plot(T,mean(energia)./N^2,'red-d')
title('Energia media per sito')
xlabel('Energia (J)')
grid on
%raffreddamento ising, beta grande: calcolare la frazione di spin che non
%hanno flippato al tempo t --> va come t^-1/2
%Trova anche la fase ferromagnetica con J negativi
