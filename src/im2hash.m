function hash = im2hash(inputimg, option)
    % Example Code:    Create an MD5 crypto-hash of an arbitrary string, "str"
    % Main class of interest:    System.Security.Cryptography.HashAlgorithm

    % Image to string
    str = im2str(inputimg);
    hash=str2hash(str,option);
end
