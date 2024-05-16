camera1 = readmatrix('test_tripod1_10s_video/undistorted_left.txt');
camera2 = readmatrix("test_tripod1_10s_video/undistorted_right.txt");
load('refined_stereoParams.mat')

worldPoints =  triangulate(camera1, camera2, stereoParams);
worldPoints(:,4) = 1:1:length(worldPoints(:,1));
%plot3(worldPoints(:,1),worldPoints(:,2),worldPoints(:,3))
%pcshow(worldPoints)
%plot(worldPoints(:,1),worldPoints(:,2))



h = scatter3(worldPoints(:,1),worldPoints(:,2),worldPoints(:,3),20,worldPoints(:,4));
h.MarkerFaceColor = 'flat';
grid on
xlabel('x')
ylabel('y')
xlim([-400 50])
ylim([-450 0])
zlim([1000 4000])
colormap("default")
colorbar.Label.String = 'Frame Number';