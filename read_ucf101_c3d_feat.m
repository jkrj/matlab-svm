function []= read_ucf101_c3d_feat(output_list_relative)
% Read c3d features (fc6) for videos in ucf101 dataset.
% For each video, average all its features and get a video descriptor.

    % rather than fileread, importdata save each line separetely.
    dir_list = importdata(output_list_relative);

    dim_feat = 2048;

    for i = 1 : size(dir_list, 1)
        dir_str = char(dir_list(i));
        feat_files = dir([dir_str, '/*.fc6']);
        num_feat = length(feat_files);
        feat = zeros(num_feat, dim_feat);
        for j = 1 : num_feat
            if ~strcmp(feat_files(j).name,'c3d.fc6')
                feat_path = strcat(dir_str, '/', feat_files(j).name);
                [~, feat(j,:)] = read_binary_blob(feat_path);
            end
        end
        avg_feat = mean(feat, 1);
        avg_feat_double = double(avg_feat);
       fID = fopen(strcat(dir_str, '/c3d.fc6'), 'w');
        %fID = fopen('./c3d.fc6','w');
		% libsvm requires that input data must be double
        fwrite(fID, avg_feat_double, 'double');
        fclose(fID);
    end
end

