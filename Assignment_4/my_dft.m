function img_specter = my_dft(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
M = size(img,1);
N = size(img,2);
img = double(img);
img_specter = zeros(M,N);
for x=1:M
    for y=1:N
        sumcoef = 0;
        for u=1:M
            for v=1:N
                sumcoef = sumcoef + img(u,v)*exp(-1i*2*pi*((u*x/M)+(v*y/N)));
            end
        end
        img_specter(x,y) =sumcoef;
    end
end
end

