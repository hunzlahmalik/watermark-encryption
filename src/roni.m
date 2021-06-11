function roni_img = roni(ROI, input_img)
    org_img = imread(input_img);
    roni_img = padarray(org_img,[1 1],0,'both');
    [row,col] = size(roni_img);
    for i =1:row
        for j=1:col
            if ROI(i,j) ~= 255
                roni_img(i,j) = 255;
            end
        end
    end
end