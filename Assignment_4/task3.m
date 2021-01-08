cman = imread('cameraman.tif');

% (a):
cmanfft = fft2(cman);
cmanfft(1,1) = 0;

cmanifft = ifft2(cmanfft);

imshow(uint8(cmanifft))

% (b):
average = mean2(cman);
cman_subbed = cman - average;

figure; imshow(cman_subbed)

