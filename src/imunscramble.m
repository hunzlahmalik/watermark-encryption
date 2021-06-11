function unscrambled = imunscramble(scrambledimg,ROI, key)

    rng(key);

    vec = randperm(numel(scrambledimg));
    vec = reshape(vec, size(scrambledimg));

    unscrambled = zeros(size(scrambledimg), class(scrambledimg));
    unscrambled(vec) = scrambledimg;

    % scrambled = padarray(inputimg, [1 1], 0, 'both');
    [row, col] = size(unscrambled);

    for i = 1:row

        for j = 1:col

            if ROI(i, j) ~= 255
                unscrambled(i, j) = 255;
            end

        end

    end

end
