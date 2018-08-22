%Questa si conserva ogni storia
function s=ising2Df_imagesc(N,J,Niter)
 
spin=zeros(N,N,Niter);
spin(:,:,1)= randi(2,N)*2-3;   % configurazione iniziale

for k=2:Niter
    s(:,:,1)=spin(:,:,k-1);
    
    i=randi([1,N]);
    j=randi([1,N]);
    ip=mod(i,N)+1;     jp=mod(j,N)+1;
    im=mod(i+N-2,N)+1; jm=mod(j+N-2,N)+1;
    
    deltaE=2*J*( s(i,j)*s(ip,j)+s(i,j)*s(im,j)+ ...
                 s(i,j)*s(i,jp)+s(i,j)*s(i,jm) ); %variazione energia col flip
    p=exp(-deltaE); %probabilità di flippare
    
    v=rand;
    if v<p; s(i,j)=-s(i,j); end
    
    spin(:,:,k)=s;
end