function [yArray,xArray,Accumulator] = houghcircle1(binImg,r,thresh)
%HOUGHCIRCLE1 - detects circles with specific radius in a binary image.
%
%Usage: [yArray,xArray,Accumulator] = houghcircle(binImg,r,thresh)
%
%Arguments:
%       binImg -   A binary image. 
%       r        - radius of circles.
%       thresh   - The threshold value that determines the minimum number of
%                  pixels that belong to a circle in image space.
%
%Returns:
%       yArray    - row coordinates of detected circles.
%       xArray    - column coordinates of detected circles. 
%       Accumulator - the accumulator array in Hough space.

if nargin == 2 % num of arguments is 2
    thresh = 4; %default thresh value
elseif thresh < 4
    error('Threshold must be bigger or equal to 4');
end

%Voting
Accumulator = zeros(size(binImg)); % Init Accumulator
[yIndex xIndex] = find(binImg); % Find indices and values of nonzero elements
for counter = 1:length(xIndex)
    low = xIndex(counter) - r;
    high = xIndex(counter) + r;
    if (low < 1) 
        low = 1;
    end
    if (high > size(binImg,2)) 
        high = size(binImg,2); 
    end
    for x = low:high
        y1 = yIndex(counter) - sqrt(r^2-(xIndex(counter)-x)^2);
        y2 = yIndex(counter) + sqrt(r^2-(xIndex(counter)-x)^2);
        y1 = round(y1); 
        y2 = round(y2);
        if y1 < size(binImg,1) && y1 >= 1
            Accumulator(y1,x) = Accumulator(y1,x) + 1;
        end
        if y2 < size(binImg,1) && y2 >= 1
            Accumulator(y2,x) = Accumulator(y2,x) + 1;
        end
    end
end

% Finding local maxima in Accumulator
yArray = []; xArray = [];
AccumMax = imregionalmax(Accumulator); % Regional maxima
[yPotential xPotential] = find(AccumMax == 1); %In AccumMax, pixels that are set to 1 identify regional maxima;
tmpAccum = Accumulator - thresh;
for i = 1:length(yPotential)
    if tmpAccum(yPotential(i),xPotential(i)) >= 0
        yArray = [yArray; yPotential(i)];
        xArray = [xArray; xPotential(i)];
    end
end


