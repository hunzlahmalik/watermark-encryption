function str = bin2str(binStr)
    %the 'inputstr' should be char array, and not string.
    % binarr = reshape(dec2bin(inputstr, 8).' - '0', 1, []);
    % binarr = logical(binarr); %boolean array

    str = bin2dec(binStr) + '0';
end
