function [E]= ising_energy_old(s,J)

N=size(s,1);   %le dimensioni del lato 1
E=0;

for i=1:N
    for j=1:N
        ip=mod(i,N)+1;
        jp=mod(j,N)+1;
        vicini_prossimi=s(ip,j)+s(i,jp);
        E=E-J*s(i,j)*vicini_prossimi;
    end
end