% worldPoints_label_556 = load("test_tripod1_10s_label\worldPoints_label_556.mat");
% worldPoints_label_556 = worldPoints_label_556.worldPoints_label;

x = worldPoints(:,1);
y = worldPoints(:,2);
z = worldPoints(:,3);

% x_label = worldPoints_label(:,1);
% y_label = worldPoints_label(:,2);
% z_label = worldPoints_label(:,3);

% rms = sqrt((1/length(worldPoints(:,1))) .* ((x-x_label).^2+(y-y_label).^2+(z-z_label).^2));
p = zeros(599,1);
for i=1:599
    p(i) = sqrt((x(i+1)-x(i))^2+(y(i+1)-y(i))^2+(z(i+1)-z(i))^2);
end

plot(1:599,p)
xlabel('Frame Number')
ylabel('Pixel distance between consecutive points')