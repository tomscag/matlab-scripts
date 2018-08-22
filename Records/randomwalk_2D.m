
function t=randomwalk_2D(r)
x=0; y=0;
t=0; h = animatedline;

while x^2+y^2<r^2   
    t=t+1;
    R=esponenziale(1);
    Ang=rand*2*pi;
    x=R*cos(Ang);
    y=R*sin(Ang);
    addpoints(h,x,y);
    drawnow limitrate
    pause
end