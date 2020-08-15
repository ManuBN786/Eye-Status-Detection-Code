In order to run the program:

1. Open Matlab.

2. Set the current directory to be the directory you extracted the zip file into.

3. From the Matlab Command Window, run the function 'ExtractMovie(movieFileName,radius, HoughThreshold, EdgeThreshold)'
   There are 2 AVI file in the zipped directory.
   Therefore the syntax should be: ExtractMovie('Reut4.AVI',11, 17, 0.1);
			       or: ExtractMovie('Reut1.AVI',9, 16, 0.1);
				   
	

--------------------------------------------------------------------------------

More details about the code and function are written as comments in the .m files.

--------------------------------------------------------------------------------

Known errors: You might get the error: 'Unable to locate decompressor to decompress video stream' when trying to run 'ExtractMovie' function.
The meaning is that your computer is lacking the appropiate Video Codec for the AVI files.
In this case - You'll have to install MJPEG Codec in order to run the program (Please Google it)

---------------------------------------------------------------------------------

