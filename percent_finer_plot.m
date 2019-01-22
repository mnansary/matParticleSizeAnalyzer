function [ ] = percent_finer_plot( y_dist,y_std)
    %% standard graph
    x_std=[1 0.75 0.5 0.375 0.25 0.187];
    fit_std = fit(x_std',y_std','poly2');
    fit_dist=fit(x_std',y_dist','poly2');
    y_std_fit=fit_std(x_std);
    y_dist_fit=fit_dist(x_std);
    
    figure('Name','Finer Semilog') 
    semilogx(x_std,y_std_fit)
    hold on
    semilogx(x_std,y_dist_fit)
    title('percent finer Graph: Standard vs Image')
    xlabel('size(inchs)in log scale')
    ylabel('percent finer linear scale')
    grid on 
    for k=1:numel(x_std)
          text(x_std(k),y_std_fit(k),['(' num2str(x_std(k)) ',' num2str(y_std_fit(k)) ')'])
    end
    for k=1:numel(x_std)
          text(x_std(k),y_dist_fit(k),['(' num2str(x_std(k)) ',' num2str(y_dist_fit(k)) ')'])
    end
    legend('standard finer graph','Percent finer from Image')
    
end

