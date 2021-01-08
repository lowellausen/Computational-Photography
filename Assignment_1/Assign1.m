cfa = loadDNG('image.dng');
imshow(cfa);

demosaic = demosaicing(cfa);

figure, imshow(demosaic);

white = whitebalance(demosaic, [15700/255, 27500/255, 19500/255]);

figure, imshow(white);

gamma = gammaencoding(white, 1/1.4);

figure, imshow(gamma);