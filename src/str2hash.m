function hash = str2hash(str, option)
    % the return value is char array and not string
    % Create any specified cryptographic hasher.
    % Supported string args include 'MD5', 'SHA1', 'SHA256', 'SHA384', 'SHA512'.
    % That's what I could figure out by random guessing...  'SHA3' didn't work.
    hasher = System.Security.Cryptography.HashAlgorithm.Create(option);

    % Convert the char string to uint8 type & run it through the hasher
    % This is a Byte[] class object.  Technically, this is the answer, but it needs reformatting
    hash_byte = hasher.ComputeHash(uint8(str));

    % Convert the System.Byte class to MATLAB 1xN uint8 number array by typecasting.  Lucky guess here
    hash_uint8 = uint8(hash_byte);

    % Convert uint8 to a Nx2 char array of HEX values
    % Example Result:
    %    '12'
    %    '58'
    %    '2D'
    %    etc.
    hash_hex = dec2hex(hash_uint8);

    % FINALLY, convert the Nx2 hex char array to a 1x2N format
    % Example Result:    '12582D...'
    hash = str([]);
    nBytes = length(hash_hex);

    for k = 1:nBytes
        hash(end + 1:end + 2) = hash_hex(k, :);
    end

    %hash=convertCharsToStrings(hash);
end
