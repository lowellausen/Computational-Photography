function my_dft = normal_dft(img)

M = size(img,1);
N = size(img,2);

img = double(img);
my_dft = zeros(M,N);
for u=0:M - 1
    for v=0:N - 1
        dftsum = 0;
        for x=0:M - 1
            for y=0:N - 1
                dftsum = dftsum + img(x +1,y + 1)*exp(-1i*2*pi*((u*x/M)+(v*y/N)));
            end
        end
        my_dft(u+1,v+1) =  dftsum;
    end
end
end

