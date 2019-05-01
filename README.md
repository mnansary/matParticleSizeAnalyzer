# Matlab Implementation for particle Size detection
![](/src_img/buet.ico?raw=true )
![](/src_img/mat.ico?raw=true )  

    Md. Nazmuddoha Ansary   
    Khaled Mahmood Ehsan  
# USEAGE
### Keep the (.m) files in same directory for running
    --> process_binary_segment.m  
    --> determine_points_in_line.m  
    --> charecterize_distance.m  
    --> main.m  
## Change the variables section in main.m
### image_file
    -- This variable should contain the path and proper name and format of the image to be processed
### resize_dim
    -- Resize according to need   
    --> Example -1:  For a 10 particle image 3000  pixels should suffice  
    --> Example -2:  For a 80 particle image 10000 pixels should suffice  
### filter_dim
    -- The minimum square area to ignore as a particle  
### compliment_flag
    -- Depending on the back ground of the image: white/black the binary image may be in need of complement  
    --> for black background 0  
    --> for white background 1  
### scale_factor
    -- The known dimension object minimum dimension in inch/cm which ever is preferable  
    -- The first object detected should be the known dimension reference object  
    -- In generall the reference object should be the left most object and should not contain any other objects at vertical spacing
# PUBLICATIONS
[Particle Size Analysis by Image processing Technique](https://www.researchgate.net/publication/313604059_Particle_Size_Analysis_by_Image_Processing_Technique)
