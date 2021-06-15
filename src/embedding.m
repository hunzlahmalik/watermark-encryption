% scanpath = 'ctscan.jpeg';
% logopath = 'logo.png';
% eprpath = 'EPR.txt';
% keyencryption = 'this is my password';
% keyscramble = 10;

function watermarked = embedding(scanpath, logopath, eprpath, keyencryption, keyscramble)

    SHOW = false;

    %File reading
    logo = imread(logopath);
    logo = imresize(logo, [64, 64]); % 64x64 beaucse we need 4096bits total
    logo = rgb2gray(logo);

    W1 = im2bin(logo);
    W2 = file2bin(eprpath);

    scanim = imread(scanpath);

    im = lsbzero(scanim);
    hash = im2hash(im, 'MD5');
    W3 = str2bin(hash);

    W = [W1, W2, W3];
    eW = encrypt(W, keyencryption);
    eW = [eW, true]; %to check the ending for us

    % dW = decrypt(eW, keyencryption);
    % disp(isequal(W, dW));
    % dW = decrypt(eW, 'this is my wrong password');
    % disp(isequal(W, dW));

    ROI = roi(scanim);

    RONI = roni(ROI, scanim);

    %scrrambling
    REALORONI = getoroni(RONI, ROI);

    ORONI = lsbzero(REALORONI);

    out = imscramble(ORONI, keyscramble);

    %embedding function call
    embed = lsbembed(eW, out);

    %un-scrambling
    reconstruct = imunscramble(embed, keyscramble);

    reconstruct2 = putoroni(reconstruct, RONI, ROI);

    % join ROI AND RONI
    watermarked = combine(ROI, reconstruct2);

    % imwrite(watermarked, 'ctscan_watermarked.png');

    if SHOW
        figure, imshow(logo);
        title('logo');
        figure, imshow(scanim);
        title('Orignal');
        figure, imshow(ROI);
        title('ROI');
        figure, imshow(RONI);
        title('RONI');
        figure, imshow(REALORONI);
        title('ORONI');
        figure, imshow(ORONI);
        title('LSB 0 ORONI');
        figure, imshow(out);
        title('scramble');
        figure, imshow(embed);
        title('embeded scramble');
        figure, imshow(reconstruct);
        title('embeded rescramble');
        figure, imshow(reconstruct2);
        title('embeded FULLORONI');
        figure, imshow(watermarked);
        title('finalimage');
    end

end
