load('proj6_arterialFlowData_qfi.mat');

meanAtEachTimeStep = mean(mag_3d,[1 2]);
meanOverTime = mean(mag_3d,3);
imagesc(meanOverTime)
axis image
axis off
title('mean magnitude image')

% Create head mask
imageMax = max(mag_3d(:));
bodyMask_m = (meanOverTime > 0.1*imageMax);
figure
imagesc(bodyMask_m)
colormap(gray)
axis image
axis off
title('Body mask')

vz_3d = (venc/(pi/2)).*phase_3d;

% Show a movie of velocity versus time. Red is flow toward head,
% blue is toward feet:
nTimes = length(time_v);
maxVz = max(vz_3d(:));
minVz = min(vz_3d(:));
figure
for timeIndex = 1:nTimes
    imagesc(bodyMask_m .* vz_3d(:, :, timeIndex))
    axis image
    axis off
    colorbar
    % Set color limits to visualize slow and fast flow:
    set(gca, 'CLim', [minVz, maxVz]/2)
    drawnow
    mov(timeIndex) = getframe;
end
nLoops = 2;
fps = 0.8;    % Frames per second.
movie(mov, nLoops, fps)