function RGB = plot_ground_truth_new(im, inputImageSize, data_true, i)
%     img_r = imresize(im,inputImageSize(1:2));
%     imshow(img_r);

    sz = size(im,[1 2]);
    scale = inputImageSize(1:2)./sz;
    box_r = [];
    bbox_color = cell(size(data_true.UnderlyingDatastores{1, 2}.LabelData{i, 2}, 1), 1);
    for j = 1:size(data_true.UnderlyingDatastores{1, 2}.LabelData{i, 2}, 1)
        box_r = [box_r; bboxresize(data_true.UnderlyingDatastores{1, 2}.LabelData{i, 1}(j,:), scale)];
        switch data_true.UnderlyingDatastores{1, 2}.LabelData{i, 2}(j)
            case 'SR'
                box_color = 'red';
            case 'APC'
                box_color = 'green';
            case 'VPC'
                box_color = 'blue';
            case 'LBBB'
                box_color = 'cyan';
            case 'RBBB'
                box_color = 'magenta';
            case 'Others'
                box_color = 'yellow';
        end
        bbox_color{j} = box_color;
    end
    RGB = insertObjectAnnotation(im,'rectangle', box_r, data_true.UnderlyingDatastores{1, 2}.LabelData{i, 2},...
        'TextBoxOpacity',0.9,'FontSize',18, ...
        'Color',bbox_color,'TextColor','black', ...
        'LineWidth', 2);
%     imshow(RGB)
end