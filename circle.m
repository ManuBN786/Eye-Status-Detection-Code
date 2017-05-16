function H = circle(center,radius,numOfPoints,style)
%---------------------------------------------------------------------------------------------
% H = CIRCLE(CENTER,RADIUS,numOfPoints,STYLE)
%
%Arguments:
%       center   -      A vector representing the center of the circle. 
%                       For example: [5,20]
%       radius       -      radius of the circle to draw.
%       numOfPoints  -      the number of points on the circle.
%                           pixels that belong to a circle in image space.
%       style        -      Line specification syntax.
%
%
% Usage Examples,
%
%   circle([1,3],3,1000,':'); 
%   circle([2,4],2,1000,'--');
%---------------------------------------------------------------------------------------------

if (nargin < 3),
    error('Not enough input parameters.');
elseif (nargin == 3)
    style='b-'; % color:blue, line:solid
end;

THETA = linspace(0,2*pi,numOfPoints);
RHO = ones(1,numOfPoints) * radius;
[X,Y] = pol2cart(THETA,RHO);
X = X + center(1);
Y = Y + center(2);

H = plot(X,Y,style,'linewidth', 2.0 );
axis square; % makes each axis the same length 
