function roni_img = roni(ROI, org_img)
    roni_img = org_img;
    [row, col] = size(roni_img);

    for i = 1:row

        for j = 1:col

            if ROI(i, j) ~= 255
                roni_img(i, j) = 255;
            end

        end

    end

end
