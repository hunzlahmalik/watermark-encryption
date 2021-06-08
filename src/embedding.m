%File reading
im = imread("logo.png");
im = imresize(im, [64, 64]);

W1 = im2binarr(rgb2gray(im));
W2 = file2binarr("EPR.txt");
hash = im2hash(im, 'MD5');
W3 = str2binarr(hash);
W = [W1, W2, W3];
eW = encrypt(W, 'this is my password');

dW = decrypt(eW, 'this is my password');
disp(isequal(W, dW));
dW = decrypt(eW, 'this is my wrong password');
disp(isequal(W, dW));
