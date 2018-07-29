%%% Analizza griglia
function [dim,percolazione]=  analizza_griglia(s)
r=1;  N=size(s,1); percolazione=0;
dim=0;
for i=1:N
    for j=1:N
        
        if s(i,j)==1 %trovo un primo cluster
            s(i,j)=0; %lo etichetto così in modo da non ripassarci più
            vert=zeros(1,N); %vettore che segna le righe del cluster occupate
            [c,s,vert]=trova_cluster(s,i,j,N,vert);
            height=sum(vert,2);
            dim(r)=c; % dimensione r-esimo cluster
            if height==N   %vedo se esiste un cluster largo quanto il bordo
                percolazione=1;
            end
            r=r+1;
        end
        
    end
end