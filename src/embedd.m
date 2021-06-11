function scattered_img = embedd(watermark, scattered_img)
    [~,watermark_size] = size(watermark);
    count = 1;
    [row,col] = size(scattered_img);
    for f = 1:row
        for g = 1:col
            bin_str = dec2bin(scattered_img(f, g));
            bin_arr=char(num2cell(bin_str));
            bin_arr=reshape(str2double(bin_arr),1,[]);
            bin_arr(size(bin_arr)) = watermark(count);
            dec = b2d(bin_arr);
            scattered_img(f, g) = dec;
            count = count + 1;
            
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