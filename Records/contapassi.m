%conta i passi per raggiungere la circonferenza di raggio r partendo da 0,0

function t=random_walk_2D(r)
x=0; y=0;
t=0;
while x^2+y^2<r^2
    
    t=t+1;
    ind=intero_casuale([0.25,0.25,0.25,0.25]);
    switch ind
    case 1
        x=x+1;
    case 2
        x=x-1;
    case 3
        y=y+1;
    case 4
        y=y-1;
    end
       
end