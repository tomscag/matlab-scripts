%reti complesse
%newman mark introduction to complex network
%algoritmo di Dijkstra
%brain connettivity toolbox

%Una rete small word � caratterizzata da un piccolo L, minimo cammino
%medio, e un alto coefficiente di clustering. Per crearne una utilizzeremo
%il metodo di Watts-Strogatz, che parte da una rete regolare (un anello) e
%la modifica riallocando ogni legame con una probabilit� p, che rappresenta
%il parametro di controllo 
clear; N_storie=100;   N=350;

p=logspace(-4,1,30);    len=length(p);
for  i=1: len   
    i
    for k=1:N_storie
        A=small_word(N,p(i));
        coefficient=clustering_coef_bu(A);
        Shortest_path_matrix=distance_bin(A);
        G(k,:)=sum(A,2);   %vettore dei gradi di ogni nodo AGGIUSTA       
        Distance(k,i)=mean ( mean   (Shortest_path_matrix)  );
        Cluster(k,i)=mean(coefficient);
    end
%  P(:,i)=histcounts(G);  
end
Cluster=mean(Cluster)./max(Cluster(:,1) );
Distance=mean(Distance)./max(Distance(:,1));

semilogx(p,Cluster,'-o',p,Distance,'-o red')
legend('Coefficiente di clustering','Probabilit� di riallocazione')
title('Rete small world - Modello di Watts Strogatz')
xlabel('Probabilit� di riallocazione')
text(1,0.7,['N_{nodi}=' num2str(N)])
grid on

% subplot(1,2,1)
% semilogx(p,Cluster,'-d')
% title('Coefficiente di clustering')
% xlabel('Probabilit� di riallocazione')
% ylabel('C/max C(0)')
% subplot(1,2,2)
% semilogx(p,Distance,'-d red')
% title('Minimo cammino medio')
% xlabel('Probabilit� di riallocazione')
% ylabel('L/max L(0)')






