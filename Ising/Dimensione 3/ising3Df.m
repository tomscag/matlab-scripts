%%% ISING 3D
function s=ising3Df(N,J,Niter)
 
s=zeros(N,N,N);

s(:,:,:)= randi(2,N,N,N)*2-3;   % configurazione iniziale

for w=2:Niter
       
    i=randi([1,N]);     j=randi([1,N]);     k=randi([1,N]);
      
    ip=mod(i,N)+1;     jp=mod(j,N)+1;       kp=mod(k,N)+1;
    im=mod(i+N-2,N)+1; jm=mod(j+N-2,N)+1;   km=mod(k+N-2,N)+1;
    
    
    deltaE=2*J*( s(i,j,k)*s(ip,j,k)+s(i,j,k)*s(im,j,k)+ ...
                 s(i,j,k)*s(i,jp,k)+s(i,j,k)*s(i,jm,k)+ ...
                 s(i,j,k)*s(i,j,kp)+s(i,j,k)*s(i,j,km)  ); %variazione energia col flip
    p=exp(-deltaE); %probabilità di flippare
    
    v=rand;
    if v<p; s(i,j,k)=-s(i,j,k); end
   
end
