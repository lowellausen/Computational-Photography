function [im_out]=task2(bgin, fgin, mask)

%--------------------------------------------------------------------------
%load images

bg  = im2double(bgin); 
fg = im2double(fgin); 
alpha    = im2double(mask); 

for k = 1:3
    im_out(:,:,k) = alpha(:,:,k) .* fg(:,:,k) + (1-alpha(:,:,k)) .* bg(:,:,k);
end;


imshow(im_out)