camera1 = readmatrix('test_tripod1_10s_label/left_10s_label.txt');
camera2 = readmatrix("test_tripod1_10s_label/right_10s_label.txt");
load('pool26_stereoParams.mat');

intrinsics1 = stereoParams.CameraParameters1.Intrinsics;
intrinsics2 = stereoParams.CameraParameters2.Intrinsics;

undistortedPoints1 = undistortPoints(camera1, intrinsics1);
undistortedPoints2 = undistortPoints(camera2, intrinsics2);

writematrix(undistortedPoints1, 'undistorted_left.txt', 'Delimiter', ' ');
type undistorted_left.txt

writematrix(undistortedPoints2, 'undistorted_right.txt', 'Delimiter', ' ');
type undistorted_right.txt