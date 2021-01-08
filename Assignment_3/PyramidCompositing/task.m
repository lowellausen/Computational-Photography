fg = imread('nightFG.jpeg');
bg = imread('moon.jpeg');
mask = imread('night_mask.png');

M = size(fg,1);
N = size(fg,2);
fact = 4;
fg2 = imresize(fg, [M/fact, N/fact]);
bg2 = imresize(bg, [M/fact, N/fact]);
mask2 = imresize(mask, [M/fact, N/fact]);

outs = Pyramid_compositing(bg2, fg2, mask2, 300);

imshow(outs)