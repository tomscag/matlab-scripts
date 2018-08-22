                    %%% Correletion function %%%
clear; clc;
N=30; %lato del reticolo   
J=2.56;  %beta*J

Niter=3000; N_storie=100;


spin=zeros(N,N,Niter); 

spin(:,:,1)=randi(2,N)*2-3;     % configurazione iniziale
A=zeros(N_storie,1);  B=zeros(N_storie,1); C=zeros(1,N);

for r=1:N
    for i=1:N_storie
        s=ising2Df(N,J,Niter);
        A(i)=s(1,1);
        B(i)=s(1,r);        
    end
    C(r)=(mean(A.*B)-mean(A)*mean(B) ) / (std(A)*std(B));
end;

plot(C,'-d')
title('Lunghezza di correlazione')
xlabel('Distanza r dal sito di riferimento')     
ylabel('C(r)')

