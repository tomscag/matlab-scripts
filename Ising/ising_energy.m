function [E]= ising_energy(s,N_medie,J,k_0)

N=size(s,1);   %le dimensioni del lato 1
E=zeros(N_medie,1);

ip(1:N-1)=2:N; ip(N)=1;         jp(1:N-1)=2:N; jp(N)=1;
im(2:N)=1:N-1; im(1)=N;         jm(2:N)=1:N-1; jm(1)=N;

for w=1:N_medie
    ener=0;
    for ww=1:k_0 %flippo k_0 prima di calcolare M per far perdere memoria
                 %dello stato precedente
        i=randi([1,N]);
        j=randi([1,N]);
        
       deltaE= 2*J*( s(i,j)*s(ip(i),j)+s(i,j)*s(im(i),j)+ ...
                     s(i,j)*s(i,jp(j))+s(i,j)*s( i,jm(j)) ); 
        p=exp(-deltaE);
        
        v=rand;
        if v<p; s(i,j)=-s(i,j); end
    end
    
     
    for i=1:N
        for j=1:N
            vicini_prossimi=s(ip(i),j)+s(i,jp(j));
            ener=ener-J*s(i,j)*vicini_prossimi;
        end
    end
    E(w)=ener;
end

E=mean(E);
