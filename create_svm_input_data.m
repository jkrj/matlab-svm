% create_svm_input_data.m

% function [data_matrix] = create_svm_input_data(output_list_train)
% % read the c3d feature(fc6) for each video, construct libsvm format data.
% 
%     dim_feat = 2048;
%     dir_list = importdata(output_list_train);
%     num_train_video = size(dir_list, 1);
%     data_matrix = zeros(num_train_video, dim_feat);
% 
% 
%     for i = 1 : num_train_video
%         i
%         feat_path = strcat(char(dir_list(i)), 'fft1.fc6');
%         data = read_binary_blob(feat_path);
% 
%         %normed_data = data / norm(data);
%         data_matrix(i, :) = data;
%     end
% 
% end




function [data_matrix] = create_svm_input_data(output_list_train)
% read the c3d feature(fc6) for each video, construct libsvm format data.

    dim_feat = 112*112;
    dir_list = importdata(output_list_train);
    num_train_video = size(dir_list, 1);
    data_matrix = zeros(num_train_video, dim_feat*32);
    for i = 1 : num_train_video
        i
        dir_str = char(dir_list(i));
        feat_files = dir([dir_str, 'dtft_*.jpg']);
        feat = zeros(16, dim_feat);
        for j = 1 : 32
                feat_path = strcat(dir_str, feat_files(j).name);
                feat(j,:) = read_img(feat_path);  
        end
        data=reshape(feat,1,[]);
        %normed_data = data / norm(data);
        data_matrix(i, :) = data;
    end

end