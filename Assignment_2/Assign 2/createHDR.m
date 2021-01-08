function output = createHDR(imgs,exptime,camres)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n_imgs = size(imgs);

if n_imgs > 0
    im = imread(imgs{1});
    M = size(im, 1);
    N = size(im, 2);
end

result = zeros(6, M, N, 3);

for n = 1:6
    imtemp = imread(imgs{n});
    imtemp = gamma_expansion(imtemp, 1/2.2);
    for channel = 1:3
        for i = 1:M
            for j = 1:N
                result(n, i, j, channel) = exp(camres(imtemp(i, j, channel) + 1, channel)) / exptime(n);
            end
        end
    end
end

output = zeros(M, N, 3);

for channel = 1:3
    for i = 1:M
        for j = 1:N
            soma = 0;
            count = 0;
            for t = 1:size(result, 1)
                if (result(t, i, j, channel) < 255) && (result(t, i, j, channel) > 0)
                    soma = soma + result(t, i, j, channel);
                    count = count+1;
                end
            end
            output(i,j,channel) = soma/count;
        end
    end
end

end

