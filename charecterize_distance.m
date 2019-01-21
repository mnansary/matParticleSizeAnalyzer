function [  min_width,max_width,x1_min,y1_min,x2_min,y2_min,x1_max,y1_max,x2_max,y2_max ] = charecterize_distance( point_list,pos_half,neg_half )
    [idx_pair_count,~]=size(point_list);
    for idx=1:idx_pair_count
        point1_idx=point_list(idx,1);
        point2_idx=point_list(idx,2);
        x1 = pos_half(point1_idx,1);
        y1 = pos_half(point1_idx,2);
        x2 = neg_half(point2_idx,1);
        y2 = neg_half(point2_idx,2);
        distance_data(idx)= sqrt((x1-x2)^2+(y1-y2)^2);
    end
    [min_width,idx_min] = min(distance_data);
    [max_width,idx_max] = max(distance_data);
    point1_idx=point_list(idx_min,1);
    point2_idx=point_list(idx_min,2);
    x1_min = pos_half(point1_idx,1);
    y1_min = pos_half(point1_idx,2);
    x2_min = neg_half(point2_idx,1);
    y2_min = neg_half(point2_idx,2);
    point1_idx=point_list(idx_max,1);
    point2_idx=point_list(idx_max,2);
    x1_max = pos_half(point1_idx,1);
    y1_max = pos_half(point1_idx,2);
    x2_max = neg_half(point2_idx,1);
    y2_max = neg_half(point2_idx,2);
end

