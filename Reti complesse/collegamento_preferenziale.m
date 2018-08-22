clear; clc;
N=10000; k0=0.0; %coefficiente di democraticità: k0=1 scegliamo sempre in modo uniforme, k0=0 
                 % usiamo sempre il preferential attachment
a=zeros(N);  %all'inizio N nodi isolati
a(1,2)=1; a(2,1)=1;
c=sum(a);   %qui staranno i gradi dei nodi
N_storie=10;  
%P=zeros(K,N_storie);
for k=1:N_storie
    k
    for h=2:N-1   %aggiungo un nodo
        f=rand;
        if f<k0
            p=ones(h,1)/h;  %p equamente distribuite
            q=intero_casuale(p);
            a(h+1,q)=1; a(q,h+1)=1;
            c(q)=c(q)+1;
            c(h+1)=1;  %credo vada messo anche qui
        else
            p=c(1:h)/sum(c(1:h));%linear pref attachment
            q=intero_casuale(p);
            a(h+1,q)=1; a(q,h+1)=1;
            c(q)=c(q)+1;
            c(h+1)=1;    %al nuovo nodo do grado uno
        end
    end
    K=max(c); %grado massimo esistente
    for w=1:K
        P(k,w)=length(find(c==w));  %trova per ogni grado quanti ce ne sono
                                    %nel vettore dei gradi c     
    end    
end

P1=mean(P);
K_m=size(P,2); %numero colonne (gradi)

%str = sprintf('k_{0}=%f',k0);

%%%FIT legge di scala
P1=P1(P1~=0);
m=polyfit(log(1:25 ),log(P1(1:25)),1)

subplot(1,2,1)
plot(1:5,P1(1:5),'o',1:5,(1:5).^m(1)*10000,'-')
title('Preferential Attachment')
xlabel('Degree (k)')
ylabel('Numero medio nodi') 
h=legend('C(k)~k^{-\alpha}','Fit');
set(h,'FontSize',14)
text(3.5,8000,['\alpha=',num2str(-m(1))])
text(3.5,7500,['k_0=',num2str(k0)])
text(3.5,7000,['N_{nodi}=',num2str(N)])
grid on

subplot(1,2,2)
plot(5:10,P1(5:10),'o',5:10,(5:10).^m(1)*10000,'-')
title('Preferential Attachment')
xlabel('Degree (k)')
ylabel('Numero medio nodi') 
h=legend('C(k)~k^{-\alpha}','Fit');
set(h,'FontSize',14)
text(8,55,['\alpha=',num2str(-m(1))])
text(8,50,['k_0=',num2str(k0)])
grid on

%zooomando in vari punti si osserva lo stesso andamento (invarianza di
%scala)
%qui trovo degli hub la cui grandezza scala come il sistema, grazie a k0