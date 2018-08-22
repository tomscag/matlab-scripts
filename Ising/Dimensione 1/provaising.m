clear;
%modello di ising 1D
% vogliamo tante configurazioni campionate come boltzman
 N=500; %numero di spin   
 J=2;  %beta*J
 Niter=300; %numero di iterazioni
ip=zeros(N,1); 
im=zeros(N,1);
ip(1:N-1)=2:N; ip(N)=1; %condizioni cicliche
im(2:N)=1:N-1; im(1)=N;
spin=zeros(N,Niter); % a ogni tempo mi da la configurazione
%%% configurazione iniziale
spin(:,1)=ones(N,1);
for k=1:N; f=rand; if f<0.5; spin(k,1)=-1; else spin(k,1)=1; 
    end;
end;
%iteriamo
for k=2:Niter
    s(:,1)=spin(:,k-1);
    
    %for i=1:N
        i=randi([1,N]);

        deltaE=2*J*(s(i)*s(ip(i))+s(i)*s(im(i)));
        p=exp(-deltaE); %probabilità di flippare
        
        v=rand; 
        if v<p; s(i)=-s(i); end
    %end
    spin(:,k)=s;
end
        
  imagesc(spin)
