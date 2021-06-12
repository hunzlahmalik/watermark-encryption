scanpath = 'ctscan_watermarked.jpeg';
logopath = 'logo_extracted.png';
eprpath = 'EPR_extracted.txt';
keyencryption = 'this is my password';
keyscramble = 10;

ROI = roi(scanpath);
figure, imshow(ROI);
title('ROI');

RONI = roni(ROI, scanpath);
figure, imshow(RONI);
title('RONI');

%scrambling
scrambimg = imscramble(RONI, keyscramble);
figure, imshow(scrambimg);
title('scramble');

encryptedwatermark = lsbextract(ROI, RONI); %extraction of lsb
watermark = decrypt(encryptedwatermark, keyencryption); %decrypting

%seperation of watermark data
W1 = watermark(1:4096); %logo
W2 = watermark(4096 + 1:end - 256 - 1); %paitent detail
W3 = watermark(end - 256:end); %hash

%calculating hash after truning lsb zero
hash = im2hash(lsbzero(im));
hashbin = str2bin(hash);

%checking if hashes are equal
disp(isequal(W3, hash));

%saving patient info
eprdata = bin2str(W2);
disp(eprdata);

%showing logo
logo = bin2im(W3);
