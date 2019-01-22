# Matlab Implementation for particle Size detection

-- Md. Nazmuddoha Ansary 
-- Khaled Mahmood Ehsan 
# Kindly ignore any grammatical mistakes 

# Keep the (.m) files in same directory for running
--> process_binary_segment.m  
--> determine_points_in_line.m  
--> charecterize_distance.m  
--> main.m  
# Change the variables section in main.m
%% variables  
image_file='testimage.jpg';      
% image file to process      
resize_dim=10000;                
% resizing of image      
filter_dim=20 ;                  
% mediun filter blob removal      
compliment_flag=0;               
% complement the binary depending on background                
scale_factor=1;                  
% real life dimension conversion    
# image_file
-- This variable should contain the path and proper name and format of the image to be processed
# resize_dim
-- Resize according to need   
--> Example -1:  For a 10 particle image 3000  pixels should suffice  
--> Example -2:  For a 80 particle image 10000 pixels should suffice  
# filter_dim
-- The minimum square area to ignore as a particle  
# compliment_flag
-- Depending on the back ground of the image: white/black the binary image may be in need of complement  
--> for black background 0  
--> for white background 1  
# scale_factor
-- The known dimension object minimum dimension in inch/cm which ever is preferable  
-- The first object detected should be the known dimension reference object  
-- An example orientation of the image to such reference is provided in testimage.jpg  
-- In generall the reference object should be the left most object and should not contain any other objects at vertical spacing  
# For Tuning-- 
%% plot flags  
plotting_binary_flag = 1;  
--> Test suitable filter size if the image is still detecting smaller unwanted noise   
# X=0 axis addition--
-- If precision is necessary please add the note.txt code in the {if elseif} segment for point division in   process_binary_segment.m  
# Please feel free to propose any improvement and error correction
