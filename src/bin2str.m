function str = bin2str(binStr)
    [~, length] = size(binStr);
    str = char(binStr + '0');
    str = reshape(str, [], length / 8).';
    str = char(bin2dec(str)).';
end
