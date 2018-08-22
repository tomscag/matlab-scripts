%Metodo Watts-Strogatz
function a=small_word(N,p)
a=zeros(N);
for i=1:N
    f=rand;
    if f>p    %crea un link "regolare" con 2 nodi adiacenti
        j=mod(i+N-2,N)+1;
    else
        j=i;
        while j==i || a(i,j)==1;  %entra se UNA almeno è verificata
            j=randi(N);
        end
    end
    a(i,j)=1;
    a(j,i)=1;
   
end
% Ho bisogno di fare un secondo ciclo altrimenti a p=1 otterrei i secondi
% vicini comunque sempre connessi
for i=1:N
    f=rand;
    if f>p    
        j=mod(i+N-3,N)+1; %questa volta connetto i secondi vicini
    else
        j=i;
        while j==i || a(i,j)==1;  
            j=randi(N);
        end
    end
    a(i,j)=1;
    a(j,i)=1;

end

%distanza media
%probabilità di clustering

%while: una volta entra sempre per l'istruzione precedente, 
%ci entra nuovamente se j è ancora lo stesso o becca una casella occupata
%(per sceglierne un altro visto che è già occupato), tutto ciò quando f<p
%cioè quando AVVIENE la riallocazione del link