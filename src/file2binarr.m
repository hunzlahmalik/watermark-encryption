function binarr = file2binarr(filearr)
    str = fileread(filearr);
    binarr = str2binarr(str);
end
