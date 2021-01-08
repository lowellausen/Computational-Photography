function output = global_tone_mapping(img)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
M = size(img, 1);
N = size(img, 2);
delta = 0.01;
sumL = 0;
imgLumi = zeros(M, N);

for m = 1:M
    for n = 1:N
        imgLumi(m,n) = 0.299*img(m,n,1) + 0.587* img(m,n,2) + 0.114*img(m,n,3);
        sumL = sumL + log(imgLumi(m,n) + delta);
    end
end
ltemp = sumL/(M*N);
ltil = exp(ltemp);
%ltil = exp((1/M*N) * sumL);
lsimg = zeros(M, N);
for m = 1:M
    for n = 1:N
        lsimg(m,n) = (0.18/ltil) * imgLumi(m,n);
    end
end
lumifinal = zeros(M, N);
result = zeros(M,N,3);
for m = 1:M
    for n = 1:N
        lumifinal(m,n) = max([min([lsimg(m,n)/(1+lsimg(m,n)), 1]), 0]);
        for i = 1:3
            result(m,n,i) = img(m,n,i)*lumifinal(m,n)/imgLumi(m,n);
        end
    end
end

output = uint8((result.^(1/2.2))*255);
end

