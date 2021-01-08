cman = imread('cameraman.tif');

% (a):
cmanfft = fft2(cman);
cmanshift = fftshift(cmanfft);
cmanifft = ifft2(cmanshift);

figure; imshow(uint8(cmanifft))

% (b):
cmanpower = fake_shift(cman);

figure; imshow(cmanpower)
