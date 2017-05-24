function [temp_image] = read_img(fn)
    temp_image=imread(fn);
    temp_image = double(temp_image(:)); 
    