%Simulazione Montecarlo di una particella che, partendo dall'origine, a
%step discreti si muove in modo random nelle 3 direzioni


% INPUT: r = raggio della sfera
% OUTPUT: t = numero di step per uscire dalla sfera


function t=contapassi_3D(r)

x=0; y=0;  z=0;
t=0;

while x^2+y^2+z^2<r^2
    
    t=t+1;
    ind=intero_casuale([1/6,1/6,1/6,1/6,1/6,1/6]);
    switch ind
        case 1
            x=x+1;
        case 2
            x=x-1;
        case 3
            y=y+1;
        case 4
            y=y-1;
        case 5
            z=z+1;
        case 6
            z=z-1;      
    end    
end