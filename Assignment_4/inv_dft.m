function img = inv_dft(img_specter)


M = size(img_specter,1);
N = size(img_specter,2);

img = zeros(M,N);

for x=0:M - 1
    for y=0:N - 1
        dftsum = 0;
        for u=0:M - 1
            for v=0:N - 1
                dftsum = dftsum + img_specter(u + 1,v + 1)*exp(1i*2*pi*((u*x/M)+(v*y/N)));
            end
        end
        img(x + 1,y + 1) = (1/(M*N)) * dftsum;
    end
end

img = abs(img);

end