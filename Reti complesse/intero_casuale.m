%p vettore di probabilità 


function i=intero_casuale(p) 


N=length(p);
pp=cumsum(p);
x=rand;
i=1;
while x>pp(i)  %esce quando la condizione è falsa
    i=i+1;
end;




