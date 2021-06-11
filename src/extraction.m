%File reading
im = imread('logo.png');
im = imresize(im, [64, 64]);

W1 = im2binarr(rgb2gray(im));
W2 = file2binarr('EPR.txt');
hash = im2hash(im, 'MD5');
W3 = str2binarr(hash);
W = [W1, W2, W3];
eW = encrypt(W, 'this is my password');

dW = decrypt(eW, 'this is my password');
disp(isequal(W, dW));
dW = decrypt(eW, 'this is my wrong password');
disp(isequal(W, dW));

ROI = roi('ctscan.jpeg');
figure, imshow(ROI);

RONI = roni(ROI, 'ctscan.jpeg');
figure, imshow(RONI);

%%%%%%%Idhar scrambling ho rahi ha but ye abhi sahi nahi ha
% rng(10);
% vec = randperm(numel(RONI));
% vec = reshape(vec, size(RONI));
% out = RONI(vec);
% figure, imshow(out);
% title('scramble')
%
% embed = embedd(eW, out); %embedding function call
%
% figure, imshow(embed);
% title('embeded scramble')
% reconstruct = zeros(size(embed), class(embed));
% reconstruct(vec) = embed;
% figure, imshow(reconstruct);
% title('embeded rescramble')
%%%%%%%

out = imscramble(RONI, ROI, 10);
figure, imshow(out);
title('scramble');

embed = embedd(eW, out); %embedding function call

figure, imshow(embed);
title('embeded scramble')

out = imunscramble(embed, ROI, 10);
figure, imshow(out);
title('embeded unscramble');
imsave(out);
