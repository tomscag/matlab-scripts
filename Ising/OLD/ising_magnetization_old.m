function [M]= ising_magnetization_old(s)

N=size(s,1);
M=0;

for i=1:N
    for j=1:N
        M=M+s(i,j);
    end
end