function str = bin2str(binStr)
    %the 'inputstr' should be char array, and not string.
    [~, length] = size(binStr);
    str = reshape(char(binStr + '0'), length / 8, 8);
    str = char(bin2dec(str)).';
end
