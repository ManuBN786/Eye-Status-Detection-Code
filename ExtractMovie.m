function[im] = ExtractMovie(movieFileName,radius, HoughThreshold, EdgeThreshold)

%Usage: [im] = ExtractMovie(movieFileName,radius, HoughThreshold, EdgeThreshold)

%
%Arguments:
%       movieFileName   -   The name of the movie file. Movie file format should be AVI.
%                           For example: 'Reut2.AVI'
%       radius          -   radius of circles for the Hough transform.
%       HoughThreshold  -   The threshold value that determines the minimum number of
%                           pixels that belong to a circle in image space.
%       EdgeThreshold   -   The threshold value for the edge detector.
%

% Sample usage: ExtractMovie('Reut1.AVI',9, 16, 0.1);
              % ExtractMovie('Reut4.AVI',11, 17, 0.1);


% extract frames from the .avi video file:
numOfFrames = avi2pic(movieFileName,'jpg');

noEyesCounter = 0;

%for each frame - try to find the eyes.
for i = 1: numOfFrames
    fileName = strcat(int2str(i),'.jpg');
    [img, found] = Main(fileName, radius, HoughThreshold, EdgeThreshold); 
    if found
        noEyesCounter = 0; %reset counter
    else
        noEyesCounter = noEyesCounter + 1; % eyes not found. count it.
    end
    
    if noEyesCounter >= 8 % Eyes shut in 8 frames sequentially (~ 1/4 a second).
        for i=-0.8:0.1:0.8 
            sound(i); 
        end
    end
    %imshow(img);
    %imwrite(img,strcat('final_',int2str(i),'.jpg'));
end
