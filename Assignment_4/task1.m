cman = imread('cameraman.tif');


cmanfft = fft2((cman));

cmanreal = uint8(ifft2(real(cmanfft)));
cmanimag = uint8(ifft2(cmanfft - real(cmanfft)));

imshow(cmanreal)

figure;imshow(cmanimag)