%funzione trova cluster
%c dimensione cluster; height dimensione verticale; s griglia aggiornata
function [c,s,vert]=trova_cluster(s,i,j,N,vert)

ip=zeros(N,1);     ip(1:N-1)=2:N; ip(N)=1; 
im=zeros(N,1);     im(2:N)=1:N-1; im(1)=N;
jp=zeros(N,1);     jp(1:N-1)=2:N; jp(N)=1;
jm=zeros(N,1);     jm(2:N)=1:N-1; jm(1)=N;

vert(i)=1;
c=1;  

if s(ip(i),j)==1    %controlla sotto
    s(ip(i),j)=0; 
    vert( ip(i) )=1;
    [c1,s,vert]=trova_cluster(s,ip(i),j,N,vert);
    c=c+c1;  
end;

if s(i,jm(j))==1   %controlla a sinistra
    s(i,jm(j))=0;
    [c2,s,vert]=trova_cluster(s,i,jm(j),N,vert);   
    c=c+c2;
end;

if s(im(i),j)==1
    s(im(i),j)=0;
    vert( im(i) )=1;
    [c3,s,vert]=trova_cluster(s,im(i),j,N,vert);
    c=c+c3;  
end;

if s(i,jp(j))==1
    s(i,jp(j))=0;
    [c4,s,vert]=trova_cluster(s,i,jp(j),N,vert);   
    c=c+c4;
end;
    
