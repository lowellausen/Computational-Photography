cman = imread('cameraman.tif');

cmanfft = fft2(cman);

phase = angle(cmanfft);
cmanphase = ifft2(exp(1i*phase));

magnitude = abs(cmanfft);
cmanmagnitude = ifft2(magnitude);

figure; imshow(uint8(cmanmagnitude))
figure; imshow(uint8(real(cmanphase)*5000 + 125))
%figure; imshow(uint8(ifft2(exp(1i*phase).*magnitude)))
