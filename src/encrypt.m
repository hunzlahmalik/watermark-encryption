function encrypted = encrypt(data, key)
    keyhash = str2hash(key, 'MD5');
    key = str2bin(keyhash);

    [~, keylen] = size(key);
    [~, datalen] = size(data);

    % making key size equal to the size of data
    while keylen ~= datalen

        if keylen < datalen
            key = [key, key];
        else
            key = key(1:datalen);
        end

        [~, keylen] = size(key);
    end

    %taking XOR
    encrypted = xor(data, key);

end
