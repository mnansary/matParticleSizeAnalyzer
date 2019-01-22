function [min_width] = process_binary_segment( boundary,centroid,object_number,segment_plot_flag)
    fprintf('#Status:       Processing Binary Segment number: %d !\n',object_number);
    centroid_x=floor(centroid(1,1));
    centroid_y=floor(centroid(1,2));
    boundary(:,1)=boundary(:,1)-centroid_y;
    boundary(:,2)=boundary(:,2)-centroid_x;
    pos_count=1;
    neg_count=1;
    %% --point division
    for i=1:length(boundary)
        y=boundary(i,1);
        x=boundary(i,2);
        if(x>0)                                     % right half
            pos_half(pos_count,1)=x;
            pos_half(pos_count,2)=y;
            pos_count=pos_count+1;
        elseif(x<0)                                 % left half
            neg_half(neg_count,1)=x;
            neg_half(neg_count,2)=y;
            neg_count=neg_count+1;
        end   
    end
    %% --line determination
    point_list= determine_points_in_line(pos_half,pos_count,neg_half,neg_count); % pos neg
    [ min_width,max_width,x1_min,y1_min,x2_min,y2_min,x1_max,y1_max,x2_max,y2_max]= charecterize_distance(point_list,pos_half,neg_half);      
    if segment_plot_flag==1
        figure('Name','Particle Segment')
        plot_dim=ceil(max_width);
        x=boundary(:,2);
        y=boundary(:,1);
        plot(x,y,0,0,'r*');
        hold on
        xmin=[x1_min 0 x2_min];
        ymin=[y1_min 0 y2_min];
        plot(xmin,ymin)
        hold on
        xmax=[x1_max 0 x2_max];
        ymax=[y1_max 0 y2_max];
        plot(xmax,ymax)
        xlim([-plot_dim plot_dim])
        ylim([-plot_dim plot_dim]) 
        title(['Segment Number:',num2str(object_number)])
        legend('Boundary','Centroid','min distance line','max distance line')
    end
end
