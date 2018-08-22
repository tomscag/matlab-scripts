%Studio del tempo medio di attesa per
%stabilire un nuovo record
% drawnow
clear;
r=25;   % circonferenza traguardo
nmax=10000;   
record=zeros(1,nmax); 
a=zeros(1,nmax);
t=0;

for j=1:nmax   
    a(j)=inf;
end

str=sprintf('random walk in circonferenza di raggio %d ' , r);
disp(str)

for i=1:nmax   
  a(i)=contapassi_3D(r);  
  record(i)=min(a);
end


plot(1:nmax, record)
title('Andamento dei record nel tempo')
ylabel('Record'); xlabel('Time')

str1=sprintf('The best record after %d step is %d', [nmax, min(record)])
disp(str1)

    
    