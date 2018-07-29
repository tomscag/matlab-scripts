%funzione trova cluster
function [c,s,right]=trova_cluster(s,i,j,N)

ip=zeros(N,1); %indicatore i più
im=zeros(N,1);
jp=zeros(N,1); 
jm=zeros(N,1);
ip(1:N-1)=2:N; ip(N)=1;
im(2:N)=1:N-1; im(1)=N;
jp(1:N-1)=2:N; jp(N)=1;
jm(2:N)=1:N-1; jm(1)=N;
c=1;
right=1;
if s(ip(i),j)==1
    s(ip(i),j)=0;
    
    [c1,s]=trova_cluster_old(s,ip(i),j,N);
    c=c+c1;
    right=right+1;
end;

if s(i,jm(j))==1
   s(i,jm(j))=0;
    [c2,s]=trova_cluster_old(s,i,jm(j),N);
    
    c=c+c2;
end;

if s(im(i),j)==1
    s(im(i),j)=0;
    c=c+1;
    [c3,s]=trova_cluster_old(s,im(i),j,N);
    c=c+c3;
  
end;

if s(i,jp(j))==1
    s(i,jp(j))=0;
    [c4,s]=trova_cluster_old(s,i,jp(j),N);
    
    c=c+c4;
end;
    
