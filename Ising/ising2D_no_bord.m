function s=ising2D_no_bord(N,J,Niter)
 
spin=zeros(N,N,Niter); 

%%% configurazione iniziale
for k=1:N;
    for j=1:N  
        f=rand; if f<0.5; spin(k,j,1)=-1; else spin(k,j,1)=1; end;       
    end
end

ip=zeros(N,1); jp=zeros(N,1); 
im=zeros(N,1); jm=zeros(N,1);

ip(1:N-1)=2:N; jp(1:N-1)=2:N;
im(2:N)=1:N-1; jm(2:N)=1:N-1;


for k=2:Niter
    s(:,:,1)=spin(:,:,k-1);
    
    i=randi([1,N]);
    j=randi([1,N]);
    
    deltaE=2*J*( s(i,j)*s(ip(i),j)+s(i,j)*s(im(i),j)+ s(i,j)*s(i,jp(j))+s(i,j)*s(i,jm(j)) ); %variazione energia col flip
    p=exp(-deltaE); %probabilità di flippare
    
    v=rand;
    if v<p; s(i,j)=-s(i,j); end
    
    spin(:,:,k)=s;
end