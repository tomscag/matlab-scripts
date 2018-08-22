
%Si genera un numero intero casuale i compreso tra 1 e
%length(p) con la distribuzione data dal vettore p

%INPUT:  p= vettore di probabilita'
%OUTPUT: i= intero causale


function i=intero_casuale(p) 

pp=cumsum(p); %distribuzione cumulativa
x=rand;
i=1;
while x>pp(i)
    i=i+1;
end




