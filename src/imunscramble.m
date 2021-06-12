function unscrambled = imunscramble(scrambledimg, key)
    rng(key);
    vec = randperm(numel(scrambledimg));
    vec = reshape(vec, size(scrambledimg));

    unscrambled = zeros(size(scrambledimg), class(scrambledimg));
    unscrambled(vec) = scrambledimg;
end
