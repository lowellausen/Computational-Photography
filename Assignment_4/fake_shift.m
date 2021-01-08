function output = fake_shift(img)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
M = size(img,1);
N = size(img,2);
img = double(img);
output = zeros(M,N);
for x=1:M
    for y=1:N
        output(x,y) = img(x,y)*((-1)^(x+y));
    end
end
output = uint8(output);
end