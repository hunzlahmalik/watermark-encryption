function scrambled = imscramble(inputimg, key)
    rng(key);
    vec = randperm(numel(inputimg));
    vec = reshape(vec, size(inputimg));
    scrambled = inputimg(vec);
end
