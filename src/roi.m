function border_img = roi(ct_image)
    Tfinal = multithresh(ct_image);
    %creating black boundary around image
    border_img = padarray(ct_image, [1 1], 0, 'both');
    [row, col] = size(border_img);
    %Turning pixels values to white
    for i = 1:row

        for j = 1:col

            if border_img(i, j) > Tfinal
                border_img(i, j) = 255;
            end

        end

    end

    %Creatiing a tagged image
    tag_image = zeros(row, col);

    for k = 1:row

        for l = 1:col

            if border_img(k, l) == 255
                tag_image(k, l) = 1;
            else
                tag_image(k, l) = 0;
            end

        end

    end

    %saving the rows which has tagged portion
    sum = 0;
    temp = zeros(row);

    for i = 1:row

        for j = 1:col

            if tag_image(i, j) == 1
                sum = sum + 1;
            end

        end

        if sum > (col * 2/3)
            temp(i) = 1;
        end

        sum = 0;
    end

    %Finding the rows index where to make the pixels white
    mn = find(temp == 1, 1);
    mx = find(temp == 1, 1, 'last');

    %Making pixels white from start till the tagged bounndary
    for k = 1:mn

        for l = 1:col
            border_img(k, l) = 255;
        end

    end

    %Making pixels white from tagged bounndary till end
    for k = mx:row

        for l = 1:col
            border_img(k, l) = 255;
        end

    end

    %Making pixels white from the left side untill the tagged bounndary is hit
    for f = 1:row

        for g = 1:col

            if tag_image(f, g) == 1
                break;
            else
                border_img(f, g) = 255;
            end

        end

    end

    %Making pixels white from the right side untill the tagged bounndary is hit
    for f = row:-1:1

        for g = col:-1:1

            if tag_image(f, g) == 1
                break;
            else
                border_img(f, g) = 255;
            end

        end

    end

    border_img = border_img(2:end - 1, 2:end - 1);

end
