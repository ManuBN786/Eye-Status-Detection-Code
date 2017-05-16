function[im, pupilFound] = Main(imageFileName, radius, HoughThreshold, EdgeThreshold)

% Example usage: Main('fairy_eyes.jpg', 15, 24, 0.1);
%                Main('Reut.jpg', 12, 18, 0.1);

pupilFound = 0; % pupil found flag. 0 -> not found
I = imread(imageFileName);
A = I(:,:,1); % Grayscale
B = edge(A,'sobel',EdgeThreshold); % apply edge detector. Receive B - binary img.
%imwrite(B, 'binImage.jpg');
[y,x,Acc] = houghcircle1(B,radius,HoughThreshold); % perform Hough tranform.
figure;
imshow(I);
F = I;
[m,n] = size(x);

hold on
for i = 1:size(x)
     F = circle([x(i),y(i)],radius,1000); % Draw a circle
     hold on;
end 

if m > 1
    pupilFound = 1;
end    
im = F;
imshow(im);
