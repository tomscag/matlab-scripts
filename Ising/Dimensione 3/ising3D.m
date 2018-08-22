            %%%ISING 3D%%%
clear; clc;
N=10;
J=[0.8,0.6,0.5,0.4,0.3,0.2]; len=length(J);  
N_iter=400000;   T=1./J;
mag=zeros(1,len);

for i=1:len
    s=ising3Df(N,J(i),N_iter);
    mag(i)=abs(ising_magnetization_3D(s));
end

plot(T,mag,'b-*')
title('Magnetizzazione Ising 3D')
xlabel('Temperatura')
%scatter3(s)