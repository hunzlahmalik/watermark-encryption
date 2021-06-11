function binarr = str2bin(inputstr)
    %the 'inputstr' should be char array, and not string.
    binarr = reshape(dec2bin(inputstr, 8).' - '0', 1, []);
    binarr = logical(binarr); %boolean array
end
