function [output]=loadDNG(input)
%Loads the Color Filter Array from a Digital Negative

t=Tiff(input,'r');
offsets=getTag(t,'SubIFD');
setSubDirectory(t,offsets(1));
cfa=read(t);
close(t);
output= uint16((2^16) * double(cfa)/(2^12));
end

