function binarr = str2binarr(inputstr)
    binarr = reshape(dec2bin(inputstr, 8).'-'0',1,[]);
    binarr=logical(binarr);
end
