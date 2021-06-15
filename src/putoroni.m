function FULLRONI = putoroni(ORONI, RONI, ROI)
    [rows, cols] = size(ROI);
    up = rows;
    down = 0;
    left = cols;
    right = 0;

    %checking the ROI boundary
    for r = 1:rows

        for c = 1:cols

            if ROI(r, c) ~= 255

                if r < up
                    up = r;
                end

                if r > down
                    down = r;
                end

                if c < left
                    left = c;
                end

                if c > right
                    right = c;
                end

            end

        end

    end

    [rows, cols] = size(RONI);
    FULLRONI = RONI;

    %testing which range is less than select that one
    if (right - left) < (down - up) %verticle cutting
        index = 1;

        for i = 1:cols

            if i < left || i > right
                FULLRONI(:, i) = ORONI(:, i);
                index = index + 1;
            end

        end

    else %horizontal cutting
        index = 1;

        for i = 1:rows

            if i < up || i > down
                FULLRONI(i, :) = ORONI(index, :);
                index = index + 1;
            end

        end

    end

end
