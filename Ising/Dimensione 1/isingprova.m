Nstorie=100;
N=50;
Niter=350;
Jval=0:0.05:1;
ip=zeros(N,1);
ip(1:N-1)=2:N; ip(N)=1;
tic
for i=1:length(Jval)
    for k=1:Nstorie
        
        s=ising1D(N,Jval(i),Niter);
        e=0;
        for h=1:N
            e=e-Jval(i)*s(h)*s(ip(h));
        end
        energia(k,i)=e;
        mag(k,i)=sum(s);
    end
end

%fluttuazioni della magnetizzazione collegate alla suscettività

% figure(1)
%  imagesc(mag)
figure(2)
 imagesc(s)
% figure(3)
%  plot(mean(energia))
% figure(4)
%  imagesc(energia)

toc 
