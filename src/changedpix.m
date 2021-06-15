function output = changedpix(im1, im2)
    [rows, cols] = size(im1)
    count = 0;

    for i = 1:rows

        for j = 1:cols

            if im1(i, j) ~= im2(i, j)
                count = count + 1;
            end

        end

    end

    output = count;
end
