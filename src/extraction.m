% scanpath = 'ctscan_watermarked.jpeg';
% logopath = 'logo_extracted.png';
% eprpath = 'EPR_extracted.txt';
% keyencryption = 'this is my password';
% keyscramble = 10;

function [logo, eprdata] = extraction(scanpath, keyencryption, keyscramble)

    SHOW = false;

    scanim = imread(scanpath);

    ROI2 = roi(scanim);

    RONI2 = roni(ROI2, scanim);

    %scrrambling
    ORONI = getoroni(RONI2, ROI2);

    scrambled = imscramble(ORONI, keyscramble);

    encryptedwatermark = lsbextract(scrambled); %extraction of lsb
    watermark = decrypt(encryptedwatermark, keyencryption); %decrypting

    %seperation of watermark data
    W1 = watermark(1:4096); %logo
    W2 = watermark(4096 + 1:end - 256); %paitent detail
    W3 = watermark(end - 256 + 1:end); %hash

    %calculating hash after turning lsb zero
    hash = im2hash(lsbzero(scanim), 'MD5');
    hashbin = str2bin(hash);

    %checking if hashes are equal
    disp(isequal(W3, hashbin));

    %saving patient info
    eprdata = bin2str(W2);
    disp(eprdata);

    %converting logo
    logo = bin2im(W1, 64, 64);

    if SHOW
        figure, imshow(ROI2);
        title('ROI2');
        figure, imshow(RONI2);
        title('RONI2');
        figure, imshow(ORONI);
        title('ORONI');
        figure, imshow(scrambled);
        title('scramble');
        figure, imshow(logo);
        title('logo');
    end

end
