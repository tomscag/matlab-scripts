                    %%% Ising 2D Grafica  %%%

clear; clc;
N=50;   % Lato reticolo
J=1;    %

tic
N_iter=50; 
ip=zeros(N,1);      ip(1:N-1)=2:N; ip(N)=1; 
im=zeros(N,1);      im(2:N)=1:N-1; im(1)=N;
jp=zeros(N,1);      jp(1:N-1)=2:N; jp(N)=1;
jm=zeros(N,1);      jm(2:N)=1:N-1; jm(1)=N;


spin=zeros(N,N,N_iter); 

spin(:,:,1)=randi(2,N)*2-3;     % configurazione iniziale

for k=2:N_iter
    s(:,:,1)=spin(:,:,k-1);
    k
    for boh=1:N^2
       i=randi([1,N]);
       j=randi([1,N]);
        deltaE= 2*J*( s(i,j)*s(ip(i),j)+s(i,j)*s(im(i),j)+ ...
                    s(i,j)*s(i,jp(j))+s(i,j)*s(i,jm(j)) ); %variazione energia col flip
        p=exp(-deltaE); %probabilità di flippare
       % mag(k)=ising_magnetization(s);
        v=rand; 
        if v<p; s(i,j)=-s(i,j); end
    end

    spin(:,:,k)=s;
end
toc
for i=1:N_iter  %da 1500 in poi per avere equilibrio
    a=squeeze(spin(:,:,i));  
    imagesc(a)
    pause(0.25)
end


%fluttuazioni energia e magnetizzazione totale vs temperatura(J)