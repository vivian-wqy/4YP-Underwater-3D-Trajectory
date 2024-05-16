stereoParams1 = load("pool26_stereoParams.mat");
stereoParams1 = stereoParams1.stereoParams;
stereoParams2 = load('outputParams/20pair_ffmpeg_stereoParams.mat');
stereoParams2 = stereoParams2.stereoParams;

imgpt1 = readmatrix('reproj/tripod1-left-0.38.txt');
imgpt2 = readmatrix('reproj/tripod1-right-0.38.txt');

imgpt3 = readmatrix('reproj/tripod2-left-0.38.txt');

world3dpoint = triangulate(imgpt1,imgpt2,stereoParams1);
% transformed3dpoint = stereoParams2.PoseCamera2.A * world3dpoint;

% camExtrinsics = estimateExtrinsics(imgPoints2,worldPoints,stereoParams1.CameraParameters1.Intrinsics);
% Rt = rigidtform3d(eye(4,4));
Rt = rigidtform3d(inv(stereoParams2.PoseCamera2.R),stereoParams2.PoseCamera2.Translation.*-1);
projectedPoints = world2img(world3dpoint,Rt,stereoParams1.CameraParameters1.Intrinsics);

image = imread('reproj/tripod2-left-0.38_yolo.png');
imshow(image);
hold on
plot(projectedPoints(:,1),projectedPoints(:,2),"r*");
legend("Projected Points");
hold off

% im = world2img(world,stereoParams.CameraParameters1.PatternExtrinsics,stereoParams.CameraParameters1.Intrinsics)
% P = cameraProjection(stereoParams.CameraParameters1.Intrinsics,stereoParams.PoseCamera2)

% camEx = estimateExtrinsics(im,world(1,1:2),stereoParams.CameraParameters1.Intrinsics)