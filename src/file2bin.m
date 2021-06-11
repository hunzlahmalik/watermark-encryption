function binarr = file2bin(filearr)
    str = fileread(filearr);%reading file text
    binarr = str2bin(str);%convering to binary
end
