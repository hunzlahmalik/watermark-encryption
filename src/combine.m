function im = combine(ROI, RONI)
    [rows, cols] = size(RONI);
    im = RONI; %duplication

    for r = 1:rows

        for c = 1:cols

            if ROI(r, c) ~= 255
                im(r, c) = ROI(r, c);
            end

        end

    end

end
