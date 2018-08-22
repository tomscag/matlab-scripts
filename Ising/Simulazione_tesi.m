%%%attento alla funzione randi! C'è un' incompatibilità che va risolta in
%%%un toolbox che hai aggiunto

clear
tic
%T=2.2692;
T=3;
J=1/T;
N=75;

Niter=20000000;

s=zeros(N,N);
s(:,:)= randi(2,N)*2-3; 

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
toc
imagesc(s)