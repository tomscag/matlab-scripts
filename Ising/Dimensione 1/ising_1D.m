clear;
%modello di ising 1D
% vogliamo tante configurazioni campionate come boltzman
N=400; %numero di spin   
J=2;  %beta*J
Niter=9000; %numero di iterzioni
ip=zeros(N,1); %i più
im=zeros(N,1);
ip(1:N-1)=2:N; ip(N)=1;
im(2:N)=1:N-1; im(1)=N;
spin=zeros(N,Niter);

%%% configurazione iniziale
% spin(:,1)=rand(N,1);
% spin(:,1)=(spin(:,1)>0.5)==1;

for k=1:N; f=rand; if f<0.5; spin(k,1)=-1; else spin(k,1)=1; 
    end;
end;

%iteriamo
for k=2:Niter
    s(:,1)=spin(:,k-1);
    
       i=randi([1,N]);
        deltaE=2*J*(s(i)*s(ip(i))+s(i)*s(im(i))); %variazione energia col flip
        p=exp(-deltaE); %probabilità di flippare
       
        v=rand; 
        if v<p; s(i)=-s(i); end

    spin(:,k)=s;
end
        
imagesc(spin)