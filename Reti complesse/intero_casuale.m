%p vettore di probabilit� 


function i=intero_casuale(p) 


N=length(p);
pp=cumsum(p);
x=rand;
i=1;
while x>pp(i)  %esce quando la condizione � falsa
    i=i+1;
end;




