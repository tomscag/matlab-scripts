%percolazione vecchia

clear;
N=20;
p=0.4
s=zeros(N,N);
ip=zeros(N,1); %indicatore i più
im=zeros(N,1);
jp=zeros(N,1); 
jm=zeros(N,1);

ip(1:N-1)=2:N; ip(N)=1;
im(2:N)=1:N-1; im(1)=N;
jp(1:N-1)=2:N; jp(N)=1;
jm(2:N)=1:N-1; jm(1)=N;
%generazione griglia


for i=1:N
    for j=1:N
        if rand < p 
            s(i,j)=1;
        end
    end
end
imagesc(s) 
y=s;



r=1;
for i=1:N
    for j=1:N
        
        if s(i,j)==1
           s(i,j)=0;
           [c,s]=trova_cluster_old(s,i,j,N);
           cl(r)=c;
           r=r+1;        

        end
   
    end
end


figure

subplot(1,2,1), histogram(cl,20)
subplot(1,2,2) , imagesc(y)
%cl
 
mean(cl)
  
  % 1,1,1,1,--->2,2,2--->3,3---->5

  
%   i=1; j=1;
%   if s(i,j)==1
  