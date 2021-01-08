function img = my_idft(img_specter)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
M = size(img_specter,1);
N = size(img_specter,2);
img = zeros(M,N);
for x=1:M
    for y=1:N
        sumcoef = 0;
        for u=1:M
            for v=1:N
                sumcoef = sumcoef + img_specter(u,v)*exp(1i*2*pi*((u*x/M)+(v*y/N)));
            end
        end
        img(x,y) = (1/(M*N)) * sumcoef;
    end
end

img = abs(img);

end

