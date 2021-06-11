keyencryption = 'this is my password';
keyscramble=10;



%File reading
logo = imread('logo.png');
logo = imresize(logo, [64, 64]);



W1 = im2bin(rgb2gray(logo));
mymi=bin2im(W1,64,64);
figure,imshow(mymi);
 


W2 = file2bin('EPR.txt');


im=imread('ctscan.jpeg');
im=lsbzero(im);
hash = im2hash(im, 'MD5');
W3 = str2bin(hash);

W = [W1, W2, W3];
eW = encrypt(W, keyencryption);

dW = decrypt(eW, keyencryption);
disp(isequal(W, dW));
dW = decrypt(eW, 'this is my wrong password');
disp(isequal(W, dW));

ROI = roi('ctscan.jpeg');
figure, imshow(ROI);

RONI = roni(ROI, 'ctscan.jpeg');
figure, imshow(RONI);

%%%%%%%Idhar scrambling ho rahi ha but ye abhi sahi nahi ha
rng(keyscramble);
vec = randperm(numel(RONI));
vec = reshape(vec, size(RONI));
out = RONI(vec);
figure, imshow(out);
title('scramble')

embed = embedd(eW, out); %embedding function call

figure, imshow(embed);
title('embeded scramble')
reconstruct = zeros(size(embed), class(embed));
reconstruct(vec) = embed;
figure, imshow(reconstruct);
title('embeded rescramble')

TODO join ROI AND RONI




%%%%%%%

% scrambimg = imscramble(RONI, ROI, 10);
% figure, imshow(scrambimg);
% title('scramble');
% 
% embed = embedd(eW, scrambimg); %embedding function call
% 
% figure, imshow(embed);
% title('embeded scramble')
% 
% unscrambimg = imunscramble(embed, ROI, 10);
% figure, imshow(unscrambimg);
% title('embeded unscramble');
imsave(unscrambimg);
