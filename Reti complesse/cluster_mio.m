%%%clustering coefficien fai da te
function C= cluster(a)

for i=1:N
    for j=1:i   %matrice simmetrica, scansiono la parte inferiore
        if a(i,j)==1
            