load("pool_stereoParams.mat");

I1 = imread("tripod1-left_RD_rec.jpg");
I2 = imread("tripod1-right_RD_rec.jpg");

imagePoints1 = [1442 310;1452 276;1483 279;1477 313];
imagePoints2 = [1416 334;1422 298;1455 298;1448 335];

worldPoints = triangulate(imagePoints1,imagePoints2,stereoParams);

