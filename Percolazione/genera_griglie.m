function s= genera_griglie(N,p)

len=length(p);  
s=zeros(N,N,len);

for z=1:len
    s(:,:,z)=rand(N);
    s(:,:,z)=s(:,:,z)<p(z)==1;
end