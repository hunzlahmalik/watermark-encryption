% scanpath = 'ctscan.jpeg';
% logopath = 'logo.png';
% eprpath = 'EPR.txt';
% keyencryption = 'this is my password';
% keyscramble = 10;

function watermarked = embedding(scanpath, logopath, eprpath, keyencryption, keyscramble)

    %File reading
    logo = imread(logopath);
    logo = imresize(logo, [64, 64]); % 64x64 beaucse we need 4096bits total
    logo = rgb2gray(logo);
    figure, imshow(logo);
    title('logo');

    W1 = im2bin(logo);
    W2 = file2bin(eprpath);

    im = imread(scanpath);
    figure, imshow(im);
    title('Orignal');
    im = lsbzero(im);
    hash = im2hash(im, 'MD5');
    W3 = str2bin(hash);

    W = [W1, W2, W3];
    eW = encrypt(W, keyencryption);

    dW = decrypt(eW, keyencryption);
    disp(isequal(W, dW));
    dW = decrypt(eW, 'this is my wrong password');
    disp(isequal(W, dW));

    ROI = roi(scanpath);
    figure, imshow(ROI);
    title('ROI');

    RONI = roni(ROI, scanpath);
    figure, imshow(RONI);
    title('RONI');

    %scrrambling
    out = getoroni(RONI, ROI);
    figure, imshow(out);
    title('ORONI');
    out = imscramble(out, keyscramble);
    figure, imshow(out);
    title('scramble');

    %embedding function call
    embed = lsbembed(eW, out);
    figure, imshow(embed);
    title('embeded scramble');

    %un-scrambling
    reconstruct = imunscramble(embed, keyscramble);
    figure, imshow(reconstruct);
    title('embeded rescramble');
    reconstruct = putoroni(reconstruct, RONI, ROI);
    figure, imshow(reconstruct);
    title('embeded FULLORONI');

    % join ROI AND RONI

    finalim = combine(ROI, reconstruct);

    figure, imshow(finalim);
    title('finalimage');
    imsave(finalim);
end
