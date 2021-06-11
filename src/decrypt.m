function decrypted = decrypt(encrypted, key)
    keyhash = str2hash(key, 'MD5');
    key = str2bin(keyhash);

    [~, keylen] = size(key);
    [~, datalen] = size(encrypted);

    % making key size equal to the size of encrypted
    while keylen ~= datalen

        if keylen < datalen
            key = [key, key];
        else
            key = key(1:datalen);
        end

        [~, keylen] = size(key);
    end

    %taking XOR
    decrypted = xor(encrypted, key);

end
