%%% Ising dinamico con metodo montecarlo
% OUTPUT s reticolo NxN alla temperatura J=1/T dopo Niter iterazioni

function s=ising2Df(N,J,Niter)
 
s=zeros(N,N);
s(:,:)= randi(2,N)*2-3;   % configurazione iniziale

ip(1:N-1)=2:N; ip(N)=1;         jp(1:N-1)=2:N; jp(N)=1;
im(2:N)=1:N-1; im(1)=N;         jm(2:N)=1:N-1; jm(1)=N;

for k=2:Niter
    
    i=randi([1,N]);
    j=randi([1,N]);
    
    
    deltaE= 2*J*( s(i,j)*s(ip(i),j)+s(i,j)*s(im(i),j)+ ...
                  s(i,j)*s(i,jp(j))+s(i,j)*s( i,jm(j)) );  
    p=exp(-deltaE); %probabilità di flippare
    
    v=rand;
    if v<p; s(i,j)=-s(i,j); end
    
end

