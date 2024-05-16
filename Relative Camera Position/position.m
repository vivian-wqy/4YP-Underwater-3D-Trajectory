load("pool_stereoParams.mat");

% I1 = imread("tripod1-left_RD_rec.jpg");
% I2 = imread("tripod1-right_RD_rec.jpg");

% tripod1 points
% imagePoints1 = [1442 312;1451 276;1487 277;1478 314;293 340;282 298;321 297;333 333;271 413;393 388;249 277;309 270];
% imagePoints2 = [1415 334;1420 299;1456 298;1448 336;257 355;249 316;292 310;300 349;235 423;357 400;216 288;276 285];

%tripod2 points
imagePoints1 = [1440 323;1440 289;1475 293;1472 327;357 311;394 306;382 378;426 371;412 401;438 395;421 431;451 424];
imagePoints2 = [1408 367;1406 330;1443 329;1440 368;333 336;368 332;357 401;400 394;374 421;410 415;385 457;420 451];



worldPoints = triangulate(imagePoints1,imagePoints2,stereoParams);

worldPose = estworldpose(imagePoints1,worldPoints,stereoParams.CameraParameters1.Intrinsics);

pcshow(worldPoints,VerticalAxis="Y",VerticalAxisDir="down", ...
    MarkerSize=30);
hold on
plotCamera(Size=10,Orientation=worldPose.R', ...
    Location=worldPose.Translation);
hold off
