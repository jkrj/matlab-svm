%% train_ucf101.m

function [model] = train_ucf101(label_file_path, data_file_path)%, varargin)
    label_int = load('train_lable.txt');
    label_double = double(label_int);
    data = create_svm_input_data('train_data.txt');
    %model = libsvmtrain(label_double, data, varargin{:});
    model = svmtrain(label_int,data,'-t 0');
end