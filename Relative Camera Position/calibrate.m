% read checkerboard coordinates and an image from either camera
m = 6; % number of internal corners of the calibration board used
n = 10; % number of image pairs used for calibration
imagePoints = zeros(m,2,n,2);
for i = 1:n
    if i<10
        filename1 = sprintf('imgs-20-ffmpeg/tripod1-left-0%d-RD.txt',i);
        filename2 = sprintf('imgs-20-ffmpeg/tripod2-left-0%d-RD.txt',i);
    else
        filename1 = sprintf('imgs-20-ffmpeg/tripod1-left-%d-RD.txt',i);
        filename2 = sprintf('imgs-20-ffmpeg/tripod2-left-%d-RD.txt',i);
    end
    imgPoints1 = readmatrix(filename1);
    imgPoints2 = readmatrix(filename2);
    imagePoints(:,:,i,1) = imgPoints1;
    imagePoints(:,:,i,2) = imgPoints2;
end

img = imread('imgs-20-ffmpeg/tripod1-left-01-RD.jpg');
imageSize = [size(img,1) size(img,2)];

% input checkerboard dimensions 
squareSizeInMM = 20;
boardSize = [4 3];

% generate world coordinates of checkerboard corners
worldPoints = generateCheckerboardPoints(boardSize,squareSizeInMM);

% estimate stereo parameters from correspondence of points
stereoParams = estimateCameraParameters(imagePoints,worldPoints,"NumRadialDistortionCoefficients",3,"EstimateTangentialDistortion",true,"EstimateSkew",true,"ImageSize",imageSize);
