points1 = readmatrix('test_tripod1_10s_video/compiled_left.txt');
points2 = readmatrix("test_tripod1_10s_video_tracker - MIL/left_centroids.txt");

diff = points1-points2;

error = sqrt(sum(diff.^2,2));

mu = mean(error);
plot(error,'o')
hold on
plot(1:556,mu+zeros(1,556))

plot(brushedData(:,1),brushedData(:,2),'or')