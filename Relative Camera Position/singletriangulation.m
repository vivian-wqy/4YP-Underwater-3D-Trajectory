load('pool_stereoParams.mat');

I1 = imread("tripod1-left_RD_rec.jpg");
I2 = imread("tripod1-right_RD_rec.jpg");

% I1 = undistortImage(I1,stereoParams.CameraParameters1);
% I2 = undistortImage(I2,stereoParams.CameraParameters2);
% 
% imwrite(I1,'tripod2-left_RD_rec.jpg')
% imwrite(I2,'tripod2-right_RD_rec.jpg')

% %tripod1 points
% imagePoints1 = [1442 312;1451 276;1487 277;1478 314;293 340;282 298;321 297;333 333;271 413;393 388;249 277;309 270];
% imagePoints2 = [1415 334;1420 299;1456 298;1448 336;257 355;249 316;292 310;300 349;235 423;357 400;216 288;276 285];

%tripod2 points
imagePoints1 = [331 332;318 333;306 333;297 336];
imagePoints2 = [301 349;285 348;272 350;259 350];

point3d = triangulate(imagePoints1, imagePoints2, stereoParams);
distanceInMeters = norm(point3d(5,:))/1000;

distanceAsString = sprintf('%0.2f meters', distanceInMeters);

I1 = insertObjectAnnotation(I1,'circle', [imagePoints1(5,:) 5], distanceAsString,'FontSize',18);
I2 = insertObjectAnnotation(I2,'circle', [imagePoints2(5,:) 5], distanceAsString,'FontSize',18);
imshowpair(I1, I2, 'montage');