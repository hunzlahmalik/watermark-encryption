function scattered_img = lsbembed(watermark, scattered_img)
    [~, watermark_size] = size(watermark);
    count = 1;
    [row, col] = size(scattered_img);

    for f = 1:row

        for g = 1:col

            if scattered_img(f, g) ~= 255
                scattered_img(f, g) = scattered_img(f, g) + uint8(watermark(count));
                count = count + 1;
            end

            if count == watermark_size
                count = -1;
                break;
            end

        end

        if count == -1
            break;
        end

    end

end
