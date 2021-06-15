function lsbzeroimg = lsbzero(inputimg)
    [rows, cols] = size(inputimg);
    lsbzeroimg = inputimg;

    for r = 1:rows

        for c = 1:cols

            pixel = lsbzeroimg(r, c);

            % if odd than -1
            % if even leave it as it is
            % if 0 than leave it
            if pixel ~= 0 && mod(pixel, 2) == 1
                lsbzeroimg(r, c) = pixel - 1; %LSB zero
            end

        end

    end

end
