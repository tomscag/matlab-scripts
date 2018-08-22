                %%%  Ising 2D AUTOCORRELAZIONE  %%%
clear; clc;
N=25;   
J=[0.1,0.44,0.8];  len=length(J);
N_equi=10000;
N_iter=100;     N_storie=20;
ip=zeros(N,1);      ip(1:N-1)=2:N; ip(N)=1; 
im=zeros(N,1);      im(2:N)=1:N-1; im(1)=N;
jp=zeros(N,1);      jp(1:N-1)=2:N; jp(N)=1;
jm=zeros(N,1);      jm(2:N)=1:N-1; jm(1)=N;
mag=zeros(N_storie,N_iter);
ACF=zeros(len,N_iter-1); %Autocorrelazione media
autocorr=zeros(N_storie,N_iter-1);

for w=1:len
    for b=1:N_storie
        s= ising2Df(N,J(w),N_equi);
  
        for k=1:N_iter
            i=randi([1,N]);
            j=randi([1,N]);
            
            deltaE= 2*J(w)*( s(i,j)*s(ip(i),j)+s(i,j)*s(im(i),j)+ ...
                s(i,j)*s(i,jp(j))+s(i,j)*s( i,jm(j)) );
            p=exp(-deltaE);
            
            v=rand;
            if v<p; s(i,j)=-s(i,j); end
            m=0;
            for i=1:N
                for j=1:N
                    m=m+s(i,j);
                end
            end
            mag(b,k)=abs( m );
            
        end
        mag(b,:);  %mag media di una storia
        
        autocorr(b,:)= acf( mag(b,:)' , N_iter-1 )';
        
    end
    ACF(w,:)=mean(autocorr);
end
%devo calcolare c(k) per ogni storia 
 hold on
 plot( ACF(1,:))
 plot( ACF(2,:))
 plot( ACF(3,:))   
 title('Autocorrelazione Ising')
 xlabel('Evoluzione (passi)')
 ylabel('Autocorrelazione')
 legend('Alta temperatura','Temperatura Critica', 'Bassa Temperatura')

% corr(k,w)=(mean( a.*c ) - mean( a )*mean( c)  )/ (std(a)*std(c))  ;
% corr(b,k)=(mean( a.*c ) - mean( a )*mean( c)  )/ (mean(a.*a)-mean(a)^2)
%corr(b,k)=( mean( mag(b,1).*mag(b,k))   - mean(mag(b,:))^2 ) / var(b,:) ;;
