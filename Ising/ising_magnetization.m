% Questa funzione prende in ingresso un reticolo s che DEVE essere all'
% equilibrio e ne calcola la magnetizzazione come media termodinamica.
% La frequenza delle configurazioni derivanti dall'evoluzione riproduce 
% la probabilità di Boltzmann; bisogna solo accertarsi che lo stato
% successivo che si va a campionare sia indipendente dal precedente: per
% questo si flippa k_0 volte lo spin prima di procedere a un nuovo
% campionamento


function [M]= ising_magnetization(s,N_medie,J,k_0)

N=size(s,1);
M=zeros(N_medie,1);

ip(1:N-1)=2:N; ip(N)=1;         jp(1:N-1)=2:N; jp(N)=1;
im(2:N)=1:N-1; im(1)=N;         jm(2:N)=1:N-1; jm(1)=N;

for w=1:N_medie
    mag=0;
    for ww=1:k_0 %flippo k_0 prima di calcolare M per far perdere memoria
                 %dello stato precedente      
        i=randi([1,N]);
        j=randi([1,N]);
        
       deltaE= 2*J*( s(i,j)*s(ip(i),j)+s(i,j)*s(im(i),j)+ ...
                    s(i,j)*s(i,jp(j))+s(i,j)*s(i,jm(j)) ); 
        p=exp(-deltaE);
        
        v=rand;
        if v<p; s(i,j)=-s(i,j); end
    end
 
    for i=1:N
        for j=1:N
            mag=mag+s(i,j);
        end
    end
    
    M(w)=mag;
end

M=mean(M);