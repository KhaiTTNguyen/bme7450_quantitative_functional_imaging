figure
nFrames = 30;
for index = 1:nFrames
    imagesc(squeeze(image_3d(:, :, index)))
    % Set the intensity scale based on the first image:
    if (index == 1)
        cLim_v = get(gca, 'CLim');
    else
        set(gca, 'CLim', cLim_v)
    end
    axis image
    axis off
    colormap(gray)
    title(['Cardiac phase: ', num2str(index)])
    drawnow
    mov(index) = getframe;
end

fps = 8;          % frames per second.
nReps = 4;    % number of repetitions.
movie(mov, nReps, fps)