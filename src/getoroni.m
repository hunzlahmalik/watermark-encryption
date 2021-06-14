function ORONI = getoroni(RONI, ROI)
    %get only roni
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

    %testing which range is less than select that one
    if (right - left) < (down - up) %verticle cutting
        copycols = zeros(1, cols - (right - left) - 1);
        index = 1;

        for i = 1:cols

            if i < left || i > right
                copycols(index) = i;
                index = index + 1;
            end

        end

        ORONI = RONI(:, copycols); %copying specific colss

    else %horizontal cutting
        copyrows = zeros(1, rows - (down - up) - 1);
        index = 1;

        for i = 1:rows

            if i < up || i > down
                copyrows(index) = i;
                index = index + 1;
            end

        end

        ORONI = RONI(copyrows, :); %copying specific rows

    end

end
