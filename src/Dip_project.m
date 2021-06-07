
%Seperation
ct_image = imread('ctscan.jpeg');
Tfinal = multithresh(ct_image);
border_img = padarray(ct_image,[1 1],0,'both');
[row,col] = size(border_img);
for i = 1:row
    for j = 1:col
        if border_img(i,j) > Tfinal
            border_img(i,j) = 255;
        end
    end
end
%tagging
tag_image = zeros(row,col);
for k = 1:row
    for l = 1:col
        if border_img(k,l) == 255
            tag_image(k,l) = 1;
        else
            tag_image(k,l) = 0;
        end
    end
end




imshow(border_img);








