load('proj5Data_qfi.mat');
intLimits_v = [min(image_3d(:)), max(image_3d(:))];
figure
for index = 1:nTimes
    imagesc(squeeze(image_3d(:, :, index)),intLimits_v);
    axis image
    axis off
    colormap(gray)
    title(['Time points: ', num2str(index)])
    drawnow
    mov(index) = getframe;
end
fps = 8;          % frames per second.
nReps = 4;    % number of repetitions.
movie(mov, nReps, fps)