s = 'Hello';

binary = reshape(dec2bin(s, 8).' - '0', 1, []);
binary2 = logical(binary);

A = logical([0, 1, 0, 1]);
B = repmat(A, 2)
C = reshape(B.', 1, []);
