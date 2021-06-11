keyencryption = 'this is my password';
keyscramble = 10;

ROI = roi('ctscan.jpeg');
figure, imshow(ROI);

RONI = roni(ROI, 'ctscan.jpeg');
figure, imshow(RONI);

%scrambling
vec = randperm(numel(RONI));
vec = reshape(vec, size(RONI));
scrambimg = RONI(vec);
figure, imshow(scrambimg);
title('scramble');

encryptedwatermark = lsbextract(ROI, RONI);
watermark = decrypt(encryptedwatermark, 'this is my password');
% [~,cols]=size(watermark);
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

