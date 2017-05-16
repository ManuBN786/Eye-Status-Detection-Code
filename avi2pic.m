function[numOfFrames] =  avi2pic(aviFileName,picType)
%------------------------------------------------------------
% function avi2pic(aviFileName,picType)
%
% Arguments:
%   aviFileName -   The avi filename.
%   picType     -   The type of image.
%                   Possible formats:'jpg','jpeg','bmp','tiff','tif','gif','png',etc.
%
% Sample usage:
%       avi2pic('Reut4.AVI','jpg');
%------------------------------------------------------------

movie = aviread(aviFileName);
temp = size(movie);
numOfFrames = temp(2);
for i = 1 : numOfFrames,
    tmpStr = strcat(int2str(i),'.',picType);
%    imwrite(movie(i).cdata(:,:,:),movie(i).colormap,tmpStr);
    imwrite(movie(i).cdata(:,:,:),tmpStr);
end,

