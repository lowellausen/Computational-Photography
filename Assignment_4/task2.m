cman = imread('cameraman_small.tif');

% (a):
cmanfft = fft2((cman));
rec_cman = inv_dft(cmanfft);

figure;imshow(uint8(rec_cman))

% (b):
cmandft = normal_dft(cman);

inv_cmandft = ifft2(cmandft);

figure; imshow(uint8(inv_cmandft))

% (c) :
ccmandft = normal_dft(cman);
ccmanidft = inv_dft(ccmandft);

figure; imshow(uint8(ccmanidft))