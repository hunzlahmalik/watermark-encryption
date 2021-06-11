function scrambled = imscramble(inputimg, ROI, key)

    rng(key);
    vec = randperm(numel(inputimg));
    vec = reshape(vec, size(inputimg));
    scrambled = inputimg(vec);

    % scrambled = padarray(inputimg, [1 1], 0, 'both');
    [row, col] = size(scrambled);

    for i = 1:row

        for j = 1:col

            if ROI(i, j) ~= 255
                scrambled(i, j) = ROI(i, j);
            end

        end

    end

end
