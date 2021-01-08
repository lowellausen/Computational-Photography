fg = imread('GT04.png');
bg = imread('background.png');
mask = imread('GT04_alpha.png');

M = size(bg,1);
N = size(bg,2);
fact = 1;
fg2 = imresize(fg, [M, N]);
bg2 = imresize(bg, [M, N]);
mask2 = imresize(mask, [M, N]);

task2(bg2, fg2, mask2);

