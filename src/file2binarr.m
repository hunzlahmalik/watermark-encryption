function binarr = file2binarr(filearr)
    str = fileread(filearr);%reading file text
    binarr = str2binarr(str);%convering to binary
end
