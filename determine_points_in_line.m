function [ point_list ] = determine_points_in_line(pos_half,pos_count,neg_half,neg_count)
    ratios_pos_half=(pos_half(:,2)./pos_half(:,1));
    ratios_neg_half=(neg_half(:,2)./neg_half(:,1));
    if pos_count<neg_count
       for i=1:pos_count-1
           [~,j]=min(abs(ratios_neg_half-ratios_pos_half(i)));  % paired point index
           point_list(i,1)=i;
           point_list(i,2)=j;
       end
    else
        for j=1:neg_count-1
           [~,i]=min(abs(ratios_pos_half-ratios_neg_half(j)));  % paired point index
           point_list(j,1)=i;
           point_list(j,2)=j;
       end
    end
end
