function average = img_avg(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
M = size(img,1);
N = size(img,2);
img = double(img);
average = 0;
        
for x=1:M
    for y=1:N
        average = average + img(x,y);
    end
end
average = average/(M*N);
end