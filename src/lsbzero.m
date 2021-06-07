function lsbzeroimg = lsbzero(inputimg)
    [rows, cols] = size(inputimg);
    lsbzeroimg = zeros(rows, cols);

    for r = 1:rows

        for c = 1:cols

            pixel = inputimg(r, c);

            % if odd than -1
            % if even leave it as it is
            % if 0 than leave it
            if pixel ~= 0 && mod(pixel, 2) == 1
                lsbzeroimg(r, c) = pixel - 1; %LSB zero
            else
                lsbzeroimg(r, c) = pixel; %LSB is already zero
            end

        end

    end

end
