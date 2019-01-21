close all;
clear all;
clc
%% variables
image_file='testimage.jpg'; % image file to process
resize_dim=10000;            % resizing of image
filter_dim=20 ;             % mediun filter blob removal
compliment_flag=0;          % complement the binary depending on background          
scale_factor=1;             % real life dimension conversion
%% plot flags
plotting_binary_flag = 1;
%% preprocessing
fprintf('#Status:       Reading img file!\n');
img_data=imread(image_file);                % reading the image
fprintf('#Status:       Getting Threshold!\n');
threshold = graythresh(img_data);           % determining gray thresholding
fprintf('#Status:       Generating Binary!\n');
binary_image = im2bw(img_data,threshold);   % forming binary image based on threshold
fprintf('#Status:       Complementing Data (Based on Flag)!\n');
if compliment_flag==1                       % complementing depending on background
    binary_image = imcomplement(binary_image);  
end
fprintf('#Status:       Filling Holes!\n');
binary_image= imfill(binary_image,'holes');                     % hole filling
fprintf('#Status:       Mediun filtering!\n');
binary_image= medfilt2(binary_image,[filter_dim filter_dim]);   % mediun filtering
fprintf('#Status:       Resizing Image!\n');
binary_image=imresize(binary_image,[resize_dim resize_dim]);    % image resize 
if plotting_binary_flag==1
    fprintf('#Status:       Binary Image Figure....\n');
    % resized hole filled mediun filtered binary image
    figure('Name','Binary Data') 
    imshow(binary_image);
    title('Resized,hole filled,mediun filtered,binary image')
end
%% particle boundary detection
fprintf('#Status:       Detecting Boundaries!\n');
[boundaries,~,number_of_objects] = bwboundaries(binary_image,'noholes');       
fprintf('#Status:       Detected number of particles= %d \n',number_of_objects);
fprintf('#Status:       Detecting Centroids!\n');
centroids = regionprops(binary_image,'Centroid');
centroids = cat(1, centroids.Centroid);
fprintf('#Status:       Spliting Segments!\n');
for object_number=1:number_of_objects
    boundary= boundaries{object_number,1};      % boundary points
    centroid= centroids(object_number,:);       % centroid
    min_width=process_binary_segment(boundary,centroid,object_number);
    min_widths(object_number)=min_width;
end
min_widths=(min_widths/min_widths(1)) * scale_factor
    