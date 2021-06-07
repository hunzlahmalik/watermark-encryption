function binarr = im2binarr(inputimg)
    bw = imbinarize(inputimg);
    binarr = num2cell(reshape(bw.', 1, []));
    binarr = cell2mat(binarr);
end
