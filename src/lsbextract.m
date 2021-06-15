function watermark = lsbextract(RONI)
    % extraction of lsb to get the data
    % the data is W=[W1,W2,W3]

    [rows, cols] = size(RONI);
    newimage = zeros(1, rows * cols);
    k = 1;
    endindex = 0;

    for i = 1:rows

        for j = 1:cols
            pixel = RONI(i, j);

            if mod(pixel, 2) == 1
                newimage(1, k) = 1;
                endindex = k;
            end

            k = k + 1;
        end

    end

    specialimg = newimage(1:endindex);
    watermark = logical(specialimg);

end
