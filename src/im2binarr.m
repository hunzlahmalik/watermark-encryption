function binarr = im2binarr(inputimg)
    bw = imbinarize(inputimg);
    %reshaping to convert to the single array with correct sequence
    binarr = num2cell(reshape(bw.', 1, []));
    %converting the the boolean array
    binarr = cell2mat(binarr);
end
